import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  const opcoes = [
    HubLanguageOption(code: 'pt', label: 'Português'),
    HubLanguageOption(code: 'en', label: 'English'),
    HubLanguageOption(code: 'es', label: 'Español'),
  ];

  for (final brightness in Brightness.values) {
    testWidgets('HubLanguageSelector renderiza sem erro ($brightness)', (
      tester,
    ) async {
      String? selecionado;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: HubLanguageSelector(
              options: opcoes,
              selectedCode: 'pt',
              onChanged: (codigo) => selecionado = codigo,
            ),
          ),
        ),
      );

      expect(find.text('Português'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Español'), findsOneWidget);

      await tester.tap(find.text('English'));
      expect(selecionado, 'en');
    });
  }
}
