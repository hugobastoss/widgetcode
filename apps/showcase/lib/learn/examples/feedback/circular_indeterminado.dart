import 'package:flutter/material.dart';

class CircularIndeterminado extends StatelessWidget {
  const CircularIndeterminado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 32,
      children: [
        // Sem value, gira sem parar: "carregando, sem saber quanto falta".
        CircularProgressIndicator(),
        // O tamanho vem do SizedBox; strokeWidth é a espessura da linha.
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ],
    );
  }
}
