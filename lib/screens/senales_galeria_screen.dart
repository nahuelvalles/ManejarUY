import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../senales_filtro.dart';

class SenalesGaleriaScreen extends StatefulWidget {
  final SenalesFiltro filtro;
  const SenalesGaleriaScreen({super.key, required this.filtro});

  @override
  State<SenalesGaleriaScreen> createState() => _SenalesGaleriaScreenState();
}

class _SenalesGaleriaScreenState extends State<SenalesGaleriaScreen> {
  late Future<List<String>> _futureAssets;

  @override
  void initState() {
    super.initState();
    _futureAssets = _loadAssets(widget.filtro);
  }

  String get _title {
    switch (widget.filtro) {
      case SenalesFiltro.reglamentarias:
        return 'Reglamentarias';
      case SenalesFiltro.preventivas:
        return 'Preventivas';
      case SenalesFiltro.manuales:
        return 'Manuales';
      case SenalesFiltro.todas:
        return 'Todas';
    }
  }

  Future<List<String>> _loadAssets(SenalesFiltro filtro) async {
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

    List<String> filtered;

    if (filtro == SenalesFiltro.reglamentarias) {
      filtered = images.where((p) => p.startsWith(regPrefix)).toList();
    } else if (filtro == SenalesFiltro.preventivas) {
      filtered = images.where((p) => p.startsWith(prevPrefix)).toList();
    } else if (filtro == SenalesFiltro.manuales) {
      // SOLO las manuales “nuevas”: empiezan con m_
      filtered = images
          .where((p) =>
              p.startsWith(manPrefix) && p.split('/').last.startsWith('m_'))
          .toList();
    } else {
      // TODAS:
      // - reglamentarias
      // - preventivas
      // - manuales SOLO m_
      filtered = images.where((p) {
        if (p.startsWith(regPrefix)) return true;
        if (p.startsWith(prevPrefix)) return true;
        if (p.startsWith(manPrefix) && p.split('/').last.startsWith('m_')) {
          return true;
        }
        return false;
      }).toList();
    }

    // Orden: reglamentarias -> preventivas -> manuales
    filtered.sort((a, b) {
      int group(String p) {
        if (p.startsWith(regPrefix)) return 0;
        if (p.startsWith(prevPrefix)) return 1;
        if (p.startsWith(manPrefix)) return 2;
        return 3;
      }

      int numFrom(String p) {
        final file = p.split('/').last;

        // Manuales: "m_12_algo.png" o "m_algo.png"
        if (file.startsWith('m_')) {
          final rest = file.substring(2); // quita "m_"
          final part = rest.split('_').first;
          return int.tryParse(part) ?? 0;
        }

        // Otras: "10_algo.png"
        final part = file.split('_').first;
        return int.tryParse(part) ?? 0;
      }

      final ga = group(a);
      final gb = group(b);
      if (ga != gb) return ga.compareTo(gb);

      final na = numFrom(a);
      final nb = numFrom(b);
      if (na != nb) return na.compareTo(nb);

      return a.compareTo(b);
    });

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Señales - $_title')),
      body: FutureBuilder<List<String>>(
        future: _futureAssets,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error cargando imágenes:\n${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }

          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return const Center(
              child: Text(
                'No se encontraron imágenes.\nRevisá pubspec.yaml y assets/',
                textAlign: TextAlign.center,
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: items.length,
            itemBuilder: (_, index) {
              final path = items[index];

              return Padding(
                padding: const EdgeInsets.all(6),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => _SenalViewerScreen(
                          assets: items,
                          initialIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(4),
                    child: Transform.scale(
                      scale: 1.50,
                      child: Image.asset(path, fit: BoxFit.contain),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _SenalViewerScreen extends StatefulWidget {
  final List<String> assets;
  final int initialIndex;

  const _SenalViewerScreen({required this.assets, required this.initialIndex});

  @override
  State<_SenalViewerScreen> createState() => _SenalViewerScreenState();
}

class _SenalViewerScreenState extends State<_SenalViewerScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vista')),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.assets.length,
        itemBuilder: (_, i) {
          final path = widget.assets[i];
          return Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(path),
              ),
            ),
          );
        },
      ),
    );
  }
}
