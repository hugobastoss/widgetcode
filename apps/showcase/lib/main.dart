import 'package:flutter/material.dart';

import 'l10n/app_localizations.dart';
import 'learn/favorites.dart';
import 'learn/locale_controller.dart';
import 'learn/screens/learn_home_screen.dart';
import 'learn/theme_mode_controller.dart';

// Azul do Flutter — semente do esquema Material 3 do app.
const _kCorSemente = Color(0xFF0175C2);

Future<void> main() async {
  // Plugins (como o shared_preferences) só podem ser usados antes do runApp
  // depois disto.
  WidgetsFlutterBinding.ensureInitialized();
  final tema = await ThemeModeController.load();
  final idioma = await LocaleController.load();
  final favoritos = await FavoritesController.load();
  runApp(
    ShowcaseApp(
      themeController: tema,
      localeController: idioma,
      favoritesController: favoritos,
    ),
  );
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({
    super.key,
    required this.themeController,
    required this.localeController,
    required this.favoritesController,
  });

  final ThemeModeController themeController;
  final LocaleController localeController;
  final FavoritesController favoritesController;

  @override
  Widget build(BuildContext context) {
    // Acima do MaterialApp, para todas as telas (rotas) enxergarem os
    // favoritos.
    return FavoritesScope(
      controller: favoritesController,
      // Reconstrói o MaterialApp quando a pessoa troca o tema ou o idioma.
      child: ListenableBuilder(
        listenable: Listenable.merge([themeController, localeController]),
        builder: (context, _) => MaterialApp(
          title: 'Flutter Widgets Hub',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: _kCorSemente,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: _kCorSemente,
            brightness: Brightness.dark,
          ),
          themeMode: themeController.value,
          // null = segue o idioma do sistema (resolvido abaixo).
          locale: localeController.value,
          supportedLocales: LocaleController.supportedLocales,
          // Traduz os textos do app e os textos prontos do Material e do
          // Cupertino (dicas de "Voltar", menu de copiar e colar...).
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          localeListResolutionCallback: (doSistema, _) =>
              LocaleController.resolve(doSistema),
          home: LearnHomeScreen(
            themeController: themeController,
            localeController: localeController,
          ),
        ),
      ),
    );
  }
}
