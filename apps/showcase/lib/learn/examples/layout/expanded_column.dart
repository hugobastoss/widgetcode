import 'package:flutter/material.dart';

class ExpandedColumn extends StatelessWidget {
  const ExpandedColumn({super.key});

  @override
  Widget build(BuildContext context) {
    // Numa Column, o Expanded só funciona se a altura for limitada — senão
    // não existe "espaço que sobra" para dividir. Aqui quem limita é o
    // SizedBox; numa tela de verdade, normalmente é o Scaffold.
    return const SizedBox(
      height: 200,
      child: Column(
        children: [
          _Faixa(Colors.indigo, 'Cabeçalho', altura: 40),
          Expanded(child: _Faixa(Colors.teal, 'Conteúdo (Expanded)')),
          _Faixa(Colors.indigo, 'Rodapé', altura: 40),
        ],
      ),
    );
  }
}

class _Faixa extends StatelessWidget {
  const _Faixa(this.cor, this.texto, {this.altura});

  final Color cor;
  final String texto;

  /// Sem altura, a faixa ocupa a altura que o pai der (aqui, a do Expanded).
  final double? altura;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura,
      width: double.infinity,
      color: cor,
      alignment: Alignment.center,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
