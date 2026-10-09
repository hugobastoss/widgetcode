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
  /// **'Automático'**
  String get themeSystem;

  /// No description provided for @languageSystem.
  ///
  /// In pt, this message translates to:
  /// **'Seguir o sistema'**
  String get languageSystem;

  /// No description provided for @askAiButton.
  ///
  /// In pt, this message translates to:
  /// **'Pedir para a IA'**
  String get askAiButton;

  /// No description provided for @aiRequestCopied.
  ///
  /// In pt, this message translates to:
  /// **'Pedido copiado'**
  String get aiRequestCopied;

  /// No description provided for @aiRequest.
  ///
  /// In pt, this message translates to:
  /// **'Traga o exemplo \"{id}\" do Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) para o meu projeto.'**
  String aiRequest(String id);

  /// No description provided for @helpCardTitle.
  ///
  /// In pt, this message translates to:
  /// **'Leve um exemplo para o seu app'**
  String get helpCardTitle;

  /// No description provided for @helpCardSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Com a sua IA de código, em 3 passos'**
  String get helpCardSubtitle;

  /// No description provided for @helpTitle.
  ///
  /// In pt, this message translates to:
  /// **'Como usar'**
  String get helpTitle;

  /// No description provided for @helpIntro.
  ///
  /// In pt, this message translates to:
  /// **'Cada exemplo do app é um arquivo do repositório no GitHub. Para trazer um exemplo para o seu projeto, peça para a sua IA de código: ela busca o arquivo e adapta para o seu app.'**
  String get helpIntro;

  /// No description provided for @helpStep1Title.
  ///
  /// In pt, this message translates to:
  /// **'Dê à sua IA a referência do repositório'**
  String get helpStep1Title;

  /// No description provided for @helpStep1Body.
  ///
  /// In pt, this message translates to:
  /// **'Instale a skill flutter-widgets-hub no seu projeto (copie a pasta .claude/skills/flutter-widgets-hub do repositório para o seu projeto) ou apenas cite o endereço do repositório no pedido, se a sua IA acessa a internet.'**
  String get helpStep1Body;

  /// No description provided for @helpStep2Title.
  ///
  /// In pt, this message translates to:
  /// **'Escolha o exemplo no app'**
  String get helpStep2Title;

  /// No description provided for @helpStep2Body.
  ///
  /// In pt, this message translates to:
  /// **'Abra o widget, toque em Código no exemplo que você quer e depois em Pedir para a IA. Isso copia um pedido pronto, com o ID do exemplo (como buttons/elevated_button_carregando). Para levar vários, toque na estrela de cada um e use Pedir todos para a IA na tela Favoritos.'**
  String get helpStep2Body;

  /// No description provided for @helpStep3Title.
  ///
  /// In pt, this message translates to:
  /// **'Cole o pedido na sua IA'**
  String get helpStep3Title;

  /// No description provided for @helpStep3Body.
  ///
  /// In pt, this message translates to:
  /// **'A IA busca o arquivo, coloca no seu projeto e adapta nomes e textos. Se o exemplo usa uma imagem ou a internet, ela também configura o pubspec.yaml ou a permissão do Android.'**
  String get helpStep3Body;

  /// No description provided for @helpManualTitle.
  ///
  /// In pt, this message translates to:
  /// **'Sem IA'**
  String get helpManualTitle;

  /// No description provided for @helpManualBody.
  ///
  /// In pt, this message translates to:
  /// **'Toque em Copiar código, crie um arquivo .dart na pasta lib do seu projeto, cole o código, importe esse arquivo na sua tela e use o widget — por exemplo, const ElevatedButtonBasico().'**
  String get helpManualBody;

  /// No description provided for @helpOpenRepo.
  ///
  /// In pt, this message translates to:
  /// **'Abrir o repositório'**
  String get helpOpenRepo;

  /// No description provided for @favoriteAdd.
  ///
  /// In pt, this message translates to:
  /// **'Favoritar'**
  String get favoriteAdd;

  /// No description provided for @favoriteRemove.
  ///
  /// In pt, this message translates to:
  /// **'Remover dos favoritos'**
  String get favoriteRemove;

  /// No description provided for @favoritesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Favoritos'**
  String get favoritesTitle;

  /// No description provided for @favoritesEmpty.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum favorito ainda. Toque na estrela de um exemplo para guardá-lo aqui.'**
  String get favoritesEmpty;

  /// No description provided for @askAiAllButton.
  ///
  /// In pt, this message translates to:
  /// **'Pedir todos para a IA'**
  String get askAiAllButton;

  /// No description provided for @aiRequestMany.
  ///
  /// In pt, this message translates to:
  /// **'Traga estes exemplos do Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) para o meu projeto: {ids}.'**
  String aiRequestMany(String ids);

  /// No description provided for @settingsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In pt, this message translates to:
  /// **'Aparência'**
  String get settingsAppearance;

  /// No description provided for @settingsLanguage.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get settingsLanguage;

  /// No description provided for @settingsHelp.
  ///
  /// In pt, this message translates to:
  /// **'Ajuda'**
  String get settingsHelp;

  /// No description provided for @settingsGeneral.
  ///
  /// In pt, this message translates to:
  /// **'Geral'**
  String get settingsGeneral;

  /// No description provided for @settingsAbout.
  ///
  /// In pt, this message translates to:
  /// **'Sobre'**
  String get settingsAbout;

  /// No description provided for @contactSupport.
  ///
  /// In pt, this message translates to:
  /// **'Falar com o suporte'**
  String get contactSupport;

  /// No description provided for @contactSupportSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Abre uma issue no GitHub'**
  String get contactSupportSubtitle;

  /// No description provided for @supportIssueBody.
  ///
  /// In pt, this message translates to:
  /// **'Descreva sua dúvida ou o problema:\n\n\n---\nFlutter Widgets Hub {version}'**
  String supportIssueBody(String version);

  /// No description provided for @shareApp.
  ///
  /// In pt, this message translates to:
  /// **'Compartilhar o app'**
  String get shareApp;

  /// No description provided for @shareMessage.
  ///
  /// In pt, this message translates to:
  /// **'Conheça o Flutter Widgets Hub: exemplos dos widgets nativos do Flutter rodando de verdade, com o código de cada um. {link}'**
  String shareMessage(String link);

  /// No description provided for @rateApp.
  ///
  /// In pt, this message translates to:
  /// **'Avaliar o app'**
  String get rateApp;

  /// No description provided for @rateAppSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Na Play Store'**
  String get rateAppSubtitle;

  /// No description provided for @moreApps.
  ///
  /// In pt, this message translates to:
  /// **'Mais aplicativos'**
  String get moreApps;

  /// No description provided for @moreAppsSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Outros apps da {developer}'**
  String moreAppsSubtitle(String developer);

  /// No description provided for @termsOfUse.
  ///
  /// In pt, this message translates to:
  /// **'Termos de uso'**
  String get termsOfUse;

  /// No description provided for @privacyPolicy.
  ///
  /// In pt, this message translates to:
  /// **'Política de privacidade'**
  String get privacyPolicy;

  /// No description provided for @comingSoon.
  ///
  /// In pt, this message translates to:
  /// **'Em breve'**
  String get comingSoon;

  /// No description provided for @aboutApp.
  ///
  /// In pt, this message translates to:
  /// **'Sobre o app'**
  String get aboutApp;

  /// No description provided for @aboutDescription.
  ///
  /// In pt, this message translates to:
  /// **'Vitrine dos widgets nativos do Flutter: cada exemplo roda de verdade e mostra o próprio código, pronto para a sua IA de código levar para o seu projeto.'**
  String get aboutDescription;

  /// No description provided for @aboutLicense.
  ///
  /// In pt, this message translates to:
  /// **'Código aberto, licença MIT.'**
  String get aboutLicense;

  /// No description provided for @versionLabel.
  ///
  /// In pt, this message translates to:
  /// **'Versão {version}'**
  String versionLabel(String version);

  /// No description provided for @openLinkFailed.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível abrir o link.'**
  String get openLinkFailed;
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
