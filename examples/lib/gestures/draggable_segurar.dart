import 'package:flutter/material.dart';

class DraggableSegurar extends StatefulWidget {
  const DraggableSegurar({super.key});

  @override
  State<DraggableSegurar> createState() => _DraggableSegurarState();
}

class _DraggableSegurarState extends State<DraggableSegurar> {
  final _naCesta = <String>[];

  static const _frutas = ['Maçã', 'Banana', 'Uva'];

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: [
            for (final fruta in _frutas)
              if (!_naCesta.contains(fruta))
                // LongPressDraggable só começa depois de segurar o dedo.
                // Dentro de listas que rolam, é o mais seguro: um arrasto
                // rápido continua rolando a página.
                LongPressDraggable<String>(
                  data: fruta,
                  feedback: Material(
                    elevation: 6,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(fruta),
                    ),
                  ),
                  child: Chip(label: Text(fruta)),
                ),
          ],
        ),
        DragTarget<String>(
          onAcceptWithDetails: (detalhes) {
            setState(() => _naCesta.add(detalhes.data));
          },
          builder: (context, candidatos, rejeitados) => Container(
            height: 80,
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: candidatos.isNotEmpty ? cores.primary : cores.outline,
                width: 2,
              ),
            ),
            child: Text(
              _naCesta.isEmpty
                  ? 'Cesta vazia. Segure uma fruta e arraste para cá.'
                  : 'Na cesta: ${_naCesta.join(', ')}',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (_naCesta.isNotEmpty)
          TextButton(
            onPressed: () => setState(() => _naCesta.clear()),
            child: const Text('Esvaziar a cesta'),
          ),
      ],
    );
  }
}
