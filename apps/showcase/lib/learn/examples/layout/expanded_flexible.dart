import 'package:flutter/material.dart';

class ExpandedFlexible extends StatelessWidget {
  const ExpandedFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Row(
          children: [
            // Expanded OBRIGA o filho a ocupar todo o espaço que sobra.
            Expanded(child: _Etiqueta(Colors.indigo, 'Expanded')),
          ],
        ),
        Row(
          children: [
            // Flexible PERMITE ocupar o espaço, mas deixa o filho ficar
            // menor se ele não precisar de tudo.
            Flexible(child: _Etiqueta(Colors.teal, 'Flexible')),
          ],
        ),
      ],
    );
  }
}

class _Etiqueta extends StatelessWidget {
  const _Etiqueta(this.cor, this.texto);

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: cor,
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
