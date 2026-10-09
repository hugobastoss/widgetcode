import 'package:flutter/material.dart';

class ListTileSelecao extends StatefulWidget {
  const ListTileSelecao({super.key});

  @override
  State<ListTileSelecao> createState() => _ListTileSelecaoState();
}

class _ListTileSelecaoState extends State<ListTileSelecao> {
  int _selecionado = 0;

  static const _opcoes = ['Retirar na loja', 'Entrega padrão', 'Entrega expressa'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < _opcoes.length; i++)
          ListTile(
            title: Text(_opcoes[i]),
            // selected muda a cor do texto e dos ícones da linha.
            selected: i == _selecionado,
            selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
            trailing: i == _selecionado ? const Icon(Icons.check) : null,
            // onTap deixa a linha tocável (com o efeito de toque).
            onTap: () => setState(() => _selecionado = i),
          ),
      ],
    );
  }
}
