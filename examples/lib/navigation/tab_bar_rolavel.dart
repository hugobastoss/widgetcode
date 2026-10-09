import 'package:flutter/material.dart';

class TabBarRolavel extends StatelessWidget {
  const TabBarRolavel({super.key});

  static const _categorias = {
    'Pizzas': Icons.local_pizza_outlined,
    'Lanches': Icons.lunch_dining_outlined,
    'Sorvetes': Icons.icecream_outlined,
    'Bebidas': Icons.local_drink_outlined,
    'Doces': Icons.cake_outlined,
    'Saladas': Icons.eco_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _categorias.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            // Com muitas abas, isScrollable deixa cada uma do tamanho do
            // texto e a barra rola para o lado.
            isScrollable: true,
            tabAlignment: TabAlignment.start, // começa da esquerda
            tabs: [
              for (final categoria in _categorias.entries)
                Tab(icon: Icon(categoria.value), text: categoria.key),
            ],
          ),
          SizedBox(
            height: 120,
            child: TabBarView(
              children: [
                for (final categoria in _categorias.keys)
                  Center(child: Text('Cardápio de $categoria')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
