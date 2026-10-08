import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    for (final variant in HubGroupedCardVariant.values) {
      testWidgets(
        'HubSettingsGroupedCard renderiza sem erro ($brightness, $variant)',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              theme: ThemeData(brightness: brightness, useMaterial3: true),
              home: Scaffold(
                body: HubSettingsGroupedCard(
                  variant: variant,
                  children: const [
                    ListTile(title: Text('Notificações')),
                    ListTile(title: Text('Idioma')),
                  ],
                ),
              ),
            ),
          );

          expect(find.text('Notificações'), findsOneWidget);
          expect(find.text('Idioma'), findsOneWidget);
          expect(find.byType(Divider), findsOneWidget);
        },
      );
    }
  }
}
