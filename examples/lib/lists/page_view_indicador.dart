import 'package:flutter/material.dart';

class PageViewIndicador extends StatefulWidget {
  const PageViewIndicador({super.key});

  @override
  State<PageViewIndicador> createState() => _PageViewIndicadorState();
}

class _PageViewIndicadorState extends State<PageViewIndicador> {
  int _pagina = 0;

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          child: PageView(
            // Avisa qual página ficou visível depois de deslizar.
            onPageChanged: (indice) => setState(() => _pagina = indice),
            children: [
              for (final (i, cor) in _cores.indexed)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Página ${i + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Os pontos: o da página atual fica mais largo e colorido.
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            for (var i = 0; i < _cores.length; i++)
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: i == _pagina ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: i == _pagina ? cores.primary : cores.outlineVariant,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
