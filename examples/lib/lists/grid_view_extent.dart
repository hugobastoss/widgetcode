import 'package:flutter/material.dart';

class GridViewExtent extends StatelessWidget {
  const GridViewExtent({super.key});

  static const _icones = [
    Icons.home_outlined, Icons.star_border, Icons.favorite_border, //
    Icons.settings_outlined, Icons.person_outline, Icons.search,
  ];

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return SizedBox(
      height: 220,
      child: GridView.builder(
        // Em vez de um número fixo de colunas, uma largura máxima por item:
        // o Flutter calcula quantas colunas cabem. Num tablet, aparecem
        // mais colunas sem mudar nada no código.
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 72,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 30,
        itemBuilder: (context, indice) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: cores.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _icones[indice % _icones.length],
              color: cores.onSecondaryContainer,
            ),
          );
        },
      ),
    );
  }
}
