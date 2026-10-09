import 'package:flutter/material.dart';

class IconButtonVariantes extends StatelessWidget {
  const IconButtonVariantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          tooltip: 'Padrão',
          icon: const Icon(Icons.settings_outlined),
        ),
        const SizedBox(width: 8),
        IconButton.filled(
          onPressed: () {},
          tooltip: 'Preenchido',
          icon: const Icon(Icons.settings_outlined),
        ),
        const SizedBox(width: 8),
        IconButton.filledTonal(
          onPressed: () {},
          tooltip: 'Tonal',
          icon: const Icon(Icons.settings_outlined),
        ),
        const SizedBox(width: 8),
        IconButton.outlined(
          onPressed: () {},
          tooltip: 'Contornado',
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}
