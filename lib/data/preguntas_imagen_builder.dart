import 'dart:math';
import 'package:flutter/services.dart';
import 'preguntas_examen.dart';

/// Genera preguntas de examen basadas en imágenes de señales.
///
/// - Toma imágenes desde:
///   - assets/senales_reglamentarias/
///   - assets/senales_preventivas/
///   - assets/senales_manuales/
/// - La respuesta correcta se deriva del nombre del archivo.
/// - Las incorrectas se eligen del "pool" de todas las señales encontradas.
///
/// Nota: se filtran etiquetas como "No existe" para evitar preguntas sin sentido.
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

  // Señales candidatas: cualquiera dentro de esas 3 carpetas.
  final senales = images.where((p) {
    if (p.startsWith(regPrefix)) return true;
    if (p.startsWith(prevPrefix)) return true;
    if (p.startsWith(manPrefix)) return true;
    return false;
  }).toList();

  if (senales.isEmpty) return const <PreguntaExamen>[];

  // Pool de etiquetas (respuestas).
  final pool = senales
      .map(_senalLabelFromAssetPath)
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
    final correcta = _senalLabelFromAssetPath(asset).trim();

    // Si por alguna razón quedó inválida, saltamos la señal.
    if (correcta.isEmpty || _isLabelInvalida(correcta)) continue;

    // 1 correcta + (opcionesPorPregunta - 1) incorrectas
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

  // Por si se filtraron varias por inválidas.
  preguntas.shuffle(rand);
  return preguntas.take(cantidad).toList();
}

bool _isLabelInvalida(String label) {
  final l = label.toLowerCase().trim();
  // Evita "No existe", y otros nombres que suelen ser basura.
  if (l == 'no existe' || l.contains('no_existe') || l.contains('no existe')) {
    return true;
  }
  // Si quedó muy corto, suele ser un "u", "t", etc.
  if (l.length <= 2) return true;
  return false;
}

/// Convierte un assetPath a una etiqueta “bonita” (para mostrar como respuesta).
///
/// Ejemplos:
/// - assets/senales_preventivas/37_cruce_peatones.png -> "Cruce peatones"
/// - assets/senales_manuales/m_detener_todo_el_transito_general.png -> "Detener todo el tránsito general"
String _senalLabelFromAssetPath(String assetPath) {
  final file = assetPath.split('/').last;
  var name = file.replaceAll(RegExp(r'\.(png|jpg|jpeg|webp)$', caseSensitive: false), '');

  // Quitar prefijos típicos:
  // - m_
  // - 12_
  // - 12- (por si acaso)
  name = name.replaceFirst(RegExp(r'^m_'), '');
  name = name.replaceFirst(RegExp(r'^\d+[_-]'), '');

  // Normalizar
  name = name.replaceAll('-', '_');
  name = name.replaceAll('_', ' ');
  name = name.replaceAll(RegExp(r'\s+'), ' ').trim();

  // Reemplazos comunes (para mejorar legibilidad)
  final lowerWords = <String>{
    'de', 'del', 'la', 'el', 'y', 'o', 'a', 'al', 'en', 'con', 'sin', 'por', 'para'
  };

  // Arreglos simples de acentos comunes (no perfecto, pero ayuda)
  name = name
      .replaceAll(RegExp(r'\bsemaforo\b', caseSensitive: false), 'semáforo')
      .replaceAll(RegExp(r'\bpeatones\b', caseSensitive: false), 'peatones')
      .replaceAll(RegExp(r'\bpeaton\b', caseSensitive: false), 'peatón')
      .replaceAll(RegExp(r'\bproximamente\b', caseSensitive: false), 'próximamente')
      .replaceAll(RegExp(r'\bprox\b', caseSensitive: false), 'próx.');

  // Title case suave
  final words = name.split(' ');
  final out = <String>[];
  for (var i = 0; i < words.length; i++) {
    final w = words[i];
    if (w.isEmpty) continue;
    final lw = w.toLowerCase();

    if (i > 0 && lowerWords.contains(lw)) {
      out.add(lw);
    } else {
      out.add(lw[0].toUpperCase() + lw.substring(1));
    }
  }
  return out.join(' ').trim();
}
