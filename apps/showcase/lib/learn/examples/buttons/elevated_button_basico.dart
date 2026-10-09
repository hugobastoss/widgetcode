import 'package:flutter/material.dart';

class ElevatedButtonBasico extends StatelessWidget {
  const ElevatedButtonBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed recebe a função executada quando o botão é tocado.
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Botão tocado!')),
        );
      },
      // child é o conteúdo do botão — normalmente um Text.
      child: const Text('Salvar'),
    );
  }
}
