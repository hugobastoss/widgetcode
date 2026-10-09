import 'package:flutter/material.dart';

class GestureDetectorArrastar extends StatefulWidget {
  const GestureDetectorArrastar({super.key});

  @override
  State<GestureDetectorArrastar> createState() =>
      _GestureDetectorArrastarState();
}

class _GestureDetectorArrastarState extends State<GestureDetectorArrastar> {
  double _x = 0; // quanto a bolinha andou para a direita

  static const _larguraDaTrilha = 220.0;
  static const _tamanho = 48.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(
          width: _larguraDaTrilha,
          height: _tamanho,
          child: Stack(
            children: [
              // A trilha cinza.
              Positioned.fill(
                child: Center(child: Container(height: 4, color: Colors.grey)),
              ),
              Positioned(
                left: _x,
                child: GestureDetector(
                  // Só o arrasto horizontal: dentro de uma página que rola na
                  // vertical, assim os dois gestos não brigam.
                  onHorizontalDragUpdate: (detalhes) {
                    setState(() {
                      // delta.dx: quanto o dedo andou desde a última vez.
                      // clamp mantém a bolinha dentro da trilha.
                      _x = (_x + detalhes.delta.dx)
                          .clamp(0, _larguraDaTrilha - _tamanho);
                    });
                  },
                  child: Container(
                    width: _tamanho,
                    height: _tamanho,
                    decoration: const BoxDecoration(
                      color: Colors.teal,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.drag_indicator, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text('Arraste a bolinha: x = ${_x.round()}'),
      ],
    );
  }
}
