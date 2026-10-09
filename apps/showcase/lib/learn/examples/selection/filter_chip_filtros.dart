import 'package:flutter/material.dart';

class FilterChipFiltros extends StatefulWidget {
  const FilterChipFiltros({super.key});

  @override
  State<FilterChipFiltros> createState() => _FilterChipFiltrosState();
}

class _FilterChipFiltrosState extends State<FilterChipFiltros> {
  // Um Set guarda os filtros marcados: vários ao mesmo tempo, sem repetir.
  final _marcados = <String>{'Wi-Fi'};

  static const _comodidades = [
    'Wi-Fi', 'Piscina', 'Estacionamento', 'Pet friendly', 'Café da manhã',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final comodidade in _comodidades)
          // FilterChip: para filtros que podem ser combinados.
          FilterChip(
            label: Text(comodidade),
            selected: _marcados.contains(comodidade),
            onSelected: (marcado) {
              setState(() {
                if (marcado) {
                  _marcados.add(comodidade);
                } else {
                  _marcados.remove(comodidade);
                }
              });
            },
          ),
      ],
    );
  }
}
