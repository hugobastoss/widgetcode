import 'package:flutter/material.dart';

class AutocompleteObjetos extends StatefulWidget {
  const AutocompleteObjetos({super.key});

  @override
  State<AutocompleteObjetos> createState() => _AutocompleteObjetosState();
}

class _Pais {
  const _Pais(this.nome, this.capital);

  final String nome;
  final String capital;
}

class _AutocompleteObjetosState extends State<AutocompleteObjetos> {
  _Pais? _escolhido;

  static const _paises = [
    _Pais('Argentina', 'Buenos Aires'),
    _Pais('Bolívia', 'La Paz'),
    _Pais('Brasil', 'Brasília'),
    _Pais('Chile', 'Santiago'),
    _Pais('Colômbia', 'Bogotá'),
    _Pais('Paraguai', 'Assunção'),
    _Pais('Peru', 'Lima'),
    _Pais('Uruguai', 'Montevidéu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Autocomplete<_Pais>(
          optionsBuilder: (valor) {
            final busca = valor.text.toLowerCase();
            return _paises.where(
              (pais) => pais.nome.toLowerCase().contains(busca),
            );
          },
          // Como cada objeto aparece na lista e no campo.
          displayStringForOption: (pais) => pais.nome,
          // fieldViewBuilder troca o campo padrão por um com rótulo e borda.
          fieldViewBuilder: (context, controle, foco, aoEnviar) {
            return TextField(
              controller: controle,
              focusNode: foco,
              onSubmitted: (_) => aoEnviar(),
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
            );
          },
          // Recebe o objeto inteiro, não só o texto.
          onSelected: (pais) => setState(() => _escolhido = pais),
        ),
        Text(
          _escolhido == null
              ? 'Escolha um país da América do Sul.'
              : 'Capital: ${_escolhido!.capital}',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
