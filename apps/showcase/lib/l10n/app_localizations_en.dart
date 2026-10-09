// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeIntro =>
      'Learn Flutter\'s native widgets with examples that actually run.';

  @override
  String get searchHint => 'Search widgets, e.g. ListView';

  @override
  String get sectionsTitle => 'Sections';

  @override
  String homeSummary(int sections, int widgets) {
    return '$sections sections · $widgets widgets';
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
      other: '$count examples',
      one: '1 example',
    );
    return '$_temp0';
  }

  @override
  String examplesHeader(int count) {
    return 'Examples ($count)';
  }

  @override
  String sectionUnderConstruction(String name) {
    return 'The \"$name\" section is under construction.';
  }

  @override
  String get codeButton => 'Code';

  @override
  String get copyCodeTooltip => 'Copy code';

  @override
  String get openOnGitHubTooltip => 'Open on GitHub';

  @override
  String get codeCopied => 'Code copied.';

  @override
  String get codeLoadError => 'Could not load the code.';

  @override
  String get codeCommentsNote => 'Code comments are in Portuguese.';

  @override
  String get themeTooltip => 'Theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'Follow system';

  @override
  String get languageTooltip => 'Language';

  @override
  String get languageSystem => 'Follow system';
}
