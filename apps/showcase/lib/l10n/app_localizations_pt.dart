// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get homeIntro =>
      'Aprenda os widgets nativos do Flutter com exemplos que rodam de verdade.';

  @override
  String get searchHint => 'Buscar widget, ex.: ListView';

  @override
  String get sectionsTitle => 'Seções';

  @override
  String homeSummary(int sections, int widgets) {
    return '$sections seções · $widgets widgets';
  }

  @override
  String widgetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count widgets',
      one: '1 widget',
    );
    return '$_temp0';
  }

  @override
  String exampleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exemplos',
      one: '1 exemplo',
    );
    return '$_temp0';
  }

  @override
  String examplesHeader(int count) {
    return 'Exemplos ($count)';
  }

  @override
  String sectionUnderConstruction(String name) {
    return 'Seção \"$name\" em construção.';
  }

  @override
  String get codeButton => 'Código';

  @override
  String get copyCodeTooltip => 'Copiar código';

  @override
  String get openOnGitHubTooltip => 'Abrir no GitHub';

  @override
  String get codeCopied => 'Código copiado.';

  @override
  String get codeLoadError => 'Não foi possível carregar o código.';

  @override
  String get codeCommentsNote => 'Os comentários do código estão em português.';

  @override
  String get themeTooltip => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get themeSystem => 'Seguir o sistema';

  @override
  String get languageTooltip => 'Idioma';

  @override
  String get languageSystem => 'Seguir o sistema';

  @override
  String get askAiButton => 'Pedir para a IA';

  @override
  String get aiRequestCopied => 'Pedido copiado';

  @override
  String aiRequest(String id) {
    return 'Traga o exemplo \"$id\" do Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) para o meu projeto.';
  }

  @override
  String get helpCardTitle => 'Leve um exemplo para o seu app';

  @override
  String get helpCardSubtitle => 'Com a sua IA de código, em 3 passos';

  @override
  String get helpTitle => 'Como usar';

  @override
  String get helpIntro =>
      'Cada exemplo do app é um arquivo do repositório no GitHub. Para trazer um exemplo para o seu projeto, peça para a sua IA de código: ela busca o arquivo e adapta para o seu app.';

  @override
  String get helpStep1Title => 'Dê à sua IA a referência do repositório';

  @override
  String get helpStep1Body =>
      'Instale a skill flutter-widgets-hub no seu projeto (copie a pasta .claude/skills/flutter-widgets-hub do repositório para o seu projeto) ou apenas cite o endereço do repositório no pedido, se a sua IA acessa a internet.';

  @override
  String get helpStep2Title => 'Escolha o exemplo no app';

  @override
  String get helpStep2Body =>
      'Abra o widget, toque em Código no exemplo que você quer e depois em Pedir para a IA. Isso copia um pedido pronto, com o ID do exemplo (como buttons/elevated_button_carregando).';

  @override
  String get helpStep3Title => 'Cole o pedido na sua IA';

  @override
  String get helpStep3Body =>
      'A IA busca o arquivo, coloca no seu projeto e adapta nomes e textos. Se o exemplo usa uma imagem ou a internet, ela também configura o pubspec.yaml ou a permissão do Android.';

  @override
  String get helpManualTitle => 'Sem IA';

  @override
  String get helpManualBody =>
      'Toque em Copiar código, crie um arquivo .dart na pasta lib do seu projeto, cole o código, importe esse arquivo na sua tela e use o widget — por exemplo, const ElevatedButtonBasico().';

  @override
  String get helpOpenRepo => 'Abrir o repositório';
}
