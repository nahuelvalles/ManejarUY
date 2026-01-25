import 'dart:math';
import 'package:flutter/services.dart';
import 'preguntas_examen.dart';
import '../utils/senal_labeler.dart';

Future<List<PreguntaExamen>> buildPreguntasImagen({
  int cantidad = 4,
  int opcionesPorPregunta = 4,
  int? seed,
}) async {
  final rand = Random(seed);

  final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
  final paths = manifest.listAssets();

  final images = paths.where((p) {
    final lower = p.toLowerCase();
    return lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.webp');
  }).toList();

  const regPrefix = 'assets/senales_reglamentarias/';
  const prevPrefix = 'assets/senales_preventivas/';
  const manPrefix = 'assets/senales_manuales/';

  final senales = images.where((p) {
    if (p.startsWith(regPrefix)) return true;
    if (p.startsWith(prevPrefix)) return true;
    if (p.startsWith(manPrefix)) return true;
    return false;
  }).toList();

  if (senales.isEmpty) return const <PreguntaExamen>[];

  final pool = senales
      .map(senalLabelFromAssetPath)
      .where((l) => l.trim().isNotEmpty)
      .where((l) => !_isLabelInvalida(l))
      .toSet()
      .toList()
    ..sort();

  if (pool.length < opcionesPorPregunta) return const <PreguntaExamen>[];

  senales.shuffle(rand);
  final takeN = cantidad.clamp(0, senales.length);
  final picked = senales.take(takeN).toList();

  final preguntas = <PreguntaExamen>[];

  for (final asset in picked) {
    final correcta = senalLabelFromAssetPath(asset).trim();
    if (correcta.isEmpty || _isLabelInvalida(correcta)) continue;

    final incorrectas = pool.where((l) => l != correcta).toList();
    if (incorrectas.length < opcionesPorPregunta - 1) continue;

    incorrectas.shuffle(rand);
    final opciones = <String>[
      correcta,
      ...incorrectas.take(opcionesPorPregunta - 1),
    ]..shuffle(rand);

    final idxCorrecta = opciones.indexOf(correcta);
    if (idxCorrecta < 0) continue;

    preguntas.add(
      PreguntaExamen(
        pregunta: '¿Qué indica la siguiente señal?',
        opciones: opciones,
        respuestaCorrecta: idxCorrecta,
        imagenAsset: asset,
      ),
    );
  }

  preguntas.shuffle(rand);
  return preguntas.take(cantidad).toList();
}

bool _isLabelInvalida(String label) {
  final l = label.toLowerCase().trim();
  if (l == 'no existe' || l.contains('no_existe') || l.contains('no existe')) {
    return true;
  }
  if (l.length <= 2) return true;
  return false;
}
