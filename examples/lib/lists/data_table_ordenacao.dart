import 'package:flutter/material.dart';

class DataTableOrdenacao extends StatefulWidget {
  const DataTableOrdenacao({super.key});

  @override
  State<DataTableOrdenacao> createState() => _DataTableOrdenacaoState();
}

class _Produto {
  const _Produto(this.nome, this.quantidade, this.preco);

  final String nome;
  final int quantidade;
  final double preco;
}

class _DataTableOrdenacaoState extends State<DataTableOrdenacao> {
  // Já começa ordenada por preço, do menor para o maior.
  final _produtos = [
    const _Produto('Leite', 6, 5.2),
    const _Produto('Feijão', 3, 9.8),
    const _Produto('Café', 2, 18.9),
    const _Produto('Arroz', 1, 27.5),
  ];
  int _coluna = 2;
  bool _crescente = true;

  // Chamado ao tocar no cabeçalho de uma coluna. O DataTable só desenha a
  // seta; ordenar a lista é com você.
  void _ordenar(int coluna, bool crescente) {
    setState(() {
      _coluna = coluna;
      _crescente = crescente;
      _produtos.sort((a, b) {
        final comparacao = switch (coluna) {
          0 => a.nome.compareTo(b.nome),
          1 => a.quantidade.compareTo(b.quantidade),
          _ => a.preco.compareTo(b.preco),
        };
        return crescente ? comparacao : -comparacao;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        sortColumnIndex: _coluna, // qual coluna mostra a seta
        sortAscending: _crescente, // seta para cima ou para baixo
        columns: [
          DataColumn(label: const Text('Produto'), onSort: _ordenar),
          DataColumn(label: const Text('Qtd'), numeric: true, onSort: _ordenar),
          DataColumn(label: const Text('Preço'), numeric: true, onSort: _ordenar),
        ],
        rows: [
          for (final produto in _produtos)
            DataRow(
              cells: [
                DataCell(Text(produto.nome)),
                DataCell(Text('${produto.quantidade}')),
                // \$ escreve o símbolo $ em vez de começar uma variável.
                DataCell(
                  Text(
                    'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
