import 'package:flutter/material.dart';

class FabPadrao extends StatelessWidget {
  const FabPadrao({super.key});

  @override
  Widget build(BuildContext context) {
    // Num app de verdade, o FAB costuma ir no Scaffold, que cuida da
    // posição no canto da tela:
    //
    //   Scaffold(
    //     floatingActionButton: FloatingActionButton(...),
    //   )
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Novo item',
      child: const Icon(Icons.add),
    );
  }
}
