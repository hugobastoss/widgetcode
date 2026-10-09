import 'package:flutter/cupertino.dart';

class CupertinoPickerLista extends StatefulWidget {
  const CupertinoPickerLista({super.key});

  @override
  State<CupertinoPickerLista> createState() => _CupertinoPickerListaState();
}

class _CupertinoPickerListaState extends State<CupertinoPickerLista> {
  static const _tamanhos = ['Pequena', 'Média', 'Grande', 'Família'];

  int _escolhido = 1;
  // Diz em qual opção a roleta começa: índice 1 (Média).
  final _controle = FixedExtentScrollController(initialItem: 1);

  @override
  void dispose() {
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(
          height: 150,
          // A "roleta" do iPhone: gire para escolher.
          child: CupertinoPicker(
            itemExtent: 36, // altura de cada opção
            scrollController: _controle,
            onSelectedItemChanged: (indice) {
              setState(() => _escolhido = indice);
            },
            children: [
              for (final tamanho in _tamanhos) Center(child: Text(tamanho)),
            ],
          ),
        ),
        Text('Pizza ${_tamanhos[_escolhido]}'),
      ],
    );
  }
}
