import 'package:flutter/material.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/portfolio_page.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final frontend = PortfolioData.skills
        .where((s) => s.category == 'Frontend / Mobile')
        .toList();
    final backend = PortfolioData.skills
        .where((s) => s.category == 'Backend')
        .toList();

    return PortfolioPage(
      children: [
        const SectionHeader('Compétences'),
        _buildSkillGroup('Web et mobile', frontend),
        const SizedBox(height: 24),
        _buildSkillGroup('Backend', backend),
        const SizedBox(height: 32),
        const SectionHeader('Outils'),
        _buildTools(),
      ],
    );
  }

  Widget _buildSkillGroup(String title, List<Skill> skills) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              color: AppColors.muted,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 16),
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    skill.usage,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.text,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTools() {
    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: PortfolioData.tools.map((t) => _ToolBadge(t)).toList(),
    );
  }
}

class _ToolBadge extends StatefulWidget {
  final String label;
  const _ToolBadge(this.label);

  @override
  State<_ToolBadge> createState() => _ToolBadgeState();
}

class _ToolBadgeState extends State<_ToolBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.tagBg,
          border: Border.all(
            color: _hovered ? AppColors.accent : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 12,
            color: _hovered ? AppColors.text : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
