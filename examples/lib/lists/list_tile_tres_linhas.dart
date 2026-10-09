import 'package:flutter/material.dart';

class ListTileTresLinhas extends StatelessWidget {
  const ListTileTresLinhas({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.article_outlined),
      title: Text('Novidades do Flutter'),
      subtitle: Text(
        'Conheça os widgets novos desta versão e veja como atualizar o '
        'seu projeto sem dor de cabeça.',
      ),
      // isThreeLine dá espaço para um subtítulo de duas linhas e alinha o
      // leading no topo.
      isThreeLine: true,
    );
  }
}
