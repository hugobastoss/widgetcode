import 'package:flutter/material.dart';

class CircleAvatarIniciais extends StatelessWidget {
  const CircleAvatarIniciais({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem foto, as iniciais são o jeito mais comum de representar alguém.
    return const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        CircleAvatar(child: Text('AS')),
        CircleAvatar(child: Text('BR')),
        // Um ícone também funciona como child.
        CircleAvatar(child: Icon(Icons.person)),
      ],
    );
  }
}
