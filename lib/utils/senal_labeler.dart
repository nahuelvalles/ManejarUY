// lib/utils/senal_labeler.dart

/// Mapeo oficial de asset filename -> texto humano.
///
/// Key = "<tipo>/<key>" donde:
/// - tipo: preventivas | reglamentarias | manuales
/// - key: nombre de archivo sin extensión ni prefijos (m_, x_, 12_, etc.)
const Map<String, String> senalOverrides = {
  // =========================
  // PREVENTIVAS
  // =========================
  'preventivas/pronunciada_izq': "Curva pronunciada a la izquierda",
  'preventivas/pronunciada_der': "Curva pronunciada a la derecha",
  'preventivas/peligrosa_izq': "Curva peligrosa a la izquierda",
  'preventivas/peligrosa_der': "Curva peligrosa a la derecha",
  'preventivas/sinuoso_izq': "Camino sinuoso a la izquierda",
  'preventivas/sinuoso_der': "Camino sinuoso a la derecha",
  'preventivas/pronunciada_s_izq': "Curva pronunciada en 'S' a la izquierda",
  'preventivas/pronunciada_s_der': "Curva pronunciada en 'S' a la derecha",
  'preventivas/contracurva_izq': "Curva y contracurva a la izquierda",
  'preventivas/contracurva_der': "Curva y contracurva a la derecha",
  'preventivas/interseccion_vias': "Intersección de vías",
  'preventivas/via_lateral_der': "Vía lateral a la derecha",
  'preventivas/via_lateral_izq': "Vía lateral a la izquierda",
  // OJO: tu filename es "bifurccion_t" (sin la 'a'), lo dejamos igual.
  'preventivas/bifurccion_t': "Bifurcación en 'T'",
  'preventivas/bifurcacion_y': "Bifurcación en 'Y'",
  'preventivas/bifurcacion_y_izq': "Bifurcación en 'Y' a la izquierda",
  'preventivas/incorporacion_izq': "Incorporación de tránsito a la izquierda",
  'preventivas/incorporacion_der': "Incorporación de tránsito a la derecha",
  'preventivas/prox_semaforo': "Proximidad de semáforo",
  'preventivas/interseccion_rotatoria': "Intersección rotatoria (rotonda)",
  'preventivas/pendiente_peligrosa_bajada': "Pendiente peligrosa en bajada",
  'preventivas/pendiente_peligrosa_subida': "Pendiente peligrosa en subida",
  'preventivas/calzada_estrecha': "Calzada estrecha",
  'preventivas/calzada_estrecha_izq': "Calzada estrecha a la izquierda",
  'preventivas/puente_angosto': "Puente angosto",
  'preventivas/puente_movil': "Puente móvil",
  'preventivas/obras': "Obras",
  'preventivas/doble_circulacion': "Doble circulación",
  'preventivas/tranvia': "Señal de tranvía",
  'preventivas/camino_aspero': "Camino áspero/despertadores",
  'preventivas/resalto': "Resalto (Lomo de burro)",
  'preventivas/depresion': "Depresión",
  'preventivas/nivel_barrera': "Paso a nivel con barrera",
  'preventivas/calzada_resbaladiza': "Calzada resbaladiza",
  'preventivas/gravilla': "Proyección de gravilla",
  'preventivas/ciclistas': "Ciclistas",
  'preventivas/maquinaria_agricola': "Paso de maquinaria agrícola",
  'preventivas/cruce_peatones': "Cruce de peatones",
  'preventivas/zona_escolar': "Zona escolar",
  'preventivas/ninos': "Niños",
  'preventivas/paso_ganado': "Paso de ganado",
  'preventivas/nivel_sin_barrera': "Paso a nivel sin barrera",
  'preventivas/altura_limitada': "Altura limitada",
  'preventivas/ancho_limitado': "Ancho limitado",

  // =========================
  // REGLAMENTARIAS
  // =========================
  'reglamentarias/pare': "Pare",
  'reglamentarias/ceda_paso': "Ceda el paso",
  'reglamentarias/prohibido_adelante':
      "Prohibido seguir adelante (dirección prohibida)",
  'reglamentarias/prohibido_izq': "Prohibido girar a la izquierda",
  'reglamentarias/prohibido_der': "Prohibido girar a la derecha",
  'reglamentarias/prohibido_u': "Prohibido girar en 'U'",
  'reglamentarias/prohibido_estacionar': "Prohibido estacionar",
  'reglamentarias/estacionamiento_reglamentado': "Estacionamiento reglamentado",
  'reglamentarias/prohibido_estacionar_detenerse':
      "Prohibido estacionar y detenerse",
  'reglamentarias/prohibido_traccion_sangre':
      "Prohibido el paso de carretas de tracción a sangre",
  'reglamentarias/prohibido_bicicletas': "Prohibido bicicletas",
  'reglamentarias/prohibido_agricola':
      "Prohibido el paso de maquinaria agrícola",
  'reglamentarias/prohibido_peatones': "Prohibido el paso de peatones",
  'reglamentarias/altura_maxima': "Altura máxima permitida",
  'reglamentarias/ancho_maximo': "Ancho máximo permitido",
  'reglamentarias/derecha_solamente': "Giro a la derecha solamente",
  'reglamentarias/velocidad_max': "Velocidad máxima permitida",
  'reglamentarias/conserve_derecha': "Conserve su derecha",
  'reglamentarias/circulacion_obligatoria': "Circulación obligatoria",
  'reglamentarias/solamente_izq': "Giro a la izquierda solamente",
  'reglamentarias/prohibido_adelantar': "Prohibido adelantar",
  'reglamentarias/contramano': "Contramano",
  'reglamentarias/prohibido_vehiculo_carga':
      "Prohibido el paso de vehículos de carga",
  'reglamentarias/prohibido_paso_automotores':
      "Prohibido el paso de vehículos automotores",

  // =========================
  // MANUALES
  // =========================
  'manuales/brazo_hacia_abajo_para_detenerse': "Detenerse",
  'manuales/brazo_horizontal_izquierda': "Giro a la izquierda",
  'manuales/brazo_levantado_derecha': "Giro a la derecha",
  'manuales/desvio_hacia_el_lugar_indicado': "Desvío hacia el lugar indicado",
  'manuales/detener_el_vehiculo_sobre_lugar_indicado':
      "Detener el vehículo sobre el lugar indicado",
  'manuales/detener_todo_el_transito_general': "Detención del tránsito en general",
  'manuales/detener_totalmente_la_marcha': "Detener totalmente la marcha",
  'manuales/habilita_seguir_giro_segun_indique':
      "Habilita seguir el giro según indique",
  'manuales/ancho_maximo': "Ancho máximo",
  'manuales/cruce_peatones': "Cruce de peatones",
  'manuales/prohibido_estacionar_detenerse': "Prohibido estacionar y detenerse",
  'manuales/prohibido_u': "Prohibido girar en 'U'",
  'manuales/zona_escolar': "Zona escolar",
};

String senalLabelFromAssetPath(String assetPath) {
  final file = assetPath.split('/').last;
  var raw = file.replaceAll(RegExp(r'\.(png|jpg|jpeg|webp)$', caseSensitive: false), '');

  // Tipo/carpeta (para evitar colisiones entre carpetas)
  String tipo = 'otras';
  final a = assetPath.toLowerCase();
  if (a.contains('/senales_preventivas/')) tipo = 'preventivas';
  if (a.contains('/senales_reglamentarias/')) tipo = 'reglamentarias';
  if (a.contains('/senales_manuales/')) tipo = 'manuales';

  // Quitar prefijos típicos
  raw = raw.replaceFirst(RegExp(r'^(m|x)_', caseSensitive: false), '');
  raw = raw.replaceFirst(RegExp(r'^\d+[_-]'), '');

  // Lookup directo
  final key = raw.toLowerCase().replaceAll('-', '_').trim();
  final override = senalOverrides['$tipo/$key'];
  if (override != null) return override;

  // Fallback “legible” (por si aparece un asset nuevo sin mapping)
  var name = raw.replaceAll('-', '_').replaceAll('_', ' ').trim();
  name = name.replaceAll(RegExp(r'\s+'), ' ');

  // der/izq -> a la derecha/izquierda
  final lower0 = name.toLowerCase();
  if (lower0.endsWith(' der')) {
    name = name.substring(0, name.length - 4).trim() + ' a la derecha';
  } else if (lower0.endsWith(' izq')) {
    name = name.substring(0, name.length - 4).trim() + ' a la izquierda';
  }

  // Title case suave
  final lowerWords = <String>{
    'de','del','la','el','y','o','a','al','en','con','sin','por','para'
  };

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
