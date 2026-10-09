import 'package:flutter/material.dart';

class CustomScrollViewSlivers extends StatelessWidget {
  const CustomScrollViewSlivers({super.key});

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    final titulo = Theme.of(context).textTheme.titleMedium;

    return SizedBox(
      height: 300,
      // CustomScrollView junta partes diferentes numa rolagem só. Cada
      // parte é um "sliver": uma grade, uma lista, um cabeçalho...
      child: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter coloca um widget comum dentro da rolagem.
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Destaques', style: titulo),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              for (var i = 0; i < 6; i++)
                Container(color: _cores[i % _cores.length]),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
              child: Text('Todos os itens', style: titulo),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, indice) {
              return ListTile(title: Text('Item ${indice + 1}'));
            },
          ),
        ],
      ),
    );
  }
}
