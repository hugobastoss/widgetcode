import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubAppearanceSelector renderiza sem erro ($brightness)', (
      tester,
    ) async {
      ThemeMode? selecionado;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: HubAppearanceSelector(
              value: ThemeMode.system,
              onChanged: (modo) => selecionado = modo,
            ),
          ),
        ),
      );

      expect(find.text('Claro'), findsOneWidget);
      expect(find.text('Escuro'), findsOneWidget);
      expect(find.text('Automático'), findsOneWidget);

      await tester.tap(find.text('Escuro'));
      expect(selecionado, ThemeMode.dark);
    });
  }
}
