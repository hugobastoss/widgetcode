import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub_showcase/learn/locale_controller.dart';
import 'package:flutter_widgets_hub_showcase/learn/models.dart';
import 'package:flutter_widgets_hub_showcase/learn/screens/widget_screen.dart';
import 'package:flutter_widgets_hub_showcase/learn/sections.dart';
import 'package:flutter_widgets_hub_showcase/learn/theme_mode_controller.dart';
import 'package:flutter_widgets_hub_showcase/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// O app em português — os testes procuram os textos em pt —, salvo quando
/// o teste escolhe outro idioma ou tema.
ShowcaseApp _app({ThemeModeController? tema, LocaleController? idioma}) {
  return ShowcaseApp(
    themeController: tema ?? ThemeModeController.inMemory(),
    localeController: idioma ?? LocaleController.inMemory(const Locale('pt')),
  );
}

void main() {
  // O rootBundle guarda em cache o Future de cada asset lido, preso à zona
  // de relógio falso do teste que o criou. Reaproveitado num teste seguinte,
  // ele nunca completa — então cada teste começa com o cache vazio.
  setUp(rootBundle.clear);

  testWidgets(
    'navega Início -> Botões -> ElevatedButton -> código do exemplo',
    (tester) async {
      await tester.pumpWidget(_app());

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
      await tester.pump(); // monta o CodeSheet, que começa a ler o asset
      // A leitura do asset é I/O de verdade, que não avança no relógio falso
      // do teste — sem isto o indicador de carregamento gira pra sempre e o
      // pumpAndSettle nunca termina.
      await tester.runAsync(
        () => Future<void>.delayed(const Duration(milliseconds: 200)),
      );
      await tester.pumpAndSettle();
      expect(find.textContaining('class ElevatedButtonBasico'), findsOneWidget);
      // O código abre num painel por cima: a página do widget continua lá.
      expect(find.byType(BottomSheet), findsOneWidget);
      expect(find.text('Exemplos (5)'), findsOneWidget);

      // O painel mostra o ID do exemplo e copia o pedido pronto para a IA.
      expect(find.text('buttons/elevated_button_basico'), findsOneWidget);
      String? copiado;
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        (chamada) async {
          if (chamada.method == 'Clipboard.setData') {
            copiado = (chamada.arguments as Map)['text'] as String;
          }
          return null;
        },
      );
      addTearDown(
        () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          SystemChannels.platform,
          null,
        ),
      );
      await tester.tap(find.text('Pedir para a IA'));
      await tester.pump();
      expect(
        copiado,
        'Traga o exemplo "buttons/elevated_button_basico" do Flutter Widgets '
        'Hub (github.com/hugobastoss/flutterwidgetshub) para o meu projeto.',
      );
      expect(find.text('Pedido copiado'), findsOneWidget);
      // Deixa passar os 2 segundos em que o botão mostra o ✓.
      await tester.pump(const Duration(seconds: 3));
      expect(find.text('Pedir para a IA'), findsOneWidget);
    },
  );

  testWidgets('o menu de tema troca o app para claro e escuro', (tester) async {
    final tema = ThemeModeController.inMemory();
    await tester.pumpWidget(_app(tema: tema));

    ThemeMode modoDoApp() =>
        tester.widget<MaterialApp>(find.byType(MaterialApp)).themeMode!;
    expect(modoDoApp(), ThemeMode.system);

    await tester.tap(find.byTooltip('Tema'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.widgetWithText(CheckedPopupMenuItem<ThemeMode>, 'Claro'),
    );
    await tester.pumpAndSettle();
    expect(tema.value, ThemeMode.light);
    expect(modoDoApp(), ThemeMode.light);

    await tester.tap(find.byTooltip('Tema'));
    await tester.pumpAndSettle();
    await tester.tap(
      find.widgetWithText(CheckedPopupMenuItem<ThemeMode>, 'Escuro'),
    );
    await tester.pumpAndSettle();
    expect(modoDoApp(), ThemeMode.dark);
  });

  test('a escolha de tema fica salva para a próxima abertura', () async {
    SharedPreferences.setMockInitialValues({});

    final primeiraVez = await ThemeModeController.load();
    expect(primeiraVez.value, ThemeMode.system);

    await primeiraVez.select(ThemeMode.light);

    final proximaAbertura = await ThemeModeController.load();
    expect(proximaAbertura.value, ThemeMode.light);
  });

  testWidgets('o menu de idioma troca o app entre pt, en e es', (tester) async {
    // Celular pequeno: textos em en/es têm outros tamanhos e não podem
    // estourar a largura.
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final idioma = LocaleController.inMemory(const Locale('pt'));
    await tester.pumpWidget(_app(idioma: idioma));

    expect(find.text('Seções'), findsOneWidget);
    expect(find.text('Botões'), findsOneWidget);

    Future<void> escolher(String nome) async {
      await tester.tap(find.byType(PopupMenuButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(CheckedPopupMenuItem<String>, nome));
      await tester.pumpAndSettle();
    }

    await escolher('English');
    expect(idioma.value, const Locale('en'));
    expect(find.text('Sections'), findsOneWidget);
    expect(find.text('Buttons'), findsOneWidget);
    expect(find.text('12 sections · 79 widgets'), findsOneWidget);

    await escolher('Español');
    expect(find.text('Secciones'), findsOneWidget);
    expect(find.text('Botones'), findsOneWidget);

    // O conteúdo também troca: a descrição do ElevatedButton em espanhol.
    // Na tela pequena, o bloco da seção fica abaixo da dobra: rola até ele.
    await tester.ensureVisible(find.text('Botones'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Botones'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Botón con sombra, para destacar la acción sobre fondos de color o con imagen.',
      ),
      findsOneWidget,
    );
  });

  test('a escolha de idioma fica salva para a próxima abertura', () async {
    SharedPreferences.setMockInitialValues({});

    final primeiraVez = await LocaleController.load();
    expect(primeiraVez.value, isNull); // segue o sistema

    await primeiraVez.select(const Locale('es'));
    expect((await LocaleController.load()).value, const Locale('es'));

    await primeiraVez.select(null);
    expect((await LocaleController.load()).value, isNull);
  });

  test('idioma do sistema sem tradução cai no inglês', () {
    expect(LocaleController.resolve([const Locale('fr')]), const Locale('en'));
    expect(
      LocaleController.resolve([const Locale('fr'), const Locale('es', 'MX')]),
      const Locale('es'),
    );
    expect(
      LocaleController.resolve([const Locale('pt', 'BR')]),
      const Locale('pt'),
    );
    expect(LocaleController.resolve(null), const Locale('en'));
  });

  testWidgets('o cartão da tela inicial abre o "Como usar"', (tester) async {
    await tester.pumpWidget(_app());

    await tester.tap(find.text('Leve um exemplo para o seu app'));
    await tester.pumpAndSettle();

    expect(find.text('Como usar'), findsOneWidget);
    expect(
      find.text('Dê à sua IA a referência do repositório'),
      findsOneWidget,
    );
    expect(find.text('Cole o pedido na sua IA'), findsOneWidget);
  });

  testWidgets('a seção Layout abre com seus 11 widgets', (tester) async {
    await tester.pumpWidget(_app());

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
}
