class Question {
  final String id;
  final int modulo;
  final String tema;
  final String dificultad;
  final String pregunta;
  final List<String> opciones;
  final int respuestaCorrecta;
  final String explicacion;

  Question({
    required this.id,
    required this.modulo,
    required this.tema,
    required this.dificultad,
    required this.pregunta,
    required this.opciones,
    required this.respuestaCorrecta,
    required this.explicacion,
  });
}
