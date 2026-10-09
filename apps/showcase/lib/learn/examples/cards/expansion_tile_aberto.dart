import 'package:flutter/material.dart';

class ExpansionTileAberto extends StatefulWidget {
  const ExpansionTileAberto({super.key});

  @override
  State<ExpansionTileAberto> createState() => _ExpansionTileAbertoState();
}

class _ExpansionTileAbertoState extends State<ExpansionTileAberto> {
  bool _aberto = true;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      // Já começa aberto.
      initiallyExpanded: true,
      leading: const Icon(Icons.receipt_long_outlined),
      title: const Text('Resumo do pedido'),
      subtitle: Text(_aberto ? 'Toque para fechar' : 'Toque para ver os itens'),
      // Avisa toda vez que abre ou fecha.
      onExpansionChanged: (aberto) => setState(() => _aberto = aberto),
      // Os filhos ficam alinhados à esquerda (o padrão é centralizado).
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      children: const [
        Text(r'2× Café — R$ 37,80'),
        Text(r'1× Pão de queijo — R$ 8,50'),
      ],
    );
  }
}
