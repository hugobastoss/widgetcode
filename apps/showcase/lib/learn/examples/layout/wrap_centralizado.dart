import 'package:flutter/material.dart';

class WrapCentralizado extends StatelessWidget {
  const WrapCentralizado({super.key});

  static const _filtros = {
    'Praia': Icons.beach_access,
    'Montanha': Icons.terrain,
    'Cidade': Icons.location_city,
    'Campo': Icons.grass,
    'Neve': Icons.ac_unit,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      // alignment centraliza os itens dentro de cada linha.
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final filtro in _filtros.entries)
          Chip(
            avatar: Icon(filtro.value, size: 18),
            label: Text(filtro.key),
          ),
      ],
    );
  }
}
