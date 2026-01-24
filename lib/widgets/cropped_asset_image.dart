import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

/// Muestra una imagen desde assets, recortando un % inferior (útil para quitar texto impreso en la señal).
class CroppedAssetImage extends StatefulWidget {
  final String assetPath;

  /// % que recorta desde abajo (0.0 a 1.0).
  /// Ej: 0.38 recorta el 38% inferior (donde suele estar el texto).
  final double cropBottomPercent;

  /// Cómo ajustar la imagen al espacio disponible.
  final BoxFit fit;

  final Alignment alignment;

  const CroppedAssetImage({
    super.key,
    required this.assetPath,
    this.cropBottomPercent = 0.38,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  @override
  State<CroppedAssetImage> createState() => _CroppedAssetImageState();
}

class _CroppedAssetImageState extends State<CroppedAssetImage> {
  Uint8List? _bytes;

  @override
  void initState() {
    super.initState();
    _loadAndCrop();
  }

  @override
  void didUpdateWidget(covariant CroppedAssetImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assetPath != widget.assetPath ||
        oldWidget.cropBottomPercent != widget.cropBottomPercent) {
      _loadAndCrop();
    }
  }

  Future<void> _loadAndCrop() async {
    setState(() => _bytes = null);

    final data = await rootBundle.load(widget.assetPath);
    final raw = data.buffer.asUint8List();

    final decoded = img.decodeImage(raw);
    if (decoded == null) {
      if (!mounted) return;
      setState(() => _bytes = raw);
      return;
    }

    final w = decoded.width;
    final h = decoded.height;

    final cropH = (h * (1.0 - widget.cropBottomPercent)).round().clamp(1, h);
    final cropped = img.copyCrop(decoded, x: 0, y: 0, width: w, height: cropH);

    final encoded = img.encodePng(cropped);
    if (!mounted) return;
    setState(() => _bytes = Uint8List.fromList(encoded));
  }

  @override
  Widget build(BuildContext context) {
    if (_bytes == null) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    return Image.memory(
      _bytes!,
      fit: widget.fit,
      alignment: widget.alignment,
    );
  }
}
