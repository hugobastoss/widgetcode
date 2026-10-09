import 'package:flutter/material.dart';

class TextButtonComIcone extends StatelessWidget {
  const TextButtonComIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.open_in_new),
      label: const Text('Abrir site'),
    );
  }
}
