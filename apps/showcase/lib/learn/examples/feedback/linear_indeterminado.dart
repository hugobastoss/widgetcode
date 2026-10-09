import 'package:flutter/material.dart';

class LinearIndeterminado extends StatelessWidget {
  const LinearIndeterminado({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem value, a barra corre sem parar. Ocupa toda a largura disponível
    // (aqui, a do SizedBox).
    return const SizedBox(
      width: 220,
      child: LinearProgressIndicator(),
    );
  }
}
