import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/senal_model.dart';
import '../widgets/cropped_asset_image.dart';
import '../utils/senal_labeler.dart';

class PracticarManualesQuizScreen extends StatefulWidget {
  const PracticarManualesQuizScreen({super.key});

  @override
  State<PracticarManualesQuizScreen> createState() =>
      _PracticarManualesQuizScreenState();
}

class _PracticarManualesQuizScreenState
    extends State<PracticarManualesQuizScreen> {
  final _rand = Random();

  List<Senal> _pool = [];
  Senal? _actual;
  List<String> _opciones = [];

  int? _seleccion;
  int _correctas = 0;
  int _idx = 0;

  @override
  void initState() {
    super.initState();
    _cargarSenales();
  }

  Future<void> _cargarSenales() async {
    final manifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    final paths = manifest.listAssets();

    const manPrefix = 'assets/senales_manuales/';

    final manualesPaths = paths.where((p) {
      final lower = p.toLowerCase();
      final isImage =
          lower.endsWith('.png') ||
          lower.endsWith('.jpg') ||
          lower.endsWith('.jpeg') ||
          lower.endsWith('.webp');

      if (!isImage) return false;
      if (!p.startsWith(manPrefix)) return false;

      final file = p.split('/').last;
      return file.startsWith('m_');
    }).toList();

    if (manualesPaths.isEmpty) {
      setState(() => _pool = []);
      return;
    }

    final senales = manualesPaths.map((asset) {
      final nombre = senalLabelFromAssetPath(asset);
      return Senal(asset: asset, nombre: nombre, tipo: TipoSenal.preventiva);
    }).toList();

    senales.shuffle(_rand);

    setState(() {
      _pool = senales;
      _idx = 0;
      _correctas = 0;
      _seleccion = null;
      _nuevoTurno();
    });
  }

  void _nuevoTurno() {
    if (_pool.isEmpty) return;

    _actual = _pool[_idx];
    _seleccion = null;

    final correct = _actual!.nombre;
    final nombres = _pool.map((s) => s.nombre).toList();

    final incorrectas = <String>{};
    while (incorrectas.length < 3 && nombres.length > 1) {
      final candidata = nombres[_rand.nextInt(nombres.length)];
      if (candidata != correct) incorrectas.add(candidata);
    }

    _opciones = [correct, ...incorrectas.toList()]..shuffle(_rand);
    setState(() {});
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
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _pool.shuffle(_rand);
                _idx = 0;
                _correctas = 0;
                _seleccion = null;
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
    if (_pool.isEmpty && _actual == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Manuales')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (_pool.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Manuales')),
        body: const Center(
          child: Text(
            'No se encontraron señales manuales.\n'
            'Revisá que estén en assets/senales_manuales/\n'
            'y que comiencen con "m_".',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final actual = _actual!;
    if (_opciones.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Manuales')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Manuales (${_idx + 1}/${_pool.length})')),
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
                    assetPath: actual.asset,
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
                    final isCorrect = text == actual.nombre;
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
                        style: ElevatedButton.styleFrom(backgroundColor: bg),
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
