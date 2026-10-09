import 'package:flutter/material.dart';

class AppBarAcoes extends StatelessWidget {
  const AppBarAcoes({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Scaffold(
        appBar: AppBar(
          // leading: o que vem antes do título (no lugar da seta de voltar).
          leading: IconButton(
            tooltip: 'Menu',
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: const Text('Fotos'),
          // actions: os botões do lado direito.
          actions: [
            IconButton(
              tooltip: 'Buscar',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Mais opções',
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: const Center(child: Text('Conteúdo da tela')),
      ),
    );
  }
}
