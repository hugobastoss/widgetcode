import 'package:flutter/material.dart';

class CircleAvatarTamanhos extends StatelessWidget {
  const CircleAvatarTamanhos({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        // radius é o raio: o círculo tem o dobro disso de largura.
        const CircleAvatar(radius: 16, child: Text('P')),
        const CircleAvatar(radius: 24, child: Text('M')),
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.teal.shade700, // cor do círculo
          foregroundColor: Colors.white, // cor do texto ou ícone
          child: const Text('G'),
        ),
      ],
    );
  }
}
