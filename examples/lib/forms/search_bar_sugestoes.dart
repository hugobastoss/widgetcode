import 'package:flutter/material.dart';

class SearchBarSugestoes extends StatelessWidget {
  const SearchBarSugestoes({super.key});

  static const _cidades = [
    'Belém', 'Belo Horizonte', 'Brasília', 'Curitiba', 'Fortaleza', //
    'Manaus', 'Porto Alegre', 'Recife', 'Salvador', 'São Paulo',
  ];

  @override
  Widget build(BuildContext context) {
    // SearchAnchor.bar mostra uma SearchBar que, ao ser tocada, abre uma
    // tela de busca com sugestões.
    return SearchAnchor.bar(
      barHintText: 'Buscar cidade',
      // Monta as sugestões sempre que o texto muda.
      suggestionsBuilder: (context, controle) {
        final busca = controle.text.toLowerCase();
        return _cidades
            .where((cidade) => cidade.toLowerCase().contains(busca))
            .map(
              (cidade) => ListTile(
                leading: const Icon(Icons.location_city),
                title: Text(cidade),
                // Fecha a tela de busca e coloca a cidade na barra.
                onTap: () => controle.closeView(cidade),
              ),
            );
      },
    );
  }
}
