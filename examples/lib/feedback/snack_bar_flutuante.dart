import 'package:flutter/material.dart';

class SnackBarFlutuante extends StatelessWidget {
  const SnackBarFlutuante({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sem conexão. Tentando de novo...'),
            // floating: solta das bordas, com cantos arredondados.
            behavior: SnackBarBehavior.floating,
            // Um X para a pessoa fechar quando quiser.
            showCloseIcon: true,
            // Quanto tempo fica na tela (o padrão é 4 segundos).
            duration: Duration(seconds: 6),
          ),
        );
      },
      child: const Text('Mostrar aviso'),
    );
  }
}
