import 'package:flutter/material.dart';

class TextFieldLinhas extends StatelessWidget {
  const TextFieldLinhas({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // Começa com 3 linhas e cresce até 5; depois disso, o texto rola.
      minLines: 3,
      maxLines: 5,
      // Mostra o contador "0/140" e não deixa passar do limite.
      maxLength: 140,
      decoration: InputDecoration(
        labelText: 'Comentário',
        // Em campos de várias linhas, deixa o rótulo no topo.
        alignLabelWithHint: true,
        border: OutlineInputBorder(),
      ),
    );
  }
}
