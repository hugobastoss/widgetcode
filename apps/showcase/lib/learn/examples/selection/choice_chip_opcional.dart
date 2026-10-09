import 'package:flutter/material.dart';

class ChoiceChipOpcional extends StatefulWidget {
  const ChoiceChipOpcional({super.key});

  @override
  State<ChoiceChipOpcional> createState() => _ChoiceChipOpcionalState();
}

class _ChoiceChipOpcionalState extends State<ChoiceChipOpcional> {
  // null = nenhuma opção escolhida.
  String? _prazo = 'Hoje';

  static const _opcoes = ['Hoje', 'Amanhã', 'Esta semana'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final opcao in _opcoes)
              // ChoiceChip: só uma opção por vez (como um Radio).
              ChoiceChip(
                label: Text(opcao),
                selected: _prazo == opcao,
                // marcado é false quando a pessoa toca na opção que já
                // estava escolhida: aí desmarcamos tudo.
                onSelected: (marcado) {
                  setState(() => _prazo = marcado ? opcao : null);
                },
              ),
          ],
        ),
        Text(_prazo == null ? 'Nenhum prazo escolhido.' : 'Prazo: $_prazo'),
      ],
    );
  }
}
