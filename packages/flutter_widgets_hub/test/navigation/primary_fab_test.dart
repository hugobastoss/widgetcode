import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('HubPrimaryFab renderiza sem erro ($brightness)', (
      tester,
    ) async {
      var tocado = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            floatingActionButton: HubPrimaryFab(onPressed: () => tocado = true),
          ),
        ),
      );

      await tester.tap(find.byType(HubPrimaryFab));
      expect(tocado, isTrue);
    });

    testWidgets('HubExtendedFab renderiza sem erro ($brightness)', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: brightness, useMaterial3: true),
          home: Scaffold(
            floatingActionButton: HubExtendedFab(
              label: 'Adicionar',
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('Adicionar'), findsOneWidget);
    });
  }
}
