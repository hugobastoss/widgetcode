import 'package:flutter/material.dart';

class TextButtonBasico extends StatelessWidget {
  const TextButtonBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem fundo nem borda: o destaque aparece só ao tocar.
    return TextButton(
      onPressed: () {},
      child: const Text('Saiba mais'),
    );
  }
}
