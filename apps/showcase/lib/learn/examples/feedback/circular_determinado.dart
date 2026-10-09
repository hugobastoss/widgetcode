import 'package:flutter/material.dart';

class CircularDeterminado extends StatefulWidget {
  const CircularDeterminado({super.key});

  @override
  State<CircularDeterminado> createState() => _CircularDeterminadoState();
}

class _CircularDeterminadoState extends State<CircularDeterminado> {
  double _progresso = 0.3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        // Stack para escrever a porcentagem dentro do círculo.
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              // Com value (de 0.0 a 1.0), mostra quanto já foi feito.
              child: CircularProgressIndicator(value: _progresso),
            ),
            Text('${(_progresso * 100).round()}%'),
          ],
        ),
        FilledButton.tonal(
          onPressed: () => setState(() {
            _progresso = _progresso >= 1 ? 0 : _progresso + 0.1;
          }),
          child: Text(_progresso >= 1 ? 'Zerar' : '+10%'),
        ),
      ],
    );
  }
}
