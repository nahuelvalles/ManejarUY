import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'senales_estudiar_menu_screen.dart';
import 'practicar_senales_screen.dart';

class SenalesScreen extends StatelessWidget {
  const SenalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text(
          'Señales de Tránsito',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        children: [
          const Text(
            '¿Qué querés hacer?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Elegí una opción para estudiar o practicar las señales.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6C7684),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          _ActionCard(
            icon: Icons.menu_book_rounded,
            title: 'Estudiar',
            subtitle: 'Aprendé las señales por categoría',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SenalesEstudiarMenuScreen(),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          _ActionCard(
            icon: Icons.fact_check_rounded,
            title: 'Practicar',
            subtitle: 'Respondé preguntas tipo test',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PracticarSenalesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  const _ActionCard({
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
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: AppColors.accent,
                  size: 30,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6C7684),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFF8A93A0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
