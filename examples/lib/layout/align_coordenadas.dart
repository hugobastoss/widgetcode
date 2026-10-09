import 'package:flutter/material.dart';

class AlignCoordenadas extends StatefulWidget {
  const AlignCoordenadas({super.key});

  @override
  State<AlignCoordenadas> createState() => _AlignCoordenadasState();
}

class _AlignCoordenadasState extends State<AlignCoordenadas> {
  double _x = 0.5;
  double _y = -0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 220,
          height: 120,
          color: Colors.grey.shade400,
          child: Align(
            // Alignment(x, y): em cada eixo, -1 é o começo, 0 é o meio e
            // 1 é o fim. Alignment.center é o mesmo que Alignment(0, 0).
            alignment: Alignment(_x, _y),
            child: Container(width: 32, height: 32, color: Colors.indigo),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Alignment(${_x.toStringAsFixed(1)}, ${_y.toStringAsFixed(1)})',
          style: const TextStyle(fontFamily: 'monospace'),
        ),
        Row(
          children: [
            const Text('x'),
            Expanded(
              child: Slider(
                value: _x,
                min: -1,
                max: 1,
                divisions: 20,
                onChanged: (valor) => setState(() => _x = valor),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('y'),
            Expanded(
              child: Slider(
                value: _y,
                min: -1,
                max: 1,
                divisions: 20,
                onChanged: (valor) => setState(() => _y = valor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
