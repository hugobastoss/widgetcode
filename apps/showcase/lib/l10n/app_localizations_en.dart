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
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'Automatic';

  @override
  String get askAiButton => 'Ask your AI';

  @override
  String get aiRequestCopied => 'Request copied';

  @override
  String aiRequest(String id) {
    return 'Bring the \"$id\" example from Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) into my project.';
  }

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
      'Open the widget, tap Code on the example you want, then Ask your AI. This copies a ready-made request with the example ID (like buttons/elevated_button_carregando). To take several, tap the star on each one and use Ask your AI for all on the Favorites screen.';

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

  @override
  String get favoriteAdd => 'Add to favorites';

  @override
  String get favoriteRemove => 'Remove from favorites';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesEmpty =>
      'No favorites yet. Tap the star on an example to keep it here.';

  @override
  String get askAiAllButton => 'Ask your AI for all';

  @override
  String aiRequestMany(String ids) {
    return 'Bring these examples from Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) into my project: $ids.';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsAbout => 'About';

  @override
  String get contactSupport => 'Contact support';

  @override
  String get contactSupportSubtitle => 'Opens an issue on GitHub';

  @override
  String supportIssueBody(String version) {
    return 'Describe your question or the problem:\n\n\n---\nFlutter Widgets Hub $version';
  }

  @override
  String get shareApp => 'Share the app';

  @override
  String shareMessage(String link) {
    return 'Check out Flutter Widgets Hub: examples of Flutter\'s native widgets running for real, each with its code. $link';
  }

  @override
  String get rateApp => 'Rate the app';

  @override
  String get rateAppSubtitle => 'On Google Play';

  @override
  String get moreApps => 'More apps';

  @override
  String moreAppsSubtitle(String developer) {
    return 'Other apps by $developer';
  }

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get aboutApp => 'About the app';

  @override
  String get aboutDescription =>
      'A showcase of Flutter\'s native widgets: every example runs for real and shows its own code, ready for your coding AI to bring into your project.';

  @override
  String get aboutLicense => 'Open source, MIT License.';

  @override
  String versionLabel(String version) {
    return 'Version $version';
  }

  @override
  String get openLinkFailed => 'Couldn\'t open the link.';
}
