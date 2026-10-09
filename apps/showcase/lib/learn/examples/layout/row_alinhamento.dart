import 'package:flutter/material.dart';

class RowAlinhamento extends StatefulWidget {
  const RowAlinhamento({super.key});

  @override
  State<RowAlinhamento> createState() => _RowAlinhamentoState();
}

class _RowAlinhamentoState extends State<RowAlinhamento> {
  MainAxisAlignment _alinhamento = MainAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // A borda só mostra onde a Row começa e termina.
        DecoratedBox(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Row(
            // mainAxisAlignment distribui os filhos no eixo principal (na
            // Row, o horizontal).
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
    return Container(width: 40, height: 40, color: cor);
  }
}
