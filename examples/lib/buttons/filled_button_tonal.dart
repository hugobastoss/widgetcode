import 'package:flutter/material.dart';

class FilledButtonTonal extends StatelessWidget {
  const FilledButtonTonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        FilledButton(
          onPressed: () {},
          child: const Text('Principal'),
        ),
        // .tonal usa uma cor mais suave: bom para uma ação importante que
        // não é a principal da tela.
        FilledButton.tonal(
          onPressed: () {},
          child: const Text('Secundária'),
        ),
      ],
    );
  }
}
