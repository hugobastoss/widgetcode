// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homeIntro =>
      'Aprende los widgets nativos de Flutter con ejemplos que funcionan de verdad.';

  @override
  String get searchHint => 'Buscar widget, p. ej.: ListView';

  @override
  String get sectionsTitle => 'Secciones';

  @override
  String homeSummary(int sections, int widgets) {
    return '$sections secciones · $widgets widgets';
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
      other: '$count ejemplos',
      one: '1 ejemplo',
    );
    return '$_temp0';
  }

  @override
  String examplesHeader(int count) {
    return 'Ejemplos ($count)';
  }

  @override
  String sectionUnderConstruction(String name) {
    return 'La sección \"$name\" está en construcción.';
  }

  @override
  String get codeButton => 'Código';

  @override
  String get copyCodeTooltip => 'Copiar código';

  @override
  String get openOnGitHubTooltip => 'Abrir en GitHub';

  @override
  String get codeCopied => 'Código copiado.';

  @override
  String get codeLoadError => 'No se pudo cargar el código.';

  @override
  String get codeCommentsNote =>
      'Los comentarios del código están en portugués.';

  @override
  String get themeTooltip => 'Tema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Seguir el sistema';

  @override
  String get languageTooltip => 'Idioma';

  @override
  String get languageSystem => 'Seguir el sistema';
}
