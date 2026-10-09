import 'package:flutter/material.dart';

class ChoiceChipObrigatorio extends StatefulWidget {
  const ChoiceChipObrigatorio({super.key});

  @override
  State<ChoiceChipObrigatorio> createState() => _ChoiceChipObrigatorioState();
}

class _ChoiceChipObrigatorioState extends State<ChoiceChipObrigatorio> {
  String _tamanho = 'M';

  static const _tamanhos = ['P', 'M', 'G', 'GG'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (final tamanho in _tamanhos)
          ChoiceChip(
            label: Text(tamanho),
            selected: _tamanho == tamanho,
            // Ignorando o bool recebido, tocar na opção já escolhida não
            // desmarca: sempre fica uma escolhida.
            onSelected: (_) => setState(() => _tamanho = tamanho),
          ),
      ],
    );
  }
}
