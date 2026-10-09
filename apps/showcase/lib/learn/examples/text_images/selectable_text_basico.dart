import 'package:flutter/material.dart';

class SelectableTextBasico extends StatelessWidget {
  const SelectableTextBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Toque e segure para selecionar. Com o texto selecionado, aparece o
    // menu de copiar. Um Text comum não deixa fazer isso.
    return const SelectableText(
      'Seu código de convite é FLUTTER-2026. Toque e segure para copiar.',
      textAlign: TextAlign.center,
    );
  }
}
