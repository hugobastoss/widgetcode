import 'package:flutter/material.dart';

class TooltipBasico extends StatelessWidget {
  const TooltipBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // No celular, a dica aparece ao tocar e segurar; no computador, ao
    // passar o mouse. Leitores de tela também leem a mensagem.
    return const Tooltip(
      message: 'Adicionar aos favoritos',
      child: Icon(Icons.favorite_border, size: 40),
    );
  }
}
