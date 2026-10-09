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
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Automático';

  @override
  String get languageSystem => 'Seguir el sistema';

  @override
  String get askAiButton => 'Pedir a la IA';

  @override
  String get aiRequestCopied => 'Pedido copiado';

  @override
  String aiRequest(String id) {
    return 'Trae el ejemplo \"$id\" de Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) a mi proyecto.';
  }

  @override
  String get helpCardTitle => 'Lleva un ejemplo a tu app';

  @override
  String get helpCardSubtitle => 'Con tu IA de código, en 3 pasos';

  @override
  String get helpTitle => 'Cómo usar';

  @override
  String get helpIntro =>
      'Cada ejemplo de la app es un archivo del repositorio en GitHub. Para llevar uno a tu proyecto, pídeselo a tu IA de código: ella busca el archivo y lo adapta a tu app.';

  @override
  String get helpStep1Title => 'Dale a tu IA la referencia del repositorio';

  @override
  String get helpStep1Body =>
      'Instala la skill flutter-widgets-hub en tu proyecto (copia la carpeta .claude/skills/flutter-widgets-hub del repositorio a tu proyecto) o simplemente menciona la dirección del repositorio en tu pedido, si tu IA puede navegar por internet.';

  @override
  String get helpStep2Title => 'Elige el ejemplo en la app';

  @override
  String get helpStep2Body =>
      'Abre el widget, toca Código en el ejemplo que quieras y luego Pedir a la IA. Así se copia un pedido listo, con el ID del ejemplo (como buttons/elevated_button_carregando). Para llevar varios, toca la estrella de cada uno y usa Pedir todos a la IA en la pantalla Favoritos.';

  @override
  String get helpStep3Title => 'Pega el pedido en tu IA';

  @override
  String get helpStep3Body =>
      'La IA busca el archivo, lo agrega a tu proyecto y adapta nombres y textos. Si el ejemplo usa una imagen o internet, también configura el pubspec.yaml o el permiso de Android.';

  @override
  String get helpManualTitle => 'Sin IA';

  @override
  String get helpManualBody =>
      'Toca Copiar código, crea un archivo .dart en la carpeta lib de tu proyecto, pega el código, importa ese archivo en tu pantalla y usa el widget; por ejemplo, const ElevatedButtonBasico().';

  @override
  String get helpOpenRepo => 'Abrir el repositorio';

  @override
  String get favoriteAdd => 'Añadir a favoritos';

  @override
  String get favoriteRemove => 'Quitar de favoritos';

  @override
  String get favoritesTitle => 'Favoritos';

  @override
  String get favoritesEmpty =>
      'Aún no hay favoritos. Toca la estrella de un ejemplo para guardarlo aquí.';

  @override
  String get askAiAllButton => 'Pedir todos a la IA';

  @override
  String aiRequestMany(String ids) {
    return 'Trae estos ejemplos de Flutter Widgets Hub (github.com/hugobastoss/flutterwidgetshub) a mi proyecto: $ids.';
  }

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsLanguage => 'Idioma';

  @override
  String get settingsHelp => 'Ayuda';

  @override
  String get settingsGeneral => 'General';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get contactSupport => 'Contactar con soporte';

  @override
  String get contactSupportSubtitle => 'Abre un issue en GitHub';

  @override
  String supportIssueBody(String version) {
    return 'Describe tu duda o el problema:\n\n\n---\nFlutter Widgets Hub $version';
  }

  @override
  String get shareApp => 'Compartir la app';

  @override
  String shareMessage(String link) {
    return 'Conoce Flutter Widgets Hub: ejemplos de los widgets nativos de Flutter funcionando de verdad, con el código de cada uno. $link';
  }

  @override
  String get rateApp => 'Calificar la app';

  @override
  String get rateAppSubtitle => 'En Google Play';

  @override
  String get moreApps => 'Más aplicaciones';

  @override
  String moreAppsSubtitle(String developer) {
    return 'Otras apps de $developer';
  }

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get comingSoon => 'Próximamente';

  @override
  String get aboutApp => 'Acerca de la app';

  @override
  String get aboutDescription =>
      'Vitrina de los widgets nativos de Flutter: cada ejemplo funciona de verdad y muestra su propio código, listo para que tu IA de código lo lleve a tu proyecto.';

  @override
  String get aboutLicense => 'Código abierto, licencia MIT.';

  @override
  String versionLabel(String version) {
    return 'Versión $version';
  }

  @override
  String get openLinkFailed => 'No se pudo abrir el enlace.';
}
