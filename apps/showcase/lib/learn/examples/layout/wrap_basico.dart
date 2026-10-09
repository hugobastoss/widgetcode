import 'package:flutter/material.dart';

class WrapBasico extends StatelessWidget {
  const WrapBasico({super.key});

  static const _tags = [
    'Flutter', 'Dart', 'Android', 'iOS', 'Web', 'Material', 'Widgets', //
    'Layout',
  ];

  @override
  Widget build(BuildContext context) {
    // Quando um item não cabe mais na linha, o Wrap continua na próxima.
    // Uma Row, no mesmo caso, mostraria um erro de overflow.
    return Wrap(
      spacing: 8, // espaço entre itens da mesma linha
      runSpacing: 8, // espaço entre as linhas
      children: [
        for (final tag in _tags) Chip(label: Text(tag)),
      ],
    );
  }
}
