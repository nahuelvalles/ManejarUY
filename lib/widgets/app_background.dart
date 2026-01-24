import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fondo base con gradiente
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFEAF4FF), // celeste muy claro
                Colors.white,
              ],
            ),
          ),
        ),

        // Ola superior
        Positioned(
          top: -120,
          left: -80,
          child: _Wave(
            color: const Color(0xFFB3DAFF).withOpacity(0.25),
            size: 320,
          ),
        ),

        // Ola inferior
        Positioned(
          bottom: -140,
          right: -100,
          child: _Wave(
            color: const Color(0xFFCCE7FF).withOpacity(0.18),
            size: 360,
          ),
        ),

        // Contenido
        SafeArea(child: child),
      ],
    );
  }
}

class _Wave extends StatelessWidget {
  final Color color;
  final double size;

  const _Wave({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
      ),
    );
  }
}
