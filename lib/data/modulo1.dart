 import '../models/question.dart';

final List<Question> modulo1Preguntas = [
  Question(
    id: 'M1_P01',
    modulo: 1,
    tema: 'Permiso de conducir',
    dificultad: 'facil',
    pregunta: '¿Qué representa el permiso de conducir?',
    opciones: [
      'Un derecho automático',
      'Un privilegio otorgado',
      'Un documento opcional',
    ],
    respuestaCorrecta: 1,
    explicacion:
        'Conducir es un privilegio que se obtiene al cumplir requisitos.',
  ),
  Question(
    id: 'M1_P02',
    modulo: 1,
    tema: 'Responsabilidad',
    dificultad: 'facil',
    pregunta: '¿Quién otorga el permiso de conducir en Uruguay?',
    opciones: [
      'La Policía',
      'Las Intendencias',
      'El Ministerio del Interior',
    ],
    respuestaCorrecta: 1,
    explicacion:
        'Las Intendencias Departamentales son las responsables.',
  ),
];
