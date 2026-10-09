import 'package:flutter/material.dart';

class SliderContinuo extends StatefulWidget {
  const SliderContinuo({super.key});

  @override
  State<SliderContinuo> createState() => _SliderContinuoState();
}

class _SliderContinuoState extends State<SliderContinuo> {
  // Sem min e max, o Slider vai de 0.0 a 1.0.
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const Icon(Icons.volume_down),
            // Dentro de uma Row, o Slider precisa de Expanded para saber
            // quanta largura tem.
            Expanded(
              child: Slider(
                value: _volume,
                // Chamado a cada movimento do dedo.
                onChanged: (valor) => setState(() => _volume = valor),
              ),
            ),
            const Icon(Icons.volume_up),
          ],
        ),
        Text('Volume: ${(_volume * 100).round()}%'),
      ],
    );
  }
}
