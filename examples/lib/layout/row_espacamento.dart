import 'package:flutter/material.dart';

class RowEspacamento extends StatelessWidget {
  const RowEspacamento({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      // spacing coloca o mesmo espaço entre todos os filhos, sem precisar de
      // um SizedBox entre cada um.
      spacing: 16,
      // min: a Row fica do tamanho dos filhos (e o grupo aparece centralizado).
      mainAxisSize: MainAxisSize.min,
      children: [
        _Caixa(Colors.indigo),
        _Caixa(Colors.teal),
        _Caixa(Colors.deepOrange),
      ],
    );
  }
}

class _Caixa extends StatelessWidget {
  const _Caixa(this.cor);

  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(width: 48, height: 48, color: cor);
  }
}
