import 'package:flutter/material.dart';
import '../data/modulo1.dart';
import '../quiz_modo.dart';

class QuizScreen extends StatefulWidget {
  final QuizModo modo;

  const QuizScreen({
    super.key,
    required this.modo,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int correctas = 0;
  int? seleccion;

  late List preguntas;

  @override
  void initState() {
    super.initState();

    preguntas = List.from(modulo1Preguntas)..shuffle();

    if (widget.modo == QuizModo.examenCompleto) {
      preguntas = preguntas.take(35).toList();
    } else {
      preguntas = preguntas.take(10).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = preguntas[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.modo == QuizModo.examenCompleto
              ? 'Examen completo'
              : 'Examen rápido',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              pregunta.pregunta,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...List.generate(pregunta.opciones.length, (i) {
              return ElevatedButton(
                onPressed: seleccion == null
                    ? () {
                        setState(() {
                          seleccion = i;
                          if (i == pregunta.respuestaCorrecta) {
                            correctas++;
                          }
                        });
                      }
                    : null,
                child: Text(pregunta.opciones[i]),
              );
            }),
            if (seleccion != null) ...[
              const SizedBox(height: 20),
              Text(pregunta.explicacion),
              ElevatedButton(
                onPressed: () {
                  if (index < preguntas.length - 1) {
                    setState(() {
                      index++;
                      seleccion = null;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Siguiente'),
              )
            ]
          ],
        ),
      ),
    );
  }
}
