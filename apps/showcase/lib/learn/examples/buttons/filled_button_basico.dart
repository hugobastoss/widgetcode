import 'package:flutter/material.dart';

class FilledButtonBasico extends StatelessWidget {
  const FilledButtonBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Usa a cor primária do tema — o botão de maior destaque do Material 3.
    // Use um por tela, para a ação mais importante.
    return FilledButton(
      onPressed: () {},
      child: const Text('Confirmar'),
    );
  }
}
