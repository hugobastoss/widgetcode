import 'package:flutter/material.dart';

class AnimatedSwitcherTransicao extends StatefulWidget {
  const AnimatedSwitcherTransicao({super.key});

  @override
  State<AnimatedSwitcherTransicao> createState() =>
      _AnimatedSwitcherTransicaoState();
}

class _AnimatedSwitcherTransicaoState extends State<AnimatedSwitcherTransicao> {
  bool _tocando = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: _tocando ? 'Pausar' : 'Tocar',
      iconSize: 72,
      color: Colors.teal,
      onPressed: () => setState(() => _tocando = !_tocando),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        // transitionBuilder troca o fade padrão por outra animação. Aqui,
        // o ícone cresce do zero (ScaleTransition).
        transitionBuilder: (filho, animacao) =>
            ScaleTransition(scale: animacao, child: filho),
        child: Icon(
          _tocando ? Icons.pause_circle : Icons.play_circle,
          key: ValueKey(_tocando),
        ),
      ),
    );
  }
}
