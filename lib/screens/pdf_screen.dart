import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  final int initialPage; // 1-based
  const PdfScreen({super.key, this.initialPage = 1});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late final PdfViewerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guía Nacional de Conducción')),
      body: SfPdfViewer.asset(
        'assets/pdf/guia_nacional_conduccion.pdf',
        controller: _controller,
        onDocumentLoaded: (_) {
          if (widget.initialPage > 1) {
            _controller.jumpToPage(widget.initialPage);
          }
        },
      ),
    );
  }
}
