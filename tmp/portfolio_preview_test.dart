import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mmd_porfolio/theme/app_theme.dart';
import 'package:mmd_porfolio/screens/home_screen.dart';

void main() {
  testWidgets('Aperçus de la nouvelle interface', (tester) async {
    final font = FontLoader('PreviewSans');
    font.addFont(Future.value(ByteData.sublistView(File('/Users/mamounediop/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/pdfjs-dist/standard_fonts/LiberationSans-Regular.ttf').readAsBytesSync())));
    font.addFont(Future.value(ByteData.sublistView(File('/Users/mamounediop/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/node_modules/pdfjs-dist/standard_fonts/LiberationSans-Bold.ttf').readAsBytesSync())));
    await font.load();
    tester.view.devicePixelRatio = 1;
    for (final entry in {'desktop': const Size(1280, 960), 'mobile': const Size(390, 844)}.entries) {
      tester.view.physicalSize = entry.value;
      final key = GlobalKey();
      final theme = portfolioTheme();
      await tester.pumpWidget(RepaintBoundary(key: key, child: MaterialApp(theme: theme.copyWith(textTheme: theme.textTheme.apply(fontFamily: 'PreviewSans')), home: const HomeScreen())));
      await tester.pumpAndSettle();
      final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 1.5);
        final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
        File('tmp/portfolio-preview-${entry.key}.png').writeAsBytesSync(bytes!.buffer.asUint8List());
      });
    }
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}
