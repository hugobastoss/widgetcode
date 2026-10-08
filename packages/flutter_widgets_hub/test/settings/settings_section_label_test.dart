import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    for (final variant in HubSectionLabelVariant.values) {
      testWidgets(
        'HubSettingsSectionLabel renderiza sem erro ($brightness, $variant)',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              theme: ThemeData(brightness: brightness, useMaterial3: true),
              home: Scaffold(
                body: HubSettingsSectionLabel('Aparência', variant: variant),
              ),
            ),
          );

          expect(find.text('APARÊNCIA'), findsOneWidget);
        },
      );
    }
  }
}
