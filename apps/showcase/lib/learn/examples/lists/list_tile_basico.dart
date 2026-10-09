import 'package:flutter/material.dart';

class ListTileBasico extends StatelessWidget {
  const ListTileBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // ListTile é a "linha de lista" pronta do Material: já vem com altura,
    // espaçamentos e tipografia certos.
    return const ListTile(
      title: Text('Wi-Fi'),
      subtitle: Text('Conectado à rede Casa'),
    );
  }
}
