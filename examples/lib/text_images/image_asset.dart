import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    // Image.asset mostra uma imagem que vai junto com o app. O arquivo
    // precisa estar declarado no pubspec.yaml:
    //
    //   flutter:
    //     assets:
    //       - assets/images/
    return Image.asset(
      'assets/images/paisagem.png',
      width: 240,
    );
  }
}
