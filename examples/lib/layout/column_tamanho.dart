import 'package:flutter/material.dart';

class ColumnTamanho extends StatefulWidget {
  const ColumnTamanho({super.key});

  @override
  State<ColumnTamanho> createState() => _ColumnTamanhoState();
}

class _ColumnTamanhoState extends State<ColumnTamanho> {
  MainAxisSize _tamanho = MainAxisSize.max;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180,
          child: Align(
            alignment: Alignment.topCenter,
            // O fundo amarelo mostra quanto espaço a Column ocupa.
            child: Container(
              color: Colors.amber.shade200,
              padding: const EdgeInsets.all(8),
              child: Column(
                // max: ocupa toda a altura disponível (o padrão).
                // min: ocupa só a altura dos filhos.
                mainAxisSize: _tamanho,
                spacing: 8,
                children: [
                  Container(width: 80, height: 32, color: Colors.indigo),
                  Container(width: 80, height: 32, color: Colors.teal),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SegmentedButton<MainAxisSize>(
          segments: const [
            ButtonSegment(value: MainAxisSize.max, label: Text('max')),
            ButtonSegment(value: MainAxisSize.min, label: Text('min')),
          ],
          selected: {_tamanho},
          onSelectionChanged: (selecao) {
            setState(() => _tamanho = selecao.first);
          },
        ),
      ],
    );
  }
}
