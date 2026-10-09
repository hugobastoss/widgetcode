import 'package:flutter/material.dart';

class TextTema extends StatelessWidget {
  const TextTema({super.key});

  @override
  Widget build(BuildContext context) {
    // Em vez de inventar tamanhos, use os estilos prontos do tema: o app
    // fica consistente e respeita o tamanho de fonte escolhido pela pessoa.
    final estilos = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('headlineSmall', style: estilos.headlineSmall),
        Text('titleMedium', style: estilos.titleMedium),
        Text('bodyMedium', style: estilos.bodyMedium),
        Text('labelSmall', style: estilos.labelSmall),
      ],
    );
  }
}
