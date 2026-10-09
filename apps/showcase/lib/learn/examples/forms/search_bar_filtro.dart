import 'package:flutter/material.dart';

class SearchBarFiltro extends StatefulWidget {
  const SearchBarFiltro({super.key});

  @override
  State<SearchBarFiltro> createState() => _SearchBarFiltroState();
}

class _SearchBarFiltroState extends State<SearchBarFiltro> {
  String _busca = '';

  static const _frutas = [
    'Abacate', 'Abacaxi', 'Banana', 'Caju', 'Goiaba', 'Laranja', 'Manga', //
    'Maracujá', 'Morango', 'Uva',
  ];

  @override
  Widget build(BuildContext context) {
    final resultado = _frutas
        .where((fruta) => fruta.toLowerCase().contains(_busca.toLowerCase()))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        SearchBar(
          hintText: 'Buscar fruta',
          leading: const Icon(Icons.search),
          // A cada letra, guarda o texto e filtra a lista de novo.
          onChanged: (texto) => setState(() => _busca = texto),
        ),
        Text(
          resultado.isEmpty ? 'Nada encontrado.' : resultado.join(', '),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
