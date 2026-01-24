import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class ModulosScreen extends StatelessWidget {
  const ModulosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Módulos')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Módulo 1 – Permiso de conducir'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const QuizScreen(
                    modo: QuizModo.examenCompleto,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
