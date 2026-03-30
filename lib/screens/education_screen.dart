import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader('Formation'),
          ...PortfolioData.education.map((e) => _EduCard(edu: e)),
        ],
      ),
    );
  }
}

class _EduCard extends StatelessWidget {
  final Education edu;
  const _EduCard({required this.edu});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.accent.withOpacity(0.08),
              border: Border.all(color: AppColors.accent.withOpacity(0.25)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              edu.years,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.accent,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edu.school,
                  style: const TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  edu.degree,
                  style: const TextStyle(fontSize: 12, color: AppColors.muted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
