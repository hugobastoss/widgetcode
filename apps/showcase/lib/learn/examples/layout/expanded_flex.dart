import 'package:flutter/material.dart';

class ExpandedFlex extends StatelessWidget {
  const ExpandedFlex({super.key});

  @override
  Widget build(BuildContext context) {
    // flex define a proporção de cada um: 1 + 2 + 1 = 4 partes. O do meio
    // fica com 2 das 4 partes — metade da largura.
    return const Row(
      children: [
        Expanded(flex: 1, child: _Faixa(Colors.indigo, 'flex 1')),
        Expanded(flex: 2, child: _Faixa(Colors.teal, 'flex 2')),
        Expanded(flex: 1, child: _Faixa(Colors.deepOrange, 'flex 1')),
      ],
    );
  }
}

class _Faixa extends StatelessWidget {
  const _Faixa(this.cor, this.texto);

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      color: cor,
      alignment: Alignment.center,
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
