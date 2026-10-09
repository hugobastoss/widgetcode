import 'package:flutter/material.dart';

class BottomAppBarFab extends StatelessWidget {
  const BottomAppBarFab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        body: const Center(child: Text('Suas notas')),
        // endContained: o FAB fica dentro da barra, no canto direito.
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Nova nota',
          elevation: 0, // sem sombra, já que está "dentro" da barra
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        // BottomAppBar: uma barra de ações embaixo (diferente da
        // NavigationBar, que troca de tela).
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                tooltip: 'Lista',
                icon: const Icon(Icons.check_box_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Desenho',
                icon: const Icon(Icons.brush_outlined),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Áudio',
                icon: const Icon(Icons.mic_none),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
