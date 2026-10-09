import 'package:flutter/material.dart';

class BottomAppBarEntalhe extends StatelessWidget {
  const BottomAppBarEntalhe({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        body: const Center(child: Text('Início')),
        // centerDocked: o FAB fica no meio, "encaixado" na barra.
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          tooltip: 'Publicar',
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          // O recorte redondo na barra, em volta do FAB.
          shape: const CircularNotchedRectangle(),
          notchMargin: 6, // folga entre o FAB e o recorte
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                tooltip: 'Início',
                icon: const Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Buscar',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              // Espaço vazio no meio, embaixo do FAB.
              const SizedBox(width: 56),
              IconButton(
                tooltip: 'Favoritos',
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Perfil',
                icon: const Icon(Icons.person_outline),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
