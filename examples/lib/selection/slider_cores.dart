import 'package:flutter/material.dart';

class SliderCores extends StatefulWidget {
  const SliderCores({super.key});

  @override
  State<SliderCores> createState() => _SliderCoresState();
}

class _SliderCoresState extends State<SliderCores> {
  double _brilho = 0.7;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.brightness_low),
        Expanded(
          child: Slider(
            value: _brilho,
            onChanged: (valor) => setState(() => _brilho = valor),
            activeColor: Colors.amber.shade700, // parte preenchida
            inactiveColor: Colors.amber.shade100, // parte vazia
            thumbColor: Colors.deepOrange, // a bolinha
          ),
        ),
        const Icon(Icons.brightness_high),
      ],
    );
  }
}
