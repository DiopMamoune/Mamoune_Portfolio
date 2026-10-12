import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/cv_download_button.dart';
import '../widgets/portfolio_page.dart';
import '../widgets/project_artwork.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback? onProjects;
  final VoidCallback? onContact;
  const AboutScreen({super.key, this.onProjects, this.onContact});

  @override
  Widget build(BuildContext context) {
    return PortfolioPage(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 780;
            final introduction = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'MODOU MAMOUNE DIOP  /  DÉVELOPPEUR',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.muted,
                    letterSpacing: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Du mobile.\nDu web.\nDu concret.',
                  style: TextStyle(
                    fontSize: wide ? 76 : 48,
                    fontWeight: FontWeight.w800,
                    height: 1.02,
                    letterSpacing: wide ? -4 : -2.5,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Je suis Mamoune, développeur à Dakar.\nJe construis des applications pour les paiements, les services publics et les usages du quotidien.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.65,
                    color: AppColors.muted,
                  ),
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: CvDownloadButton(),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: onProjects,
                  icon: const Icon(Icons.arrow_downward, size: 17),
                  label: const Text('Découvrir mes projets'),
                ),
              ],
            );
            final visual = _IdentityArt();
            return wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: introduction),
                      const SizedBox(width: 50),
                      Expanded(flex: 5, child: visual),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      introduction,
                      const SizedBox(height: 30),
                      SizedBox(width: double.infinity, child: visual),
                    ],
                  );
          },
        ),
        const SizedBox(height: 38),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.border),
              bottom: BorderSide(color: AppColors.border),
            ),
          ),
          child: const Wrap(
            spacing: 32,
            runSpacing: 12,
            children: [
              Text(
                'Flutter & Dart',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                'React & Next.js',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                'Angular & PHP',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text('Basé à Dakar', style: TextStyle(color: AppColors.muted)),
            ],
          ),
        ),
        const SizedBox(height: 42),
        const SectionHeader('Quelques réalisations'),
        LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth > 650;
            final cards = [
              for (var i = 0; i < 2; i++)
                SizedBox(
                  width: wide
                      ? (constraints.maxWidth - 24) / 2
                      : constraints.maxWidth,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: onProjects,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectArtwork(index: i),
                        const SizedBox(height: 16),
                        Text(
                          PortfolioData.projects[i].name,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          PortfolioData.projects[i].tags.join(' · '),
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ];
            return Wrap(spacing: 24, runSpacing: 28, children: cards);
          },
        ),
        const SizedBox(height: 42),
        const SectionHeader('Un peu de moi'),
        const Text(
          PortfolioData.bio,
          style: TextStyle(fontSize: 17, color: AppColors.muted, height: 1.8),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: PortfolioData.interests
              .map((interest) => TechTag(interest, isBlue: false))
              .toList(),
        ),
        const SizedBox(height: 42),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: AppColors.sage,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Un projet en tête ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Parlons de ce que vous souhaitez construire.',
                style: TextStyle(color: AppColors.muted),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: onContact,
                icon: const Icon(Icons.north_east),
                label: const Text('Me contacter'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IdentityArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: AppColors.sage,
          child: Stack(
            children: [
              Positioned(
                right: -65,
                top: -70,
                child: Container(
                  width: 330,
                  height: 330,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accent, width: 65),
                  ),
                ),
              ),
              Positioned(
                left: -90,
                bottom: -135,
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD1DBC1),
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                top: 24,
                child: Text(
                  'MOBILE / WEB',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'md.',
                  style: TextStyle(
                    fontSize: 130,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -12,
                    color: AppColors.text,
                  ),
                ),
              ),
              const Positioned(
                left: 26,
                bottom: 24,
                child: Text(
                  'Conçu à Dakar.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              const Positioned(
                right: 24,
                bottom: 20,
                child: Icon(Icons.north_east, size: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
