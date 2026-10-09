import 'package:flutter/material.dart';

class ElevatedButtonComIcone extends StatelessWidget {
  const ElevatedButtonComIcone({super.key});

  @override
  Widget build(BuildContext context) {
    // O construtor .icon recebe o ícone e o rótulo separados e já cuida do
    // espaçamento entre os dois.
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.download),
      label: const Text('Baixar'),
    );
  }
}
