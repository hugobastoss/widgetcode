import 'package:flutter/material.dart';

class PaddingBasico extends StatelessWidget {
  const PaddingBasico({super.key});

  @override
  Widget build(BuildContext context) {
    const estilo = TextStyle(color: Colors.black87);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        // Sem Padding: o texto encosta nas bordas do fundo.
        Container(
          color: Colors.indigo.shade100,
          child: const Text('Sem', style: estilo),
        ),
        // Com Padding: 16 de espaço em todos os lados. O Container também
        // tem um parâmetro padding, que faz a mesma coisa.
        Container(
          color: Colors.indigo.shade100,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Com padding', style: estilo),
          ),
        ),
      ],
    );
  }
}
