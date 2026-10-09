import 'package:flutter/material.dart';

class ContainerBasico extends StatelessWidget {
  const ContainerBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Container junta tamanho, cor, alinhamento e espaçamento num só widget.
    return Container(
      width: 160,
      height: 90,
      color: Colors.indigo,
      // alignment posiciona o child dentro do Container.
      alignment: Alignment.center,
      child: const Text(
        'Container',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
