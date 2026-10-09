import 'package:flutter/material.dart';

class OutlinedButtonComIcone extends StatelessWidget {
  const OutlinedButtonComIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back),
      label: const Text('Voltar'),
    );
  }
}
