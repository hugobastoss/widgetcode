import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubDataListRow renderiza sem erro ($brightness)', (
      tester,
    ) async {
      var tocado = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            body: HubDataListRow(
              title: const Text('Maria Souza'),
              subtitle: const Text('Última compra: hoje'),
              trailing: const Text('R\$ 150,00'),
              onTap: () => tocado = true,
            ),
          ),
        ),
      );

      expect(find.text('Maria Souza'), findsOneWidget);
      await tester.tap(find.byType(HubDataListRow));
      expect(tocado, isTrue);
    });
  }
}
