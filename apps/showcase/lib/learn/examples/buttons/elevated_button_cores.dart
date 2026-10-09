import 'package:flutter/material.dart';

class ElevatedButtonCores extends StatelessWidget {
  const ElevatedButtonCores({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      // styleFrom monta o estilo do botão a partir de valores simples.
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white, // cor do texto e do ícone
        elevation: 4, // tamanho da sombra
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Assinar'),
    );
  }
}
