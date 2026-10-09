import 'package:flutter/material.dart';

class CardVariantes extends StatelessWidget {
  const CardVariantes({super.key});

  @override
  Widget build(BuildContext context) {
    // O Material 3 tem três estilos de card. Escolha um e use no app todo.
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Padrão: com sombra (elevação).
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Card (com sombra)'),
          ),
        ),
        // .filled: fundo preenchido, sem sombra.
        Card.filled(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Card.filled'),
          ),
        ),
        // .outlined: só a borda.
        Card.outlined(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Card.outlined'),
          ),
        ),
      ],
    );
  }
}
