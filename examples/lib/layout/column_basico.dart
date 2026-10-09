import 'package:flutter/material.dart';

class ColumnBasico extends StatelessWidget {
  const ColumnBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Column empilha os filhos de cima para baixo.
    return const Column(
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
      width: 120,
      height: 40,
      color: cor,
      alignment: Alignment.center,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
