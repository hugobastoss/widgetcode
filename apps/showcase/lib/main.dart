import 'package:flutter/material.dart';

import 'learn/screens/learn_home_screen.dart';
import 'learn/theme_mode_controller.dart';

// Azul do Flutter — semente do esquema Material 3 do app.
const _kCorSemente = Color(0xFF0175C2);

Future<void> main() async {
  // Plugins (como o shared_preferences) só podem ser usados antes do runApp
  // depois disto.
  WidgetsFlutterBinding.ensureInitialized();
  final tema = await ThemeModeController.load();
  runApp(ShowcaseApp(themeController: tema));
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key, required this.themeController});

  final ThemeModeController themeController;

  @override
  Widget build(BuildContext context) {
    // Reconstrói o MaterialApp quando a pessoa troca o tema no menu.
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, modo, _) => MaterialApp(
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
        themeMode: modo,
        // A Home antiga do catálogo Hub (screens/home_screen.dart) continua
        // no projeto, só deixou de ser a tela inicial.
        home: LearnHomeScreen(themeController: themeController),
      ),
    );
  }
}
