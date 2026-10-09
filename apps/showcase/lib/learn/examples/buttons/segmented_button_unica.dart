import 'package:flutter/material.dart';

enum Periodo { dia, semana, mes }

class SegmentedButtonUnica extends StatefulWidget {
  const SegmentedButtonUnica({super.key});

  @override
  State<SegmentedButtonUnica> createState() => _SegmentedButtonUnicaState();
}

class _SegmentedButtonUnicaState extends State<SegmentedButtonUnica> {
  Periodo _periodo = Periodo.dia;

  @override
  Widget build(BuildContext context) {
    // O tipo entre <> é o tipo do valor de cada segmento — aqui, um enum.
    return SegmentedButton<Periodo>(
      segments: const [
        ButtonSegment(value: Periodo.dia, label: Text('Dia')),
        ButtonSegment(value: Periodo.semana, label: Text('Semana')),
        ButtonSegment(value: Periodo.mes, label: Text('Mês')),
      ],
      // selected é sempre um Set, mesmo quando só um segmento pode ficar
      // marcado.
      selected: {_periodo},
      onSelectionChanged: (selecao) {
        setState(() => _periodo = selecao.first);
      },
    );
  }
}
