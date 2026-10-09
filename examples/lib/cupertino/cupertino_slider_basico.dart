import 'package:flutter/cupertino.dart';

class CupertinoSliderBasico extends StatefulWidget {
  const CupertinoSliderBasico({super.key});

  @override
  State<CupertinoSliderBasico> createState() => _CupertinoSliderBasicoState();
}

class _CupertinoSliderBasicoState extends State<CupertinoSliderBasico> {
  double _brilho = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        // Funciona como o Slider do Material: value, min, max e onChanged.
        CupertinoSlider(
          value: _brilho,
          min: 0,
          max: 100,
          divisions: 10, // de 10 em 10
          onChanged: (valor) => setState(() => _brilho = valor),
        ),
        Text('Brilho: ${_brilho.round()}%'),
      ],
    );
  }
}
