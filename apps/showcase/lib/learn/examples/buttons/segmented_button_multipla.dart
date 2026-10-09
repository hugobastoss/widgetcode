import 'package:flutter/material.dart';

enum Tamanho { p, m, g, gg }

class SegmentedButtonMultipla extends StatefulWidget {
  const SegmentedButtonMultipla({super.key});

  @override
  State<SegmentedButtonMultipla> createState() =>
      _SegmentedButtonMultiplaState();
}

class _SegmentedButtonMultiplaState extends State<SegmentedButtonMultipla> {
  Set<Tamanho> _tamanhos = {Tamanho.m};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Tamanho>(
      // Permite marcar vários segmentos ao mesmo tempo.
      multiSelectionEnabled: true,
      // Permite desmarcar todos. Por padrão, sempre fica um marcado.
      emptySelectionAllowed: true,
      segments: const [
        ButtonSegment(value: Tamanho.p, label: Text('P')),
        ButtonSegment(value: Tamanho.m, label: Text('M')),
        ButtonSegment(value: Tamanho.g, label: Text('G')),
        ButtonSegment(value: Tamanho.gg, label: Text('GG')),
      ],
      selected: _tamanhos,
      onSelectionChanged: (selecao) {
        setState(() => _tamanhos = selecao);
      },
    );
  }
}
