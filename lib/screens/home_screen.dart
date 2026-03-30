import 'package:flutter/material.dart';
import '../main.dart';
import 'about_screen.dart';
import 'experiences_screen.dart';
import 'skills_screen.dart';
import 'projects_screen.dart';
import 'education_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<_NavItem> _items = const [
    _NavItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profil'),
    _NavItem(icon: Icons.work_outline, activeIcon: Icons.work, label: 'XP'),
    _NavItem(icon: Icons.code_outlined, activeIcon: Icons.code, label: 'Skills'),
    _NavItem(icon: Icons.folder_outlined, activeIcon: Icons.folder, label: 'Projets'),
    _NavItem(icon: Icons.school_outlined, activeIcon: Icons.school, label: 'Formation'),
    _NavItem(icon: Icons.mail_outline, activeIcon: Icons.mail, label: 'Contact'),
  ];

  final List<Widget> _screens = const [
    AboutScreen(),
    ExperiencesScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    EducationScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: _buildAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: RichText(
        text: const TextSpan(
          style: TextStyle(
            fontFamily: 'Syne',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.text,
            letterSpacing: -0.3,
          ),
          children: [
            TextSpan(text: 'M.'),
            TextSpan(text: 'Mamoune', style: TextStyle(color: AppColors.accent)),
            TextSpan(text: ' Diop'),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.accent.withOpacity(0.1),
            border: Border.all(color: AppColors.accent.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 5, height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'DISPO',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.accent,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.border),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: const Border(top: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final isActive = i == _currentIndex;
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isActive ? item.activeIcon : item.icon,
                        size: 20,
                        color: isActive ? AppColors.accent : AppColors.muted,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 10,
                          color: isActive ? AppColors.accent : AppColors.muted,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({required this.icon, required this.activeIcon, required this.label});
}
