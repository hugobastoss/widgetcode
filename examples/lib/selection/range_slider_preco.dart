import 'package:flutter/material.dart';

class RangeSliderPreco extends StatefulWidget {
  const RangeSliderPreco({super.key});

  @override
  State<RangeSliderPreco> createState() => _RangeSliderPrecoState();
}

class _RangeSliderPrecoState extends State<RangeSliderPreco> {
  // RangeValues guarda as duas pontas: o começo e o fim da faixa.
  RangeValues _faixa = const RangeValues(40, 120);

  @override
  Widget build(BuildContext context) {
    // \$ escreve o símbolo $ em vez de começar uma variável.
    final de = 'R\$ ${_faixa.start.round()}';
    final ate = 'R\$ ${_faixa.end.round()}';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RangeSlider(
          values: _faixa,
          min: 0,
          max: 200,
          divisions: 20, // de 10 em 10
          // Um balão para cada bolinha enquanto você arrasta.
          labels: RangeLabels(de, ate),
          onChanged: (valores) => setState(() => _faixa = valores),
        ),
        Text('De $de até $ate'),
      ],
    );
  }
}
