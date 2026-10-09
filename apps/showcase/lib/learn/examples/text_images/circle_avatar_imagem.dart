import 'package:flutter/material.dart';

class CircleAvatarImagem extends StatelessWidget {
  const CircleAvatarImagem({super.key});

  @override
  Widget build(BuildContext context) {
    // backgroundImage recebe um ImageProvider: AssetImage para imagens do
    // app ou NetworkImage para a internet. O recorte redondo é automático.
    return const CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage('assets/images/paisagem.png'),
    );
  }
}
