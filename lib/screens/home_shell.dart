import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../quiz_modo.dart';
import 'examen_quiz_screen.dart';
import 'home_screen.dart';
import 'manual_indice_screen.dart';
import 'senales_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  late final List<Widget> _pages = [
    const HomeScreen(), // 0
    const SenalesScreen(), // 1
    const ExamenQuizScreen(modo: QuizModo.examenCompleto), // 2
    const ManualIndiceScreen(), // 3  ✅
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
          color: AppColors.card,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // ✅ importante con 4 items
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          backgroundColor: AppColors.card,
          elevation: 0,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: const Color(0xFF8A93A0),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.traffic_rounded),
              label: 'Señales',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded),
              label: 'Examen',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_rounded),
              label: 'Manual',
            ),
          ],
        ),
      ),
    );
  }
}
