import 'package:flutter/material.dart';
import '../main.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  const SectionHeader(this.label, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 24),
    child: Row(
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.8,
            color: AppColors.muted,
          ),
        ),
      ],
    ),
  );
}

class TechTag extends StatelessWidget {
  final String label;
  final bool isBlue;
  const TechTag(this.label, {super.key, this.isBlue = true});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
    decoration: BoxDecoration(
      color: isBlue ? AppColors.blueTint : AppColors.tagBg,
      borderRadius: BorderRadius.circular(7),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 12,
        color: isBlue ? AppColors.accent : AppColors.muted,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

class TagRow extends StatelessWidget {
  final List<String> tags;
  const TagRow(this.tags, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 12),
    child: Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.map((tag) => TechTag(tag)).toList(),
    ),
  );
}

class PulseDot extends StatelessWidget {
  const PulseDot({super.key});
  @override
  Widget build(BuildContext context) => Container(
    width: 7,
    height: 7,
    decoration: const BoxDecoration(
      color: AppColors.accent,
      shape: BoxShape.circle,
    ),
  );
}
