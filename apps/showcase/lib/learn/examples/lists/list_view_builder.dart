import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      // .builder só cria os itens que aparecem na tela, conforme você
      // rola. Por isso aguenta listas enormes — aqui, 1000 contatos.
      child: ListView.builder(
        itemCount: 1000,
        itemBuilder: (context, indice) {
          final numero = indice + 1; // o índice começa em 0
          return ListTile(
            leading: CircleAvatar(child: Text('$numero')),
            title: Text('Contato $numero'),
          );
        },
      ),
    );
  }
}
