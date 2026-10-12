import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

Future<void> downloadCv({Rect? sharePositionOrigin}) async {
  final data = await rootBundle.load('assets/cv/CV_Modou_Mamoune_Diop.pdf');
  await SharePlus.instance.share(
    ShareParams(
      files: [
        XFile.fromData(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          mimeType: 'application/pdf',
        ),
      ],
      fileNameOverrides: ['CV_Modou_Mamoune_Diop.pdf'],
      title: 'Mon CV',
      sharePositionOrigin: sharePositionOrigin,
    ),
  );
}
