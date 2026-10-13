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
  static const _labels = [
    'Profil',
    'Parcours',
    'Compétences',
    'Projets',
    'Formation',
    'Contact',
  ];
  static const _icons = [
    Icons.person_outline,
    Icons.work_outline,
    Icons.code,
    Icons.grid_view_outlined,
    Icons.school_outlined,
    Icons.mail_outline,
  ];

  void _navigate(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final desktop = MediaQuery.sizeOf(context).width >= 900;
    final screens = [
      AboutScreen(
        onProjects: () => _navigate(3),
        onContact: () => _navigate(5),
      ),
      const ExperiencesScreen(),
      const SkillsScreen(),
      const ProjectsScreen(),
      const EducationScreen(),
      const ContactScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: desktop ? 92 : 68,
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
        titleSpacing: desktop ? 48 : 22,
        title: TextButton(
          onPressed: () => _navigate(0),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.text,
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            'mamoune.diop',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
        ),
        actions: desktop
            ? [
                for (var i = 0; i < _labels.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: TextButton(
                      onPressed: () => _navigate(i),
                      child: Text(
                        _labels[i],
                        style: TextStyle(
                          color: _currentIndex == i
                              ? AppColors.accent
                              : AppColors.muted,
                          fontWeight: _currentIndex == i
                              ? FontWeight.w700
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 22),
              ]
            : [
                /*const Padding(
                  padding: EdgeInsets.only(right: 22),
                  child: Chip(
                    label: Text('Dakar, SN', style: TextStyle(fontSize: 11)),
                    side: BorderSide.none,
                    backgroundColor: AppColors.sage,
                  ),
                ),*/
              ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: desktop
          ? null
          : Container(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: SafeArea(
                child: SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      for (var i = 0; i < _labels.length; i++)
                        Expanded(
                          child: Tooltip(
                            message: _labels[i],
                            child: InkWell(
                              onTap: () => _navigate(i),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _icons[i],
                                    color: _currentIndex == i
                                        ? AppColors.accent
                                        : AppColors.muted,
                                    size: 22,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    i == 2 ? 'Expertise' : _labels[i],
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: _currentIndex == i
                                          ? AppColors.accent
                                          : AppColors.muted,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
