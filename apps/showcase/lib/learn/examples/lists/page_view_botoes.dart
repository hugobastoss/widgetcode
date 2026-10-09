import 'package:flutter/material.dart';

class PageViewBotoes extends StatefulWidget {
  const PageViewBotoes({super.key});

  @override
  State<PageViewBotoes> createState() => _PageViewBotoesState();
}

class _PageViewBotoesState extends State<PageViewBotoes> {
  // O PageController deixa o código mudar de página (não só o dedo).
  final _controle = PageController();
  int _pagina = 0;

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];
  static const _animacao = Duration(milliseconds: 300);

  @override
  void dispose() {
    // Controllers precisam ser liberados quando o widget sai da tela.
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ultima = _cores.length - 1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          child: PageView(
            controller: _controle,
            onPageChanged: (indice) => setState(() => _pagina = indice),
            children: [
              for (final (i, cor) in _cores.indexed)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Passo ${i + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              tooltip: 'Anterior',
              onPressed: _pagina == 0
                  ? null
                  : () => _controle.previousPage(
                      duration: _animacao,
                      curve: Curves.easeOut,
                    ),
              icon: const Icon(Icons.chevron_left),
            ),
            Text('${_pagina + 1} de ${_cores.length}'),
            IconButton(
              tooltip: 'Próxima',
              onPressed: _pagina == ultima
                  ? null
                  : () => _controle.nextPage(
                      duration: _animacao,
                      curve: Curves.easeOut,
                    ),
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }
}
