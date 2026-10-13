import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/portfolio_page.dart';

class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({super.key});
  @override
  Widget build(BuildContext context) => PortfolioPage(
    children: [
      const SectionHeader('Parcours'),
      const Text(
        'Construire,\napprendre, avancer.',
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
          height: 1.1,
        ),
      ),
      const SizedBox(height: 32),
      for (var i = 0; i < PortfolioData.experiences.length; i++)
        _ExperienceItem(
          experience: PortfolioData.experiences[i],
          featured: i == 0,
        ),
    ],
  );
}

class _ExperienceItem extends StatelessWidget {
  final Experience experience;
  final bool featured;
  const _ExperienceItem({required this.experience, required this.featured});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 24),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: featured ? AppColors.blueTint : AppColors.surface,
      borderRadius: BorderRadius.circular(20),
    ),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final details = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (featured) ...[
              const Text(
                'MISSION ACTUELLE · CONSULTANT',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
            ],
            Text(
              experience.company,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                letterSpacing: -.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              experience.role,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.accent,
              ),
            ),
            if (experience.location.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                experience.location,
                style: const TextStyle(fontSize: 13, color: AppColors.muted),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              experience.description,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.muted,
                height: 1.7,
              ),
            ),
            TagRow(experience.tags),
          ],
        );
        final date = Text(
          experience.date,
          style: const TextStyle(fontSize: 13, color: AppColors.muted),
        );
        return constraints.maxWidth > 750
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 210, child: date),
                  const SizedBox(width: 30),
                  Expanded(child: details),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [date, const SizedBox(height: 16), details],
              );
      },
    ),
  );
}
