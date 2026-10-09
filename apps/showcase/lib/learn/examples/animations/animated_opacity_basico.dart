import 'package:flutter/material.dart';

class AnimatedOpacityBasico extends StatefulWidget {
  const AnimatedOpacityBasico({super.key});

  @override
  State<AnimatedOpacityBasico> createState() => _AnimatedOpacityBasicoState();
}

class _AnimatedOpacityBasicoState extends State<AnimatedOpacityBasico> {
  bool _visivel = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        // opacity vai de 0.0 (invisível) a 1.0 (totalmente visível).
        AnimatedOpacity(
          opacity: _visivel ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: const Icon(Icons.cloud, size: 80, color: Colors.indigo),
        ),
        FilledButton.tonal(
          onPressed: () => setState(() => _visivel = !_visivel),
          child: Text(_visivel ? 'Esconder' : 'Mostrar'),
        ),
      ],
    );
  }
}
