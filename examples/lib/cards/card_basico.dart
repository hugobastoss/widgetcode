import 'package:flutter/material.dart';

class CardBasico extends StatelessWidget {
  const CardBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Card é uma superfície com cantos arredondados e um leve destaque do
    // fundo. Ele não tem espaçamento interno: o Padding fica por sua conta.
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Um card agrupa informações relacionadas.'),
      ),
    );
  }
}
