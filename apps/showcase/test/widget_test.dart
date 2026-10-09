import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub_showcase/learn/models.dart';
import 'package:flutter_widgets_hub_showcase/learn/screens/widget_screen.dart';
import 'package:flutter_widgets_hub_showcase/learn/sections.dart';
import 'package:flutter_widgets_hub_showcase/main.dart';
import 'package:flutter_widgets_hub_showcase/screens/home_screen.dart';

void main() {
  // O rootBundle guarda em cache o Future de cada asset lido, preso à zona
  // de relógio falso do teste que o criou. Reaproveitado num teste seguinte,
  // ele nunca completa — então cada teste começa com o cache vazio.
  setUp(rootBundle.clear);

  testWidgets(
    'navega Início -> Botões -> ElevatedButton -> código do exemplo',
    (tester) async {
      await tester.pumpWidget(const ShowcaseApp());

      expect(find.text('Flutter Widgets Hub'), findsOneWidget);
      expect(find.text('12 seções · 79 widgets'), findsOneWidget);

      await tester.tap(find.text('Botões'));
      await tester.pumpAndSettle();
      expect(find.text('7 widgets'), findsOneWidget);

      await tester.tap(find.text('ElevatedButton'));
      await tester.pumpAndSettle();
      expect(find.text('Exemplos (5)'), findsOneWidget);
      expect(find.text('1 · Básico'), findsOneWidget);

      await tester.tap(find.text('Código').first);
      await tester.pump(); // monta a CodeScreen, que começa a ler o asset
      // A leitura do asset é I/O de verdade, que não avança no relógio falso
      // do teste — sem isto o indicador de carregamento gira pra sempre e o
      // pumpAndSettle nunca termina.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 200)),
      );
      await tester.pumpAndSettle();
      expect(
        find.textContaining('class ElevatedButtonBasico'),
        findsOneWidget,
      );
    },
  );

  testWidgets('a seção Layout abre com seus 11 widgets', (tester) async {
    await tester.pumpWidget(const ShowcaseApp());

    await tester.tap(find.text('Layout'));
    await tester.pumpAndSettle();

    expect(find.text('11 widgets'), findsOneWidget);
    await tester.tap(find.text('Container'));
    await tester.pumpAndSettle();
    expect(find.text('Exemplos (4)'), findsOneWidget);
  });

  testWidgets(
    'todo exemplo roda na área da demo de um celular de 360 de largura '
    'e aponta pro próprio arquivo-fonte',
    (tester) async {
      // 1080 × 2400 físicos a 3x = 360 × 800 lógicos, um celular pequeno.
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      final secoesProntas = kLearnSections.where((s) => s.docs.isNotEmpty);
      final caminhos = <String>{};
      // Junta todas as falhas e reporta no fim, em vez de parar na primeira.
      final falhas = <String>[];

      for (final secao in secoesProntas) {
        for (final doc in secao.docs) {
          // A pré-visualização do cartão da seção: faixa de 88 de altura na
          // largura do cartão (360 - 2 × 16 de margem - 2 de borda).
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 326,
                    height: 88,
                    child: Center(child: doc.preview),
                  ),
                ),
              ),
            ),
          );
          final erroPreview = tester.takeException();
          if (erroPreview != null) {
            falhas.add('${secao.name} / ${doc.name} (prévia): $erroPreview');
          }

          for (final exemplo in doc.examples) {
            final rotulo = '${secao.name} / ${doc.name} / ${exemplo.title}';
            if (!caminhos.add(exemplo.sourcePath)) {
              falhas.add('$rotulo: repete o arquivo ${exemplo.sourcePath}');
            }

            // Embrulha o builder pra descobrir qual classe o exemplo monta.
            String? classe;
            final espiao = WidgetExample(
              title: exemplo.title,
              description: exemplo.description,
              sourcePath: exemplo.sourcePath,
              builder: (context) {
                final widget = exemplo.builder(context);
                classe = widget.runtimeType.toString();
                return widget;
              },
            );

            await tester.pumpWidget(
              MaterialApp(
                home: Scaffold(
                  body: ListView(
                    // 16 do ListView da página + 1 da borda do cartão, pra
                    // a demo ter a mesma largura que tem no app.
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 16,
                    ),
                    children: [ExampleDemo(example: espiao)],
                  ),
                ),
              ),
            );
            final erro = tester.takeException();
            if (erro != null) falhas.add('$rotulo: $erro');

            final codigo = await tester.runAsync(
              () => rootBundle.loadString(exemplo.sourcePath),
            );
            if (codigo == null || !codigo.contains('class $classe ')) {
              falhas.add('$rotulo: ${exemplo.sourcePath} não define $classe');
            }
          }
        }
      }

      expect(falhas, isEmpty, reason: falhas.join('\n'));
    },
  );

  testWidgets(
    'catálogo Hub antigo: Home -> categoria -> detalhe com demo ao vivo',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

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
