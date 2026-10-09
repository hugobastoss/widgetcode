import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork({super.key});

  @override
  Widget build(BuildContext context) {
    // Image.network baixa a imagem da internet. No Android, o app precisa
    // da permissão INTERNET no AndroidManifest.xml.
    return Image.network(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
      width: 240,
      height: 160,
      fit: BoxFit.cover,
      // Mostrado enquanto a imagem baixa.
      loadingBuilder: (context, child, progresso) {
        if (progresso == null) return child; // terminou de baixar
        return const SizedBox(
          width: 240,
          height: 160,
          child: Center(child: CircularProgressIndicator()),
        );
      },
      // Mostrado se der erro (sem internet, por exemplo).
      errorBuilder: (context, erro, pilha) {
        return const SizedBox(
          width: 240,
          height: 160,
          child: Center(child: Text('Não foi possível carregar a imagem.')),
        );
      },
    );
  }
}
