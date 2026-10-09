import 'package:flutter/material.dart';

class DataTableBasico extends StatelessWidget {
  const DataTableBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Tabelas costumam ser mais largas que o celular: a rolagem horizontal
    // evita o overflow.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        // As colunas definem o cabeçalho...
        columns: const [
          DataColumn(label: Text('Nome')),
          DataColumn(label: Text('Cidade')),
          // numeric alinha os números à direita.
          DataColumn(label: Text('Idade'), numeric: true),
        ],
        // ...e cada DataRow precisa ter uma DataCell por coluna.
        rows: const [
          DataRow(cells: [
            DataCell(Text('Ana')),
            DataCell(Text('Recife')),
            DataCell(Text('28')),
          ]),
          DataRow(cells: [
            DataCell(Text('Bruno')),
            DataCell(Text('Curitiba')),
            DataCell(Text('35')),
          ]),
          DataRow(cells: [
            DataCell(Text('Carla')),
            DataCell(Text('Manaus')),
            DataCell(Text('22')),
          ]),
        ],
      ),
    );
  }
}
