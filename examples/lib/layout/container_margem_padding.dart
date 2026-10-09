import 'package:flutter/material.dart';

class ContainerMargemPadding extends StatelessWidget {
  const ContainerMargemPadding({super.key});

  @override
  Widget build(BuildContext context) {
    // O Container cinza de fora só existe para deixar a margem visível.
    return Container(
      color: Colors.grey.shade400,
      child: Container(
        // margin: espaço por FORA do Container.
        margin: const EdgeInsets.all(20),
        // padding: espaço por DENTRO, entre a borda e o child.
        padding: const EdgeInsets.all(20),
        color: Colors.teal,
        child: Container(
          color: Colors.teal.shade100,
          padding: const EdgeInsets.all(8),
          child: const Text('child', style: TextStyle(color: Colors.black87)),
        ),
      ),
    );
  }
}
