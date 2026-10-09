import 'package:flutter/material.dart';

class FilterChipIcones extends StatefulWidget {
  const FilterChipIcones({super.key});

  @override
  State<FilterChipIcones> createState() => _FilterChipIconesState();
}

class _FilterChipIconesState extends State<FilterChipIcones> {
  final _marcados = <String>{};

  static const _filtros = {
    'Vegano': Icons.eco_outlined,
    'Sem glúten': Icons.no_food_outlined,
    'Picante': Icons.local_fire_department_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final filtro in _filtros.entries)
          FilterChip(
            // avatar: o ícone antes do texto.
            avatar: Icon(filtro.value),
            label: Text(filtro.key),
            // Sem o ✓, quem mostra que está marcado é só a cor de fundo.
            showCheckmark: false,
            selected: _marcados.contains(filtro.key),
            onSelected: (marcado) {
              setState(() {
                if (marcado) {
                  _marcados.add(filtro.key);
                } else {
                  _marcados.remove(filtro.key);
                }
              });
            },
          ),
      ],
    );
  }
}
