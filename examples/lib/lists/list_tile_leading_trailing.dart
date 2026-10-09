import 'package:flutter/material.dart';

class ListTileLeadingTrailing extends StatelessWidget {
  const ListTileLeadingTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      // leading: o que vem antes do texto (avatar, ícone).
      leading: CircleAvatar(child: Text('MS')),
      title: Text('Maria Souza'),
      subtitle: Text('Oi! Tudo certo para amanhã?'),
      // trailing: o que vem depois (horário, ícone, botão).
      trailing: Text('10:42'),
    );
  }
}
