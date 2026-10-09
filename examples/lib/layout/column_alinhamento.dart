import 'package:flutter/material.dart';

class ColumnAlinhamento extends StatefulWidget {
  const ColumnAlinhamento({super.key});

  @override
  State<ColumnAlinhamento> createState() => _ColumnAlinhamentoState();
}

class _ColumnAlinhamentoState extends State<ColumnAlinhamento> {
  MainAxisAlignment _alinhamento = MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Altura fixa e borda para o espaço livre da Column aparecer.
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Column(
            // Na Column, o eixo principal é o vertical.
            mainAxisAlignment: _alinhamento,
            children: const [
              _Caixa(Colors.indigo),
              _Caixa(Colors.teal),
              _Caixa(Colors.deepOrange),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final opcao in MainAxisAlignment.values)
              ChoiceChip(
                label: Text(opcao.name),
                selected: _alinhamento == opcao,
                onSelected: (_) => setState(() => _alinhamento = opcao),
              ),
          ],
        ),
      ],
    );
  }
}

class _Caixa extends StatelessWidget {
  const _Caixa(this.cor);

  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(width: 80, height: 32, color: cor);
  }
}
