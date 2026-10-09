import 'package:flutter/material.dart';

class BadgeContador extends StatefulWidget {
  const BadgeContador({super.key});

  @override
  State<BadgeContador> createState() => _BadgeContadorState();
}

class _BadgeContadorState extends State<BadgeContador> {
  int _itens = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        Badge.count(
          count: _itens,
          // Esconde o selo quando o carrinho está vazio.
          isLabelVisible: _itens > 0,
          child: const Icon(Icons.shopping_cart_outlined, size: 32),
        ),
        IconButton.filledTonal(
          tooltip: 'Adicionar ao carrinho',
          onPressed: () => setState(() => _itens++),
          icon: const Icon(Icons.add),
        ),
        IconButton(
          tooltip: 'Esvaziar',
          onPressed: _itens == 0 ? null : () => setState(() => _itens = 0),
          icon: const Icon(Icons.delete_outline),
        ),
      ],
    );
  }
}
