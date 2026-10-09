import 'package:flutter/material.dart';

class DropdownMenuFiltro extends StatelessWidget {
  const DropdownMenuFiltro({super.key});

  static const _frutas = [
    'Abacate', 'Abacaxi', 'Banana', 'Caju', 'Goiaba', 'Laranja', 'Manga', //
    'Maracujá', 'Morango', 'Uva',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      label: const Text('Fruta'),
      // Digitar no campo filtra as opções da lista.
      enableFilter: true,
      // No celular, tocar no campo só abre o menu, sem teclado. Com isto,
      // abre o teclado também, para poder digitar o filtro.
      requestFocusOnTap: true,
      // Altura máxima da lista aberta; o resto rola.
      menuHeight: 240,
      dropdownMenuEntries: [
        for (final fruta in _frutas) DropdownMenuEntry(value: fruta, label: fruta),
      ],
    );
  }
}
