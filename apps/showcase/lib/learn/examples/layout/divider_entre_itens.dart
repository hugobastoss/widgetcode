import 'package:flutter/material.dart';

class DividerEntreItens extends StatelessWidget {
  const DividerEntreItens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(leading: Icon(Icons.person_outline), title: Text('Perfil')),
        // Divider desenha uma linha fina ocupando a largura disponível.
        Divider(),
        ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text('Notificações'),
        ),
        Divider(),
        ListTile(leading: Icon(Icons.lock_outline), title: Text('Privacidade')),
      ],
    );
  }
}
