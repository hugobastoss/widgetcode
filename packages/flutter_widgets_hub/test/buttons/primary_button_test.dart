import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubPrimaryButton renderiza sem erro ($brightness)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: HubPrimaryButton(label: 'Salvar', onPressed: () {}),
          ),
        ),
      );

      expect(find.text('Salvar'), findsOneWidget);
    });
  }

  testWidgets('mostra o indicador de progresso quando isLoading é true', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HubPrimaryButton(
            label: 'Salvar',
            isLoading: true,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Salvar'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
