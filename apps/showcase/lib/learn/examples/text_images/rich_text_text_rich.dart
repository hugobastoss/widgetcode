import 'package:flutter/material.dart';

class RichTextTextRich extends StatelessWidget {
  const RichTextTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    // Text.rich faz o mesmo que o RichText, mas já herda o estilo padrão do
    // app. É o jeito recomendado no dia a dia.
    return const Text.rich(
      TextSpan(
        text: 'Total: ',
        children: [
          // O r antes das aspas cria uma string "crua": sem ele, o Dart
          // tentaria ler $ como o começo de uma variável.
          TextSpan(
            text: r'R$ 49,90',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: r'  R$ 79,90',
            style: TextStyle(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
