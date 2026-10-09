import 'package:flutter/material.dart';

class AnimatedSwitcherContador extends StatefulWidget {
  const AnimatedSwitcherContador({super.key});

  @override
  State<AnimatedSwitcherContador> createState() =>
      _AnimatedSwitcherContadorState();
}

class _AnimatedSwitcherContadorState extends State<AnimatedSwitcherContador> {
  int _numero = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        IconButton.filledTonal(
          tooltip: 'Diminuir',
          onPressed: () => setState(() => _numero--),
          icon: const Icon(Icons.remove),
        ),
        // AnimatedSwitcher anima a troca de um filho por outro. Por padrão,
        // o antigo some e o novo aparece com fade.
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            '$_numero',
            // A key é o que diz que o filho MUDOU. Sem ela, um Text novo
            // parece "o mesmo Text" e não há animação.
            key: ValueKey(_numero),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        IconButton.filledTonal(
          tooltip: 'Aumentar',
          onPressed: () => setState(() => _numero++),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
