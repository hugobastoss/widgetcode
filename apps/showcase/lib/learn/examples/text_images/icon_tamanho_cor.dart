import 'package:flutter/material.dart';

class IconTamanhoCor extends StatelessWidget {
  const IconTamanhoCor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 16,
      children: [
        // size é o tamanho em pixels lógicos; o padrão é 24.
        Icon(Icons.star, size: 16, color: Colors.amber),
        Icon(Icons.star, size: 24, color: Colors.amber),
        Icon(Icons.star, size: 36, color: Colors.orange),
        Icon(Icons.star, size: 48, color: Colors.deepOrange),
      ],
    );
  }
}
