import 'package:flutter/material.dart';

class IconButtonAlternavel extends StatefulWidget {
  const IconButtonAlternavel({super.key});

  @override
  State<IconButtonAlternavel> createState() => _IconButtonAlternavelState();
}

class _IconButtonAlternavelState extends State<IconButtonAlternavel> {
  bool _favorito = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // isSelected escolhe qual ícone aparece: icon ou selectedIcon.
      isSelected: _favorito,
      icon: const Icon(Icons.favorite_border),
      selectedIcon: const Icon(Icons.favorite),
      tooltip: _favorito ? 'Remover dos favoritos' : 'Favoritar',
      onPressed: () => setState(() => _favorito = !_favorito),
    );
  }
}
