import 'package:flutter/material.dart';

class OutlinedButtonBasico extends StatelessWidget {
  const OutlinedButtonBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Só a borda, sem preenchimento: chama menos atenção que o
    // FilledButton, ideal para a ação secundária ao lado dele.
    return OutlinedButton(
      onPressed: () {},
      child: const Text('Cancelar'),
    );
  }
}
