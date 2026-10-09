import 'package:flutter/material.dart';

class RowAlinhamentoCruzado extends StatefulWidget {
  const RowAlinhamentoCruzado({super.key});

  @override
  State<RowAlinhamentoCruzado> createState() => _RowAlinhamentoCruzadoState();
}

class _RowAlinhamentoCruzadoState extends State<RowAlinhamentoCruzado> {
  CrossAxisAlignment _alinhamento = CrossAxisAlignment.center;

  // CrossAxisAlignment.baseline fica de fora: ele exige textBaseline e só
  // faz sentido com textos.
  static const _opcoes = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // A Row precisa de uma altura maior que a dos filhos para o
        // alinhamento cruzado (vertical) aparecer.
        Container(
          height: 120,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: Row(
            crossAxisAlignment: _alinhamento,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _Caixa(Colors.indigo, altura: 40),
              _Caixa(Colors.teal, altura: 80),
              _Caixa(Colors.deepOrange, altura: 60),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            for (final opcao in _opcoes)
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
  const _Caixa(this.cor, {required this.altura});

  final Color cor;
  final double altura;

  @override
  Widget build(BuildContext context) {
    // Com stretch, a Row ignora essa altura e estica a caixa.
    return Container(width: 40, height: altura, color: cor);
  }
}
