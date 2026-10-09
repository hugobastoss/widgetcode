// Roda cada exemplo numa área do mesmo tamanho da demo do app num celular de
// 360 de largura e confere que o arquivo de cada um define a classe que roda.
// Um exemplo que estoura aqui estoura no aparelho.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widgetcode_examples/widgetcode_examples.dart';

/// A área da demo no app: um cartão com margem e respiro, sem os espaços que
/// o sistema reserva (barra de status, de gestos, teclado) e com as
/// animações Hero desligadas, exceto nos exemplos que ensinam Hero.
class _AreaDaDemo extends StatelessWidget {
  const _AreaDaDemo({required this.example});

  final WidgetExample example;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(24),
      constraints: const BoxConstraints(minHeight: 104),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Material(
        type: MaterialType.transparency,
        child: MediaQuery(
          data: MediaQuery.of(context)
              .removePadding(
                removeTop: true,
                removeBottom: true,
                removeLeft: true,
                removeRight: true,
              )
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(
                removeTop: true,
                removeBottom: true,
                removeLeft: true,
                removeRight: true,
              ),
          child: HeroMode(
            enabled: example.usesHero,
            child: Builder(builder: example.builder),
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets(
    'todo exemplo roda na área da demo de um celular de 360 de largura '
    'e aponta pro próprio arquivo-fonte',
    (tester) async {
      // 1080 × 2400 físicos a 3x = 360 × 800 lógicos, um celular pequeno.
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      final caminhos = <String>{};
      // Junta todas as falhas e reporta no fim, em vez de parar na primeira.
      final falhas = <String>[];

      for (final secao in kLearnSections) {
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
            falhas.add('${secao.name.pt} / ${doc.name} (prévia): $erroPreview');
          }

          for (final exemplo in doc.examples) {
            final rotulo =
                '${secao.name.pt} / ${doc.name} / ${exemplo.title.pt}';
            if (!caminhos.add(exemplo.sourcePath)) {
              falhas.add('$rotulo: repete o arquivo ${exemplo.sourcePath}');
            }

            // Embrulha o builder pra descobrir qual classe o exemplo monta.
            String? classe;
            final espiao = WidgetExample(
              title: exemplo.title,
              description: exemplo.description,
              sourcePath: exemplo.sourcePath,
              usesHero: exemplo.usesHero,
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
                    children: [_AreaDaDemo(example: espiao)],
                  ),
                ),
              ),
            );
            final erro = tester.takeException();
            if (erro != null) falhas.add('$rotulo: $erro');

            final arquivo = File(exemplo.sourcePath);
            if (!arquivo.existsSync() ||
                !arquivo.readAsStringSync().contains('class $classe ')) {
              falhas.add('$rotulo: ${exemplo.sourcePath} não define $classe');
            }
          }
        }
      }

      expect(falhas, isEmpty, reason: falhas.join('\n'));
    },
  );
}
