import 'package:flutter/material.dart';

class SliderDivisoes extends StatefulWidget {
  const SliderDivisoes({super.key});

  @override
  State<SliderDivisoes> createState() => _SliderDivisoesState();
}

class _SliderDivisoesState extends State<SliderDivisoes> {
  double _nota = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slider(
          value: _nota,
          min: 1,
          max: 5,
          // divisions faz o Slider "pular" entre valores fixos: de 1 a 5
          // em 4 passos = 1, 2, 3, 4, 5.
          divisions: 4,
          // O balão que aparece em cima da bolinha enquanto você arrasta.
          // Só funciona com divisions.
          label: '${_nota.round()}',
          onChanged: (valor) => setState(() => _nota = valor),
        ),
        Text('Nota: ${_nota.round()} de 5'),
      ],
    );
  }
}
