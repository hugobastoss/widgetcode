import 'package:flutter/material.dart';

class PaddingEdgeInsets extends StatelessWidget {
  const PaddingEdgeInsets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        // O mesmo espaço nos quatro lados.
        _Exemplo(EdgeInsets.all(12), 'EdgeInsets.all(12)'),
        // Um valor para a horizontal (esquerda e direita) e outro para a
        // vertical (cima e baixo).
        _Exemplo(
          EdgeInsets.symmetric(horizontal: 32, vertical: 4),
          'EdgeInsets.symmetric(horizontal: 32, vertical: 4)',
        ),
        // Só nos lados que você escolher.
        _Exemplo(EdgeInsets.only(left: 48), 'EdgeInsets.only(left: 48)'),
      ],
    );
  }
}

class _Exemplo extends StatelessWidget {
  const _Exemplo(this.espaco, this.rotulo);

  final EdgeInsets espaco;
  final String rotulo;

  @override
  Widget build(BuildContext context) {
    // O fundo claro é a área do Padding; o bloco escuro é o filho.
    return Container(
      color: Colors.teal.shade100,
      child: Padding(
        padding: espaco,
        child: Container(
          color: Colors.teal.shade700,
          padding: const EdgeInsets.all(8),
          child: Text(
            rotulo,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
