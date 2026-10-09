import 'package:flutter/material.dart';

class RichTextIcone extends StatelessWidget {
  const RichTextIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Toque em '),
          // WidgetSpan coloca um widget qualquer no meio do texto.
          WidgetSpan(
            // Alinha o ícone com o meio da linha de texto.
            alignment: PlaceholderAlignment.middle,
            child: Icon(Icons.favorite, size: 18, color: Colors.pink),
          ),
          TextSpan(text: ' para salvar nos favoritos.'),
        ],
      ),
    );
  }
}
