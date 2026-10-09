import 'package:flutter/material.dart';

import 'learn/screens/learn_home_screen.dart';

// Azul do Flutter — semente do esquema Material 3 do app.
const _kCorSemente = Color(0xFF0175C2);

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // A Home antiga do catálogo Hub (screens/home_screen.dart) continua no
      // projeto, só deixou de ser a tela inicial.
      home: const LearnHomeScreen(),
    );
  }
}
