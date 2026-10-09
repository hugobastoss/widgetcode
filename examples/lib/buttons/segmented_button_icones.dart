import 'package:flutter/material.dart';

enum Visualizacao { lista, grade, mapa }

class SegmentedButtonIcones extends StatefulWidget {
  const SegmentedButtonIcones({super.key});

  @override
  State<SegmentedButtonIcones> createState() => _SegmentedButtonIconesState();
}

class _SegmentedButtonIconesState extends State<SegmentedButtonIcones> {
  Visualizacao _visualizacao = Visualizacao.lista;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Visualizacao>(
      // Por padrão o segmento marcado troca o ícone por um ✓. Desligando,
      // o ícone continua visível.
      showSelectedIcon: false,
      segments: const [
        // Sem label, o tooltip é o que descreve o segmento.
        ButtonSegment(
          value: Visualizacao.lista,
          icon: Icon(Icons.view_list_outlined),
          tooltip: 'Lista',
        ),
        ButtonSegment(
          value: Visualizacao.grade,
          icon: Icon(Icons.grid_view_outlined),
          tooltip: 'Grade',
        ),
        ButtonSegment(
          value: Visualizacao.mapa,
          icon: Icon(Icons.map_outlined),
          tooltip: 'Mapa',
        ),
      ],
      selected: {_visualizacao},
      onSelectionChanged: (selecao) {
        setState(() => _visualizacao = selecao.first);
      },
    );
  }
}
