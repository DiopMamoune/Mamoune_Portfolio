import 'package:flutter/material.dart';

import '../services/cv_download.dart';

class CvDownloadButton extends StatefulWidget {
  const CvDownloadButton({super.key});

  @override
  State<CvDownloadButton> createState() => _CvDownloadButtonState();
}

class _CvDownloadButtonState extends State<CvDownloadButton> {
  bool _isDownloading = false;

  Future<void> _download() async {
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? null
        : box.localToGlobal(Offset.zero) & box.size;
    setState(() => _isDownloading = true);
    try {
      await downloadCv(sharePositionOrigin: origin);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Téléchargement indisponible. Réessaie dans un instant.',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _isDownloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        onPressed: _isDownloading ? null : _download,
        icon: _isDownloading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.download_outlined),
        label: Text(_isDownloading ? 'Ouverture du CV…' : 'Télécharger mon CV'),
      ),
    );
  }
}
