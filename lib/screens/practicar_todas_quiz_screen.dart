import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/senal_labeler.dart';
import '../data/senales_todas.dart';
import '../data/senal_model.dart';
import '../widgets/cropped_asset_image.dart';

TipoSenal _tipoFromAssetPath(String asset) {
  final a = asset.toLowerCase();

  if (a.contains('senales_reglamentarias')) return TipoSenal.reglamentaria;
  if (a.contains('senales_preventivas')) return TipoSenal.preventiva;

  // Si tu enum NO tiene "manual", dejamos preventiva por defecto.
  return TipoSenal.preventiva;
}

class PracticarTodasQuizScreen extends StatefulWidget {
  const PracticarTodasQuizScreen({super.key});

  @override
  State<PracticarTodasQuizScreen> createState() =>
      _PracticarTodasQuizScreenState();
}

class _PracticarTodasQuizScreenState extends State<PracticarTodasQuizScreen> {
  final _rand = Random();

  late Future<void> _futureInit;

  List<Senal> _pool = [];
  Senal? _actual;
  List<String> _opciones = [];

  int? _seleccion;
  int _correctas = 0;
  int _idx = 0;

  @override
  void initState() {
    super.initState();
    _futureInit = _init();
  }

  Future<void> _init() async {
    // 1) pool base (reglamentarias + preventivas) desde tu lista ya armada
    final base = List<Senal>.of(senalesTodas);

    // 2) manuales m_* desde assets
    final manuales = await _loadSenalesManualesMOnly();

    // 3) combinar + evitar duplicados por asset
    final byAsset = <String, Senal>{};
    for (final s in base) {
      byAsset[s.asset] = s;
    }
    for (final s in manuales) {
      byAsset[s.asset] = s;
    }

    _pool = byAsset.values.toList()..shuffle(_rand);

    _idx = 0;
    _correctas = 0;
    _seleccion = null;
    _opciones = [];
    _actual = null;

    if (_pool.isNotEmpty) {
      _nuevoTurno(noSetState: true); // preparamos turno sin setState extra
    }

    // Ahora sí, refrescamos una sola vez
    if (mounted) setState(() {});
  }

  Future<List<Senal>> _loadSenalesManualesMOnly() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final paths = manifest.listAssets();

    const manPrefix = 'assets/senales_manuales/';

    final images = paths.where((p) {
      final lower = p.toLowerCase();
      final isImage =
          lower.endsWith('.png') ||
          lower.endsWith('.jpg') ||
          lower.endsWith('.jpeg') ||
          lower.endsWith('.webp');
      if (!isImage) return false;

      if (!p.startsWith(manPrefix)) return false;

      final file = p.split('/').last;
      return file.startsWith('m_'); // ✅ SOLO manuales reales
    }).toList();

    images.sort();

    return images
        .map<Senal>(
          (asset) => Senal(
            nombre: senalLabelFromAssetPath(asset),
            asset: asset,
            tipo: _tipoFromAssetPath(asset),
          ),
        )
        .toList();
  }

  void _nuevoTurno({bool noSetState = false}) {
    if (_pool.isEmpty) return;
    if (_idx < 0 || _idx >= _pool.length) _idx = 0;

    _actual = _pool[_idx];
    _seleccion = null;

    final correct = _actual!.nombre;

    final incorrectas = <String>{};
    int safe = 0;
    while (incorrectas.length < 3 && safe < 999) {
      safe++;
      final candidata = _pool[_rand.nextInt(_pool.length)].nombre;
      if (candidata != correct) incorrectas.add(candidata);
    }

    _opciones = [correct, ...incorrectas.toList()]..shuffle(_rand);

    if (!noSetState && mounted) setState(() {});
  }

  void _responder(int i) {
    if (_seleccion != null || _actual == null) return;

    setState(() {
      _seleccion = i;
      final ok = _opciones[i] == _actual!.nombre;
      if (ok) _correctas++;
    });
  }

  void _siguiente() {
    if (_pool.isEmpty) return;

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
            onPressed: () async {
              Navigator.pop(context);
              setState(() {
                _futureInit = _init();
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
    return FutureBuilder<void>(
      future: _futureInit,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (_pool.isEmpty || _actual == null || _opciones.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('No hay señales para practicar.')),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text('Todas (${_idx + 1}/${_pool.length})')),
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
                        assetPath: _actual!.asset,
                        cropBottomPercent: 0.40, // recorta el texto
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
                        final isCorrect = text == _actual!.nombre;
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
      },
    );
  }
}
