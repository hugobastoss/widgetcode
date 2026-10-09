import 'package:flutter/material.dart';

class FilledButtonComIcone extends StatelessWidget {
  const FilledButtonComIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.send),
      label: const Text('Enviar'),
    );
  }
}
