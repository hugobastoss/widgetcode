import 'package:flutter/material.dart';

class IconButtonPadrao extends StatelessWidget {
  const IconButtonPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      // O tooltip aparece ao tocar e segurar, e é lido pelos leitores de
      // tela. Todo botão só com ícone deveria ter um.
      tooltip: 'Compartilhar',
      icon: const Icon(Icons.share_outlined),
    );
  }
}
