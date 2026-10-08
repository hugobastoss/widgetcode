import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubConfirmationDialog renderiza sem erro ($brightness)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => HubConfirmationDialog.show(
                  context,
                  icon: Icons.delete_outline,
                  title: 'Excluir item?',
                  description: 'Essa ação não pode ser desfeita.',
                  confirmLabel: 'Excluir',
                  isDestructive: true,
                ),
                child: const Text('abrir'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('abrir'));
      await tester.pumpAndSettle();

      expect(find.text('Excluir item?'), findsOneWidget);
      expect(find.text('Excluir'), findsOneWidget);
      expect(find.text('Cancelar'), findsOneWidget);
    });
  }

  testWidgets('devolve true ao confirmar', (tester) async {
    bool? resultado;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                resultado = await HubConfirmationDialog.show(
                  context,
                  icon: Icons.delete_outline,
                  title: 'Excluir?',
                  description: 'Confirma?',
                  confirmLabel: 'Excluir',
                );
              },
              child: const Text('abrir'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('abrir'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Excluir'));
    await tester.pumpAndSettle();

    expect(resultado, isTrue);
  });
}
