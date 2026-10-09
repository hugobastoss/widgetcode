import 'package:flutter/material.dart';

class ImageCantos extends StatelessWidget {
  const ImageCantos({super.key});

  @override
  Widget build(BuildContext context) {
    // Image não tem cantos arredondados. ClipRRect "recorta" o filho com
    // o raio escolhido.
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/paisagem.png',
        width: 240,
        height: 144,
        fit: BoxFit.cover,
      ),
    );
  }
}
