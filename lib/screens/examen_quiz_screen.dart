import 'dart:math';
import 'package:flutter/material.dart';

import '../data/preguntas_examen.dart';
import '../data/preguntas_imagen_builder.dart';
import '../quiz_modo.dart';
import '../widgets/cropped_asset_image.dart';

class ExamenQuizScreen extends StatefulWidget {
  final QuizModo modo;
  const ExamenQuizScreen({super.key, required this.modo});

  @override
  State<ExamenQuizScreen> createState() => _ExamenQuizScreenState();
}

class _ExamenQuizScreenState extends State<ExamenQuizScreen> {
  late Future<List<PreguntaExamen>> _futurePreguntas;

  List<PreguntaExamen> _preguntas = const [];
  int _index = 0;
  int _correctas = 0;
  int? _seleccion;

  @override
  void initState() {
    super.initState();
    _futurePreguntas = _buildPreguntas();
  }

  Future<List<PreguntaExamen>> _buildPreguntas() async {
    final rand = Random();

    final cantidadTotal = widget.modo == QuizModo.examenCompleto ? 35 : 10;

    // Máximo 4 preguntas con imagen (y nunca más que el total del examen).
    final cantImagen = min(4, cantidadTotal);

    // Genero preguntas con imagen (con respuestas correctas derivadas del asset).
    final preguntasImg = await buildPreguntasImagen(
      cantidad: cantImagen,
      seed: rand.nextInt(1 << 31),
    );

    // Pool de preguntas normales (sin imagen).
    final base = preguntasExamen.where((p) => p.imagenAsset == null).toList()
      ..shuffle(rand);

    final cantBase = max(0, cantidadTotal - preguntasImg.length);
    final seleccionBase = base.take(cantBase).toList();

    final todas = <PreguntaExamen>[
      ...seleccionBase,
      ...preguntasImg,
    ]..shuffle(rand);

    return todas.take(cantidadTotal).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PreguntaExamen>>(
      future: _futurePreguntas,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (snap.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Examen')),
            body: Center(
              child: Text(
                'Error cargando preguntas:\n${snap.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        _preguntas = snap.data ?? const [];
        if (_preguntas.isEmpty) {
          return Scaffold(
            appBar: AppBar(title: const Text('Examen')),
            body: const Center(child: Text('No hay preguntas para mostrar.')),
          );
        }

        final p = _preguntas[_index];

        return Scaffold(
          appBar: AppBar(
            title: Text('Preguntas (${_index + 1}/${_preguntas.length})'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (p.imagenAsset != null) ...[
                  // Imagen recortada (quita el texto inferior para que no “spoilee” la respuesta).
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      color: Colors.white,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12),
                      child: CroppedAssetImage(
                        assetPath: p.imagenAsset!,
                        cropBottomPercent: 0.42, // recorta más para evitar texto
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                ],

                Text(p.pregunta, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 16),

                ...List.generate(p.opciones.length, (i) {
                  // Colores de feedback
                  Color? bg;
                  if (_seleccion != null) {
                    final isCorrect = i == p.respuestaCorrecta;
                    final isSelected = i == _seleccion;

                    // La correcta siempre verde
                    if (isCorrect) {
                      bg = Colors.green.withOpacity(0.18);
                    }

                    // Si eligió mal, la seleccionada roja
                    if (isSelected && !isCorrect) {
                      bg = Colors.red.withOpacity(0.18);
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (states) => bg,
                          ),
                          foregroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (states) => Colors.black,
                          ),
                        ),
                        onPressed: _seleccion == null
                            ? () {
                                setState(() {
                                  _seleccion = i;
                                  if (i == p.respuestaCorrecta) _correctas++;
                                });
                              }
                            : null,
                        child: Text(
                          p.opciones[i],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                }),

                const Spacer(),

                if (_seleccion != null)
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_index < _preguntas.length - 1) {
                          setState(() {
                            _index++;
                            _seleccion = null;
                          });
                        } else {
                          _mostrarResultado();
                        }
                      },
                      child: Text(
                        _index < _preguntas.length - 1
                            ? 'Siguiente'
                            : 'Ver resultado',
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _mostrarResultado() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Resultado'),
        content: Text('Correctas: $_correctas / ${_preguntas.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Salir'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _index = 0;
                _correctas = 0;
                _seleccion = null;
                _futurePreguntas = _buildPreguntas(); // re-genera (incluye nuevas imágenes)
              });
            },
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
