import 'package:flutter/material.dart';

class AnimatedContainerBasico extends StatefulWidget {
  const AnimatedContainerBasico({super.key});

  @override
  State<AnimatedContainerBasico> createState() =>
      _AnimatedContainerBasicoState();
}

class _AnimatedContainerBasicoState extends State<AnimatedContainerBasico> {
  bool _grande = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        // Igual a um Container, mas quando os valores mudam (via setState)
        // ele anima sozinho do valor antigo para o novo.
        AnimatedContainer(
          duration: const Duration(milliseconds: 400), // quanto tempo leva
          curve: Curves.easeInOut, // o "jeito" da animação
          width: _grande ? 200 : 100,
          height: _grande ? 120 : 100,
          decoration: BoxDecoration(
            color: _grande ? Colors.teal : Colors.indigo,
            borderRadius: BorderRadius.circular(_grande ? 32 : 8),
          ),
        ),
        FilledButton.tonal(
          onPressed: () => setState(() => _grande = !_grande),
          child: const Text('Animar'),
        ),
      ],
    );
  }
}
