import 'package:flutter/material.dart';

class RangeSliderAoSoltar extends StatefulWidget {
  const RangeSliderAoSoltar({super.key});

  @override
  State<RangeSliderAoSoltar> createState() => _RangeSliderAoSoltarState();
}

class _RangeSliderAoSoltarState extends State<RangeSliderAoSoltar> {
  RangeValues _arrastando = const RangeValues(25, 45);
  RangeValues _buscado = const RangeValues(25, 45);

  String _texto(RangeValues faixa) =>
      '${faixa.start.round()} a ${faixa.end.round()} anos';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RangeSlider(
          values: _arrastando,
          min: 18,
          max: 80,
          // onChanged: a cada movimento. Atualiza o que aparece na tela.
          onChanged: (valores) => setState(() => _arrastando = valores),
          // onChangeEnd: só quando a pessoa solta o dedo. Bom lugar para
          // algo demorado, como buscar num servidor, sem repetir a cada
          // milímetro arrastado.
          onChangeEnd: (valores) => setState(() => _buscado = valores),
        ),
        Text('Arrastando: ${_texto(_arrastando)}'),
        Text('Busca feita para: ${_texto(_buscado)}'),
      ],
    );
  }
}
