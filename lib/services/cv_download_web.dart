import 'dart:js_interop';
import 'dart:ui';

@JS('downloadPortfolioCv')
external void _downloadInBrowser();

Future<void> downloadCv({Rect? sharePositionOrigin}) async {
  _downloadInBrowser();
}
