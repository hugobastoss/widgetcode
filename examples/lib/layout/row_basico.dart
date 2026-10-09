import 'package:flutter/material.dart';

class RowBasico extends StatelessWidget {
  const RowBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Row coloca os filhos lado a lado, da esquerda para a direita.
    return const Row(
      children: [
        _Caixa(Colors.indigo, '1'),
        _Caixa(Colors.teal, '2'),
        _Caixa(Colors.deepOrange, '3'),
      ],
    );
  }
}

class _Caixa extends StatelessWidget {
  const _Caixa(this.cor, this.texto);

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      color: cor,
      alignment: Alignment.center,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
