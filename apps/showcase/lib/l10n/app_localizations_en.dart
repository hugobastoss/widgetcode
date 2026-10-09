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

  @override
  String get askAiButton => 'Ask your AI';

  @override
  String get aiRequestCopied => 'Request copied';

  @override
  String aiRequest(String id) {
    return 'Bring the \"$id\" example from Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) into my project.';
  }

  @override
  String get helpCardTitle => 'Bring an example into your app';

  @override
  String get helpCardSubtitle => 'With your coding AI, in 3 steps';

  @override
  String get helpTitle => 'How to use';

  @override
  String get helpIntro =>
      'Every example in the app is a file in the GitHub repository. To bring one into your project, ask your coding AI: it fetches the file and adapts it to your app.';

  @override
  String get helpStep1Title => 'Give your AI the repository reference';

  @override
  String get helpStep1Body =>
      'Install the flutter-widgets-hub skill in your project (copy the .claude/skills/flutter-widgets-hub folder from the repository into your project), or just mention the repository address in your request if your AI can browse the web.';

  @override
  String get helpStep2Title => 'Pick the example in the app';

  @override
  String get helpStep2Body =>
      'Open the widget, tap Code on the example you want, then Ask your AI. This copies a ready-made request with the example ID (like buttons/elevated_button_carregando).';

  @override
  String get helpStep3Title => 'Paste the request into your AI';

  @override
  String get helpStep3Body =>
      'Your AI fetches the file, adds it to your project and adapts names and texts. If the example uses an image or the internet, it also sets up pubspec.yaml or the Android permission.';

  @override
  String get helpManualTitle => 'Without AI';

  @override
  String get helpManualBody =>
      'Tap Copy code, create a .dart file in your project\'s lib folder, paste the code, import that file in your screen and use the widget — for example, const ElevatedButtonBasico().';

  @override
  String get helpOpenRepo => 'Open the repository';
}
