import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/portfolio_page.dart';
import '../widgets/project_artwork.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PortfolioPage(
      children: [
        const SectionHeader('Projets'),
        const Text(
          'Des applications,\ndes usages réels.',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Paiement, gestion publique, santé et géolocalisation. Voici les projets auxquels j’ai contribué.',
          style: TextStyle(fontSize: 16, color: AppColors.muted),
        ),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 700;
            return Wrap(
              spacing: 28,
              runSpacing: 36,
              children: [
                for (var i = 0; i < PortfolioData.projects.length; i++)
                  SizedBox(
                    width: wide
                        ? (constraints.maxWidth - 28) / 2
                        : constraints.maxWidth,
                    child: _ProjectCard(
                      project: PortfolioData.projects[i],
                      index: i,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  final int index;
  const _ProjectCard({required this.project, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectArtwork(index: index, height: 240),
        const SizedBox(height: 18),
        Text(
          project.name,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            letterSpacing: -.7,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.description,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.muted,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Ma contribution',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          project.contribution,
          style: const TextStyle(fontSize: 14, height: 1.65),
        ),
        TagRow(project.tags),
      ],
    );
  }
}
