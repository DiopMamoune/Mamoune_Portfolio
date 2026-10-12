import 'package:flutter/material.dart';
import '../main.dart';

/// An editorial illustration for each domain, rather than a product screenshot.
class ProjectArtwork extends StatelessWidget {
  final int index;
  final double height;
  const ProjectArtwork({super.key, required this.index, this.height = 220});

  @override
  Widget build(BuildContext context) {
    const backgrounds = [
      AppColors.blueTint,
      AppColors.sage,
      Color(0xFFF3E4D6),
      Color(0xFFECE4F5),
      Color(0xFFE1EBEA),
    ];
    const symbols = [
      Icons.swap_horiz_rounded,
      Icons.account_balance_outlined,
      Icons.health_and_safety_outlined,
      Icons.location_on_outlined,
      Icons.account_balance_wallet_outlined,
    ];
    const labels = [
      'PAIEMENT INTEROPÉRABLE',
      'GESTION BUDGÉTAIRE',
      'MUTUELLE DE SANTÉ',
      'GÉOLOCALISATION',
      'SERVICES BANCAIRES',
    ];
    final i = index % backgrounds.length;
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: height,
        color: backgrounds[i],
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -45,
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.text.withValues(alpha: .08),
                    width: 35,
                  ),
                ),
              ),
            ),
            Center(
              child: Transform.rotate(
                angle: -.12,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: .7),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Icon(
                    symbols[i],
                    size: 62,
                    color: i == 0 ? AppColors.accent : AppColors.text,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 18,
              child: Text(
                labels[i],
                style: const TextStyle(
                  fontSize: 10,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 18,
              child: Text(
                '0${index + 1}',
                style: const TextStyle(fontSize: 12, color: AppColors.muted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
