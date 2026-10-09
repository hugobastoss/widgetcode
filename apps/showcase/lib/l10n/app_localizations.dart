import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @homeIntro.
  ///
  /// In pt, this message translates to:
  /// **'Aprenda os widgets nativos do Flutter com exemplos que rodam de verdade.'**
  String get homeIntro;

  /// No description provided for @searchHint.
  ///
  /// In pt, this message translates to:
  /// **'Buscar widget, ex.: ListView'**
  String get searchHint;

  /// No description provided for @sectionsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Seções'**
  String get sectionsTitle;

  /// No description provided for @homeSummary.
  ///
  /// In pt, this message translates to:
  /// **'{sections} seções · {widgets} widgets'**
  String homeSummary(int sections, int widgets);

  /// No description provided for @widgetCount.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 widget} other{{count} widgets}}'**
  String widgetCount(int count);

  /// No description provided for @exampleCount.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =1{1 exemplo} other{{count} exemplos}}'**
  String exampleCount(int count);

  /// No description provided for @examplesHeader.
  ///
  /// In pt, this message translates to:
  /// **'Exemplos ({count})'**
  String examplesHeader(int count);

  /// No description provided for @sectionUnderConstruction.
  ///
  /// In pt, this message translates to:
  /// **'Seção \"{name}\" em construção.'**
  String sectionUnderConstruction(String name);

  /// No description provided for @codeButton.
  ///
  /// In pt, this message translates to:
  /// **'Código'**
  String get codeButton;

  /// No description provided for @copyCodeTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Copiar código'**
  String get copyCodeTooltip;

  /// No description provided for @openOnGitHubTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Abrir no GitHub'**
  String get openOnGitHubTooltip;

  /// No description provided for @codeCopied.
  ///
  /// In pt, this message translates to:
  /// **'Código copiado.'**
  String get codeCopied;

  /// No description provided for @codeLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar o código.'**
  String get codeLoadError;

  /// No description provided for @codeCommentsNote.
  ///
  /// In pt, this message translates to:
  /// **'Os comentários do código estão em português.'**
  String get codeCommentsNote;

  /// No description provided for @themeTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Tema'**
  String get themeTooltip;

  /// No description provided for @themeLight.
  ///
  /// In pt, this message translates to:
  /// **'Claro'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In pt, this message translates to:
  /// **'Escuro'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In pt, this message translates to:
  /// **'Seguir o sistema'**
  String get themeSystem;

  /// No description provided for @languageTooltip.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get languageTooltip;

  /// No description provided for @languageSystem.
  ///
  /// In pt, this message translates to:
  /// **'Seguir o sistema'**
  String get languageSystem;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
