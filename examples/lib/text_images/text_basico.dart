import 'package:flutter/material.dart';

class TextBasico extends StatelessWidget {
  const TextBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem estilo, o Text usa o estilo padrão do tema.
    return const Text('Olá, Flutter!');
  }
}
