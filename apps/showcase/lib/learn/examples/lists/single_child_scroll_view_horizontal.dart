import 'package:flutter/material.dart';

class SingleChildScrollViewHorizontal extends StatelessWidget {
  const SingleChildScrollViewHorizontal({super.key});

  static const _categorias = [
    'Todos', 'Bebidas', 'Lanches', 'Pizzas', 'Saladas', 'Sobremesas', //
    'Promoções',
  ];

  @override
  Widget build(BuildContext context) {
    // Uma Row de filtros que passa da largura da tela: na horizontal, ela
    // rola em vez de estourar. Para poucos itens, é mais simples que um
    // ListView horizontal.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [
          for (final categoria in _categorias) Chip(label: Text(categoria)),
        ],
      ),
    );
  }
}
