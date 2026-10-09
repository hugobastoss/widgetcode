import 'package:flutter/material.dart';

class ImageFit extends StatefulWidget {
  const ImageFit({super.key});

  @override
  State<ImageFit> createState() => _ImageFitState();
}

class _ImageFitState extends State<ImageFit> {
  BoxFit _ajuste = BoxFit.cover;

  static const _opcoes = [
    BoxFit.cover,
    BoxFit.contain,
    BoxFit.fill,
    BoxFit.fitWidth,
    BoxFit.fitHeight,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Caixa quadrada com uma imagem retangular: o fit decide como a
        // imagem se ajusta a ela.
        Container(
          width: 140,
          height: 140,
          color: Colors.grey.shade400,
          child: Image.asset('assets/images/paisagem.png', fit: _ajuste),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final opcao in _opcoes)
              ChoiceChip(
                label: Text(opcao.name),
                selected: _ajuste == opcao,
                onSelected: (_) => setState(() => _ajuste = opcao),
              ),
          ],
        ),
      ],
    );
  }
}
