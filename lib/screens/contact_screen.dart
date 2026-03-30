import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader('Contact'),
          _buildAvailabilityBanner(),
          const SizedBox(height: 20),
          _ContactCard(
            icon: Icons.phone_outlined,
            label: 'Téléphone',
            value: PortfolioData.phone,
            copyValue: PortfolioData.phone,
          ),
          const SizedBox(height: 10),
          _ContactCard(
            icon: Icons.email_outlined,
            label: 'Email',
            value: PortfolioData.email,
            copyValue: PortfolioData.email,
          ),
          const SizedBox(height: 10),
          _ContactCard(
            icon: Icons.link_outlined,
            label: 'LinkedIn',
            value: 'modou-mamoune-diop-598952199',
            copyValue: 'https://${PortfolioData.linkedin}',
          ),
          const SizedBox(height: 10),
          _ContactCard(
            icon: Icons.code_outlined,
            label: 'GitHub',
            value: 'DiopMamoune',
            copyValue: 'https://${PortfolioData.github}',
          ),
          const SizedBox(height: 32),
          _buildQuickStats(context),
        ],
      ),
    );
  }

  Widget _buildAvailabilityBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(0.06),
        border: Border.all(color: AppColors.accent.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const PulseDot(),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DISPONIBILITÉ',
                  style: TextStyle(
                    fontSize: 9,
                    color: AppColors.muted,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Ouvert aux opportunités · Consultant disponible',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats(BuildContext context) {
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
          const Text(
            'RÉSUMÉ RAPIDE',
            style: TextStyle(
              fontSize: 9,
              color: AppColors.muted,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 14),
          _statRow('Poste actuel', 'Consultant Flutter · CBAO'),
          const Divider(color: AppColors.border, height: 20),
          _statRow('Localisation', 'Dakar, Sénégal'),
          const Divider(color: AppColors.border, height: 20),
          _statRow('Disponibilité', 'Immédiate'),
          const Divider(color: AppColors.border, height: 20),
          _statRow('Préférence', 'Mobile & Web Full-Stack'),
        ],
      ),
    );
  }

  Widget _statRow(String key, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(key, style: const TextStyle(fontSize: 13, color: AppColors.muted)),
        Text(val, style: const TextStyle(fontSize: 13, color: AppColors.text)),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String copyValue;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.copyValue,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: copyValue));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label copié !'),
            backgroundColor: AppColors.card,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 18, color: AppColors.accent),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 9, color: AppColors.muted, letterSpacing: 1.5)),
                  const SizedBox(height: 3),
                  Text(value,
                      style: const TextStyle(fontSize: 14, color: AppColors.text)),
                ],
              ),
            ),
            const Icon(Icons.copy_outlined, size: 14, color: AppColors.muted),
          ],
        ),
      ),
    );
  }
}
