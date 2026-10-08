import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub_showcase/main.dart';

void main() {
  testWidgets(
    'navega Home -> categoria -> detalhe e renderiza a demo ao vivo',
    (tester) async {
      await tester.pumpWidget(const ShowcaseApp());

      expect(find.text('Flutter Widgets Hub'), findsOneWidget);
      expect(find.text('Diálogos'), findsOneWidget);

      await tester.tap(find.text('Diálogos'));
      await tester.pumpAndSettle();

      expect(find.text('Confirmation Dialog'), findsOneWidget);
      await tester.tap(find.text('Confirmation Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Abrir diálogo'), findsOneWidget);
      expect(find.text('Código-fonte'), findsOneWidget);
      expect(find.textContaining('HubConfirmationDialog'), findsWidgets);
    },
  );
}
