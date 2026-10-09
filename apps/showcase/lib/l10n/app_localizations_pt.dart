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
}
