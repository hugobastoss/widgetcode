import 'package:flutter/material.dart';

class AutocompleteBasico extends StatelessWidget {
  const AutocompleteBasico({super.key});

  static const _capitais = [
    'Belém', 'Belo Horizonte', 'Boa Vista', 'Brasília', 'Curitiba', //
    'Florianópolis', 'Fortaleza', 'Goiânia', 'Manaus', 'Porto Alegre',
    'Recife', 'Rio de Janeiro', 'Salvador', 'São Paulo',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      // Chamado a cada letra: devolve as opções que combinam com o texto.
      optionsBuilder: (valor) {
        if (valor.text.isEmpty) return const Iterable<String>.empty();
        final busca = valor.text.toLowerCase();
        return _capitais.where(
          (capital) => capital.toLowerCase().startsWith(busca),
        );
      },
      onSelected: (capital) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Você escolheu $capital.')),
        );
      },
    );
  }
}
