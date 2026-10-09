import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      // .separated é o .builder com um separador entre cada item (e não
      // depois do último).
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, indice) => const Divider(height: 1),
        itemBuilder: (context, indice) {
          return ListTile(
            title: Text('Pedido #${1000 + indice}'),
            trailing: const Icon(Icons.chevron_right),
          );
        },
      ),
    );
  }
}
