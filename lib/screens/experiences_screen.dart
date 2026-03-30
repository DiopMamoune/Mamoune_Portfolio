import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader('Expériences'),
          _buildFeatured(PortfolioData.experiences[0]),
          const SizedBox(height: 8),
          ...PortfolioData.experiences.skip(1).map(
            (exp) => _buildTimelineItem(exp, isLast: exp == PortfolioData.experiences.last),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatured(Experience exp) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A1A10), Color(0xFF0A1220)],
        ),
        border: Border.all(color: AppColors.accent),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          // Left accent bar
          Positioned(
            top: 0, bottom: 0, left: 0,
            child: Container(
              width: 3,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const PulseDot(),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withOpacity(0.1),
                        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'POSTE ACTUEL · TEMPS PLEIN',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: AppColors.accent,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  exp.company,
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.text,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  exp.role,
                  style: const TextStyle(fontSize: 13, color: AppColors.accent, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 12, color: AppColors.muted),
                    const SizedBox(width: 4),
                    Text(
                      exp.location,
                      style: const TextStyle(fontSize: 11, color: AppColors.muted),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  exp.date,
                  style: const TextStyle(fontSize: 11, color: AppColors.muted, letterSpacing: 0.5),
                ),
                const SizedBox(height: 12),
                Text(
                  exp.description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    color: Color(0xFF9A9AAA),
                    height: 1.7,
                  ),
                ),
                TagRow(exp.tags),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(Experience exp, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.bg,
                border: Border.all(color: AppColors.accent, width: 2),
              ),
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 100,
                color: AppColors.border,
                margin: const EdgeInsets.symmetric(vertical: 4),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exp.company,
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 2),
                Text(exp.role,
                    style: const TextStyle(fontSize: 13, color: AppColors.accent, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text(exp.date,
                    style: const TextStyle(fontSize: 11, color: AppColors.muted, letterSpacing: 0.5)),
                const SizedBox(height: 8),
                Text(exp.description,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF8A8A94), height: 1.7)),
                TagRow(exp.tags),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
