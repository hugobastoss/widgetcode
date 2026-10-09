import 'package:flutter/material.dart';

class ContainerSombraGradiente extends StatelessWidget {
  const ContainerSombraGradiente({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // O gradiente ocupa o lugar da cor de fundo.
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12, // quanto a sombra se espalha
            offset: Offset(0, 6), // 6 para baixo
          ),
        ],
      ),
      child: const Text(
        'Gradiente',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
