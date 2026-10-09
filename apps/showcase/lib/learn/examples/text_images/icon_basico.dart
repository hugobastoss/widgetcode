import 'package:flutter/material.dart';

class IconBasico extends StatelessWidget {
  const IconBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // A classe Icons tem milhares de ícones do Material Design. Busque os
    // nomes em fonts.google.com/icons.
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        Icon(Icons.home),
        Icon(Icons.search),
        Icon(Icons.settings),
      ],
    );
  }
}
