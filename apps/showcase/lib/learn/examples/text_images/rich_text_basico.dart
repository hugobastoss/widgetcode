import 'package:flutter/material.dart';

class RichTextBasico extends StatelessWidget {
  const RichTextBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      // O texto é uma árvore de TextSpan: cada pedaço pode ter seu estilo.
      text: TextSpan(
        // RichText NÃO herda o estilo padrão do app, então pegamos ele
        // aqui. Sem isso, o texto pode sair com outra fonte e cor.
        style: DefaultTextStyle.of(context).style,
        children: const [
          TextSpan(text: 'O Flutter é '),
          TextSpan(
            text: 'rápido',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' e '),
          TextSpan(
            text: 'bonito',
            style: TextStyle(color: Colors.teal, fontStyle: FontStyle.italic),
          ),
          TextSpan(text: '.'),
        ],
      ),
    );
  }
}
