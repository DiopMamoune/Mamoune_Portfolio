import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mmd_porfolio/main.dart';

void main() {
  testWidgets('Le bouton du CV est visible sur le profil natif', (
    tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    final button = find.widgetWithText(FilledButton, 'Télécharger mon CV');
    expect(button, findsOneWidget);
    expect(tester.widget<FilledButton>(button).onPressed, isNotNull);
    expect(
      tester.getRect(button).overlaps(tester.getRect(find.byType(Scaffold))),
      isTrue,
    );
  });

  test('Le PDF est accessible depuis les assets de l’application', () async {
    final data = await rootBundle.load('assets/cv/CV_Modou_Mamoune_Diop.pdf');
    final signature = String.fromCharCodes(data.buffer.asUint8List(0, 5));
    expect(signature, '%PDF-');
  });
}
