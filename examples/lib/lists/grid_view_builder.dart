import 'package:flutter/material.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return SizedBox(
      height: 280,
      // .builder cria os itens sob demanda, como no ListView.builder.
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // Largura ÷ altura de cada item: 3/4 = mais alto que largo.
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 20,
        itemBuilder: (context, indice) {
          return Card.outlined(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ColoredBox(
                    color: cores.primaryContainer,
                    child: Icon(Icons.shopping_bag_outlined, color: cores.primary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Produto ${indice + 1}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
