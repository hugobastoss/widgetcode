import 'package:flutter/material.dart';

import '../examples/cards/card_basico.dart';
import '../examples/cards/card_completo.dart';
import '../examples/cards/card_tocavel.dart';
import '../examples/cards/card_variantes.dart';
import '../examples/cards/expansion_panel_basico.dart';
import '../examples/cards/expansion_panel_radio.dart';
import '../examples/cards/expansion_tile_aberto.dart';
import '../examples/cards/expansion_tile_basico.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/cards';

Widget _barra(Color cor, double largura, {double altura = 8}) => Container(
  width: largura,
  height: altura,
  decoration: BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.circular(altura / 2),
  ),
);

final kCardsDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Card',
    description: 'Uma superfície com cantos arredondados para agrupar conteúdo.',
    preview: const Card(
      child: SizedBox(
        width: 140,
        height: 56,
        child: Center(child: Text('Card')),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Um Card com Padding e texto.',
        sourcePath: '$_kPasta/card_basico.dart',
        builder: (_) => const CardBasico(),
      ),
      WidgetExample(
        title: 'Três estilos',
        description: 'Card, Card.filled e Card.outlined.',
        sourcePath: '$_kPasta/card_variantes.dart',
        builder: (_) => const CardVariantes(),
      ),
      WidgetExample(
        title: 'Com imagem e ações',
        description: 'Imagem no topo, ListTile e botões no rodapé.',
        sourcePath: '$_kPasta/card_completo.dart',
        builder: (_) => const CardCompleto(),
      ),
      WidgetExample(
        title: 'Tocável',
        description: 'InkWell dentro do Card, com clipBehavior.',
        sourcePath: '$_kPasta/card_tocavel.dart',
        builder: (_) => const CardTocavel(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ExpansionTile',
    description: 'Uma linha que abre e fecha para mostrar mais conteúdo.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                children: [
                  _barra(cores.onSurface, 120, altura: 10),
                  const Spacer(),
                  const Icon(Icons.expand_less, size: 20),
                ],
              ),
              _barra(cores.outline, 170, altura: 6),
              _barra(cores.outline, 130, altura: 6),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Perguntas frequentes',
        description: 'Toque numa pergunta para ver a resposta.',
        sourcePath: '$_kPasta/expansion_tile_basico.dart',
        builder: (_) => const ExpansionTileBasico(),
      ),
      WidgetExample(
        title: 'Começa aberto',
        description: 'initiallyExpanded, ícone e onExpansionChanged.',
        sourcePath: '$_kPasta/expansion_tile_aberto.dart',
        builder: (_) => const ExpansionTileAberto(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ExpansionPanelList',
    description: 'Uma lista de painéis que abrem e fecham, com divisórias.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        Widget painel({required bool aberto}) => Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          color: cores.surfaceContainerLowest,
          child: Row(
            children: [
              _barra(cores.onSurface, 80),
              const Spacer(),
              Icon(aberto ? Icons.expand_less : Icons.expand_more, size: 18),
            ],
          ),
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [painel(aberto: true), painel(aberto: false)],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Você guarda o aberto/fechado de cada painel.',
        sourcePath: '$_kPasta/expansion_panel_basico.dart',
        builder: (_) => const ExpansionPanelBasico(),
      ),
      WidgetExample(
        title: 'Um aberto por vez',
        description: 'ExpansionPanelList.radio fecha os outros sozinho.',
        sourcePath: '$_kPasta/expansion_panel_radio.dart',
        builder: (_) => const ExpansionPanelRadioExemplo(),
      ),
    ],
  ),
];
