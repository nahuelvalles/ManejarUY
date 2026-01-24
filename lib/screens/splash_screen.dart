import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_shell.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _dotsController;

  @override
  void initState() {
    super.initState();

    _dotsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    Future.delayed(const Duration(milliseconds: 1400), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeShell()),
      );
    });
  }

  @override
  void dispose() {
    _dotsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.bg,
          width: double.infinity,
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo grande centrado
              Image.asset(
                'assets/images/ManejarUY_logo.png',
                width: 220,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 14),

              // Título "ManejarUY" (UY en azul)
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                  children: [
                    TextSpan(text: 'Manejar'),
                    TextSpan(
                      text: 'UY',
                      style: TextStyle(color: AppColors.accent),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Aprendé • Practicá • Aprobá',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6C7684),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(flex: 2),

              // Dots estilo iOS/Android simple
              _DotsIndicator(controller: _dotsController),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final t = controller.value; // 0..1
        int active = (t * 4).floor() % 4;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (i) {
            final isActive = i == active;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: isActive ? 18 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: isActive ? AppColors.accent : const Color(0xFFD7DDE6),
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        );
      },
    );
  }
}
