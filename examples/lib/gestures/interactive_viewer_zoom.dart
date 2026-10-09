import 'package:flutter/material.dart';

class InteractiveViewerZoom extends StatelessWidget {
  const InteractiveViewerZoom({super.key});

  @override
  Widget build(BuildContext context) {
    // Use dois dedos para dar zoom; depois de ampliar, arraste para mover.
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 240,
        height: 150,
        child: InteractiveViewer(
          minScale: 1, // não deixa diminuir além do tamanho original
          maxScale: 5, // até 5 vezes maior
          child: Image.asset('assets/images/paisagem.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
