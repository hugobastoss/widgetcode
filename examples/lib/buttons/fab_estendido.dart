import 'package:flutter/material.dart';

class FabEstendido extends StatelessWidget {
  const FabEstendido({super.key});

  @override
  Widget build(BuildContext context) {
    // .extended troca o ícone sozinho por ícone + texto, deixando claro o
    // que o botão faz.
    return FloatingActionButton.extended(
      onPressed: () {},
      icon: const Icon(Icons.edit_outlined),
      label: const Text('Escrever'),
    );
  }
}
