import 'package:flutter/material.dart';

class AnimatedContainerCurvas extends StatefulWidget {
  const AnimatedContainerCurvas({super.key});

  @override
  State<AnimatedContainerCurvas> createState() =>
      _AnimatedContainerCurvasState();
}

class _AnimatedContainerCurvasState extends State<AnimatedContainerCurvas> {
  bool _naDireita = false;
  String _curva = 'easeInOut';

  // A curva muda a "personalidade" da animação: constante, suave, quicando...
  static const _curvas = {
    'linear': Curves.linear,
    'easeInOut': Curves.easeInOut,
    'bounceOut': Curves.bounceOut,
    'elasticOut': Curves.elasticOut,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: _curvas[_curva]!,
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(28),
          ),
          // alignment também anima: a bolinha vai de um lado ao outro.
          alignment: _naDireita ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final nome in _curvas.keys)
              ChoiceChip(
                label: Text(nome),
                selected: _curva == nome,
                onSelected: (_) => setState(() => _curva = nome),
              ),
          ],
        ),
        FilledButton.tonal(
          onPressed: () => setState(() => _naDireita = !_naDireita),
          child: const Text('Mover'),
        ),
      ],
    );
  }
}
