import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual de conducción'),
      ),
      body: SfPdfViewer.asset(
        'assets/pdfs/guia_conduccion_uy.pdf',
      ),
    );
  }
}
