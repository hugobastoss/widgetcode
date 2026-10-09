import 'package:flutter/material.dart';

class TextEstilo extends StatelessWidget {
  const TextEstilo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Text(
          'Grande e negrito',
          // TextStyle reúne tudo sobre a aparência do texto.
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Colorido e itálico',
          style: TextStyle(color: Colors.teal, fontStyle: FontStyle.italic),
        ),
        Text(
          'Sublinhado',
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        Text(
          'LETRAS ESPAÇADAS',
          style: TextStyle(letterSpacing: 4),
        ),
      ],
    );
  }
}
