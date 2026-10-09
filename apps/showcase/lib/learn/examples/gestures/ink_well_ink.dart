import 'package:flutter/material.dart';

class InkWellInk extends StatelessWidget {
  const InkWellInk({super.key});

  @override
  Widget build(BuildContext context) {
    const estilo = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    final cantos = BorderRadius.circular(12);

    return Row(
      spacing: 12,
      children: [
        // ERRADO: a onda é desenhada no Material lá embaixo, e a cor do
        // Container fica por cima dela: a onda não aparece.
        Expanded(
          child: Container(
            height: 64,
            decoration: BoxDecoration(color: Colors.teal, borderRadius: cantos),
            child: InkWell(
              onTap: () {},
              borderRadius: cantos,
              child: const Center(child: Text('Container', style: estilo)),
            ),
          ),
        ),
        // CERTO: Ink pinta a cor no próprio Material, embaixo da onda.
        Expanded(
          child: Ink(
            height: 64,
            decoration: BoxDecoration(color: Colors.teal, borderRadius: cantos),
            child: InkWell(
              onTap: () {},
              borderRadius: cantos,
              child: const Center(child: Text('Ink', style: estilo)),
            ),
          ),
        ),
      ],
    );
  }
}
