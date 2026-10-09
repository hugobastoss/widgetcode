import 'package:flutter/material.dart';

class GestureDetectorArea extends StatefulWidget {
  const GestureDetectorArea({super.key});

  @override
  State<GestureDetectorArea> createState() => _GestureDetectorAreaState();
}

class _GestureDetectorAreaState extends State<GestureDetectorArea> {
  int _toquesPadrao = 0;
  int _toquesOpaco = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Expanded(
          child: _Area(
            titulo: 'Padrão',
            toques: _toquesPadrao,
            // deferToChild (o padrão): só conta toques em cima do que foi
            // desenhado — aqui, o texto. O espaço vazio não responde.
            comportamento: HitTestBehavior.deferToChild,
            onTap: () => setState(() => _toquesPadrao++),
          ),
        ),
        Expanded(
          child: _Area(
            titulo: 'opaque',
            toques: _toquesOpaco,
            // opaque: a área inteira responde, inclusive o espaço vazio.
            comportamento: HitTestBehavior.opaque,
            onTap: () => setState(() => _toquesOpaco++),
          ),
        ),
      ],
    );
  }
}

class _Area extends StatelessWidget {
  const _Area({
    required this.titulo,
    required this.toques,
    required this.comportamento,
    required this.onTap,
  });

  final String titulo;
  final int toques;
  final HitTestBehavior comportamento;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // A borda fica FORA do GestureDetector, só para mostrar a área.
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        behavior: comportamento,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text('$titulo\n$toques toques', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
