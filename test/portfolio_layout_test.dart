import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mmd_porfolio/main.dart';

void main() {
  for (final width in [360.0, 1280.0]) {
    testWidgets('Navigation sans débordement à ${width.toInt()} pixels', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();
      expect(
        Theme.of(tester.element(find.byType(Scaffold))).brightness,
        Brightness.light,
      );
      expect(find.text('Télécharger mon CV'), findsOneWidget);
      expect(tester.takeException(), isNull);
      for (final label in [
        'Parcours',
        width < 900 ? 'Expertise' : 'Compétences',
        'Projets',
        'Formation',
        'Contact',
      ]) {
        await tester.tap(find.text(label).last);
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: 'Écran $label à $width pixels',
        );
      }
    });
  }
}
