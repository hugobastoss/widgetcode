import 'package:flutter/material.dart';

class FabPequeno extends StatelessWidget {
  const FabPequeno({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: () {},
      tooltip: 'Editar',
      child: const Icon(Icons.edit_outlined),
    );
  }
}
