import 'package:flutter/material.dart';

class AnimatedOpacityEspaco extends StatefulWidget {
  const AnimatedOpacityEspaco({super.key});

  @override
  State<AnimatedOpacityEspaco> createState() => _AnimatedOpacityEspacoState();
}

class _AnimatedOpacityEspacoState extends State<AnimatedOpacityEspaco> {
  bool _visivel = true;
  bool _removido = false;

  void _alternar() {
    setState(() {
      if (_visivel) {
        _visivel = false; // começa o fade; o onEnd remove depois
      } else {
        _visivel = true;
        _removido = false;
      }
    });
  }

  Widget _caixa(Color cor) => Container(width: 48, height: 48, color: cor);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            _caixa(Colors.indigo),
            // Invisível (opacity 0), o widget continua ocupando espaço. Para
            // tirá-lo de vez, esperamos a animação acabar e o removemos.
            if (!_removido)
              AnimatedOpacity(
                opacity: _visivel ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                // onEnd: chamado quando a animação termina.
                onEnd: () {
                  if (!_visivel) setState(() => _removido = true);
                },
                child: _caixa(Colors.teal),
              ),
            _caixa(Colors.deepOrange),
          ],
        ),
        FilledButton.tonal(
          onPressed: _alternar,
          child: Text(_visivel ? 'Sumir' : 'Voltar'),
        ),
      ],
    );
  }
}
