import 'package:flutter/material.dart';

class SnackBarBasico extends StatelessWidget {
  const SnackBarBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        // O ScaffoldMessenger mostra a SnackBar embaixo da tela atual. Ela
        // some sozinha depois de 4 segundos.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mensagem enviada.')),
        );
      },
      child: const Text('Enviar mensagem'),
    );
  }
}
