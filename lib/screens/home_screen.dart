import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../quiz_modo.dart';
import 'examen_quiz_screen.dart';
import 'manual_indice_screen.dart';
import 'senales_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Image.asset(
              'assets/images/ManejarUY_logo.png',
              width: 34,
              height: 34,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 8),
            const Text(
              'ManejarUY',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: abrir settings cuando lo tengas
            },
            icon: const Icon(Icons.settings_rounded, color: AppColors.text),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
        children: [
          const Text(
            '¿Qué querés aprender hoy?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),

          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.05,
            children: [
              _HomeCard(
                icon: Icons.edit_document,
                title: 'Exámen completo',
                subtitle: 'Simulá el test',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExamenQuizScreen(modo: QuizModo.examenCompleto),
                    ),
                  );
                },
              ),
              _HomeCard(
                icon: Icons.traffic_rounded,
                title: 'Señales',
                subtitle: 'Repasá o practicá',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SenalesScreen()),
                  );
                },
              ),
              _HomeCard(
                icon: Icons.menu_book_rounded,
                title: 'Guía Nacional de Conducción',
                subtitle: 'Leé por temas',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ManualIndiceScreen()),
                  );
                },
              ),
              _HomeCard(
                icon: Icons.flash_on_rounded,
                title: 'Exámen rápido',
                subtitle: 'Quiz express',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ExamenQuizScreen(modo: QuizModo.examenRapido),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  const _HomeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 44, color: AppColors.accent),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF6C7684),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
