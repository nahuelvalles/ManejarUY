import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../senales_filtro.dart';
import 'senales_galeria_screen.dart';

class SenalesEstudiarMenuScreen extends StatelessWidget {
  const SenalesEstudiarMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text(
          'Estudiar Señales',
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
            'Elegí una categoría',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Explorá las señales según su tipo.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF6C7684),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),

          _CategoryCard(
            icon: Icons.block_rounded,
            title: 'Reglamentarias',
            subtitle: 'Prohibiciones y obligaciones',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SenalesGaleriaScreen(
                    filtro: SenalesFiltro.reglamentarias,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          _CategoryCard(
            icon: Icons.warning_amber_rounded,
            title: 'Preventivas',
            subtitle: 'Advertencias y precauciones',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SenalesGaleriaScreen(
                    filtro: SenalesFiltro.preventivas,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          _CategoryCard(
            icon: Icons.pan_tool_alt_rounded,
            title: 'Manuales',
            subtitle: 'Indicaciones con las manos',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SenalesGaleriaScreen(
                    filtro: SenalesFiltro.manuales,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          _CategoryCard(
            icon: Icons.public_rounded,
            title: 'Todas',
            subtitle: 'Ver todas las señales',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SenalesGaleriaScreen(
                    filtro: SenalesFiltro.todas,
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

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
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
