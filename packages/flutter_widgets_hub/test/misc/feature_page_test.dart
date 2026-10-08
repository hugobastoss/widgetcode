import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubFeaturePage renderiza sem erro ($brightness)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: HubFeaturePage(
              icon: Icons.lock_outline,
              title: 'Proteja seus dados',
              body: 'Ative o bloqueio por PIN.',
              primaryLabel: 'Ativar agora',
              onPrimaryPressed: () {},
              secondaryLabel: 'Agora não',
              onSecondaryPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Proteja seus dados'), findsOneWidget);
      expect(find.text('Ativar agora'), findsOneWidget);
      expect(find.text('Agora não'), findsOneWidget);
    });
  }
}
