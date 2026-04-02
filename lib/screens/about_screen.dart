import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHero(context),
          const SizedBox(height: 28),
          _buildBio(),
          const SizedBox(height: 28),
          _buildStats(),
          const SizedBox(height: 32),
          _buildLanguages(),
          const SizedBox(height: 32),
          _buildInterests(),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D1F17), Color(0xFF0A1220)],
        ),
        border: Border.all(color: AppColors.accent),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.accent.withOpacity(0.4)),
                ),
                child: const Center(
                  child: Text('MD', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.accent,
                  )),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'Syne',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: AppColors.text,
                          letterSpacing: -0.5,
                        ),
                        children: [
                          TextSpan(text: 'Modou '),
                          TextSpan(
                            text: 'Mamoune',
                            style: TextStyle(color: AppColors.accent),
                          ),
                          TextSpan(text: ' Diop'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Développeur Web & Mobile · Full-Stack',
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 2,
                        color: AppColors.muted,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _infoChip(Icons.location_on_outlined, 'Dakar, Sénégal'),
          const SizedBox(height: 6),
          _infoChip(Icons.phone_outlined, '+221 77 157 93 13'),
          const SizedBox(height: 6),
          _infoChip(Icons.code_outlined, 'github.com/DiopMamoune'),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.accent),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
      ],
    );
  }

  Widget _buildBio() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        PortfolioData.bio,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFFA0A0B0),
          height: 1.85,
        ),
      ),
    );
  }

  Widget _buildStats() {
    final stats = [
      ('5+', 'Ans XP'),
      ('5', 'Entreprises'),
      ('8+', 'Techs'),
      ('3+', 'Finetech'),
    ];
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.4,
      children: stats.map((s) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), // était 18
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(s.$1, style: const TextStyle(
                fontSize: 20,       // était 22
                fontWeight: FontWeight.w800,
                color: AppColors.accent,
                letterSpacing: -0.5,
                fontFamily: 'Syne',
              )),
            ),
            SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(s.$2, style: const TextStyle(
                fontSize: 8,
                color: AppColors.muted,
                letterSpacing: 1,
              )),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildLanguages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('Langues'),
        _langRow('Wolof', 'Natif'),
        const Divider(color: AppColors.border, height: 1),
        _langRow('Français', 'Intermédiaire'),
        const Divider(color: AppColors.border, height: 1),
        _langRow('Anglais', 'Intermédiaire'),
      ],
    );
  }

  Widget _langRow(String lang, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lang, style: const TextStyle(fontSize: 14, color: AppColors.text)),
          Text(level, style: const TextStyle(
            fontSize: 11, color: AppColors.accent, letterSpacing: 1,
          )),
        ],
      ),
    );
  }

  Widget _buildInterests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader('Centres d\'intérêt'),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: PortfolioData.interests.map((i) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.card,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('→ ', style: TextStyle(fontSize: 11, color: AppColors.accent)),
                Text(i, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
              ],
            ),
          )).toList(),
        ),
      ],
    );
  }
}
