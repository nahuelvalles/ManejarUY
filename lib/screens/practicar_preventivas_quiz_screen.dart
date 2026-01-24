import 'dart:math';
import 'package:flutter/material.dart';

import '../data/senales_preventivas.dart';
import '../data/senal_model.dart';
import '../widgets/cropped_asset_image.dart';

class PracticarPreventivasQuizScreen extends StatefulWidget {
  const PracticarPreventivasQuizScreen({super.key});

  @override
  State<PracticarPreventivasQuizScreen> createState() =>
      _PracticarPreventivasQuizScreenState();
}

class _PracticarPreventivasQuizScreenState
    extends State<PracticarPreventivasQuizScreen> {
  final _rand = Random();

  late List<Senal> _pool;
  late Senal _actual;
  late List<String> _opciones;

  int? _seleccion;
  int _correctas = 0;
  int _idx = 0;

  @override
  void initState() {
    super.initState();
    _pool = List.of(senalesPreventivas)..shuffle(_rand);
    _opciones = [];
    _nuevoTurno();
  }

  void _nuevoTurno() {
    _actual = _pool[_idx];
    _seleccion = null;

    final correct = _actual.nombre;

    final incorrectas = <String>{};
    while (incorrectas.length < 3) {
      final candidata = _pool[_rand.nextInt(_pool.length)].nombre;
      if (candidata != correct) incorrectas.add(candidata);
    }

    _opciones = [correct, ...incorrectas.toList()]..shuffle(_rand);
    setState(() {});
  }

  void _responder(int i) {
    if (_seleccion != null) return;

    setState(() {
      _seleccion = i;
      final ok = _opciones[i] == _actual.nombre;
      if (ok) _correctas++;
    });
  }

  void _siguiente() {
    if (_idx < _pool.length - 1) {
      _idx++;
      _nuevoTurno();
    } else {
      _mostrarResultado();
    }
  }

  void _mostrarResultado() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Resultado'),
        content: Text('Correctas: $_correctas / ${_pool.length}'),
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
                _pool = List.of(senalesPreventivas)..shuffle(_rand);
                _idx = 0;
                _correctas = 0;
                _nuevoTurno();
              });
            },
            child: const Text('Reintentar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_opciones.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Preventivas (${_idx + 1}/${_pool.length})'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: CroppedAssetImage(
                    assetPath: _actual.asset,
                    cropBottomPercent: 0.40,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            Expanded(
              flex: 5,
              child: Column(
                children: List.generate(_opciones.length, (i) {
                  final text = _opciones[i];

                  Color? bg;
                  if (_seleccion != null) {
                    final isCorrect = text == _actual.nombre;
                    final isSelected = i == _seleccion;
                    if (isCorrect) bg = Colors.green.withOpacity(0.15);
                    if (isSelected && !isCorrect) {
                      bg = Colors.red.withOpacity(0.15);
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bg,
                        ),
                        onPressed: () => _responder(i),
                        child: Text(text, textAlign: TextAlign.center),
                      ),
                    ),
                  );
                }),
              ),
            ),

            if (_seleccion != null)
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _siguiente,
                  child: Text(
                    _idx < _pool.length - 1 ? 'Siguiente' : 'Ver resultado',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
