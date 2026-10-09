import 'package:flutter/material.dart';

class AppBarCores extends StatelessWidget {
  const AppBarCores({super.key});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return SizedBox(
      height: 240,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Pedidos'),
          centerTitle: true, // título no meio, como no iPhone
          backgroundColor: cores.primary,
          // foregroundColor: a cor do título e dos ícones.
          foregroundColor: cores.onPrimary,
        ),
        body: const Center(child: Text('Conteúdo da tela')),
      ),
    );
  }
}
