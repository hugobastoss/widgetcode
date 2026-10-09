import 'package:flutter/material.dart';

import '../../cards/card_basico.dart';
import '../../cards/card_completo.dart';
import '../../cards/card_tocavel.dart';
import '../../cards/card_variantes.dart';
import '../../cards/expansion_panel_basico.dart';
import '../../cards/expansion_panel_radio.dart';
import '../../cards/expansion_tile_aberto.dart';
import '../../cards/expansion_tile_basico.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/cards';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

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
    description: const Tr(
      pt: 'Uma superfície com cantos arredondados para agrupar conteúdo.',
      en: 'A surface with rounded corners to group content.',
      es: 'Una superficie con esquinas redondeadas para agrupar contenido.',
    ),
    preview: const Card(
      child: SizedBox(
        width: 140,
        height: 56,
        child: Center(child: Text('Card')),
      ),
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Um Card com Padding e texto.',
          en: 'A Card with Padding and text.',
          es: 'Un Card con Padding y texto.',
        ),
        sourcePath: '$_kPasta/card_basico.dart',
        builder: (_) => const CardBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Três estilos',
          en: 'Three styles',
          es: 'Tres estilos',
        ),
        description: const Tr(
          pt: 'Card, Card.filled e Card.outlined.',
          en: 'Card, Card.filled and Card.outlined.',
          es: 'Card, Card.filled y Card.outlined.',
        ),
        sourcePath: '$_kPasta/card_variantes.dart',
        builder: (_) => const CardVariantes(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com imagem e ações',
          en: 'With an image and actions',
          es: 'Con imagen y acciones',
        ),
        description: const Tr(
          pt: 'Imagem no topo, ListTile e botões no rodapé.',
          en: 'An image at the top, a ListTile and buttons at the bottom.',
          es: 'Imagen arriba, ListTile y botones al pie.',
        ),
        sourcePath: '$_kPasta/card_completo.dart',
        builder: (_) => const CardCompleto(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Tocável', en: 'Tappable', es: 'Tocable'),
        description: const Tr(
          pt: 'InkWell dentro do Card, com clipBehavior.',
          en: 'InkWell inside the Card, with clipBehavior.',
          es: 'InkWell dentro del Card, con clipBehavior.',
        ),
        sourcePath: '$_kPasta/card_tocavel.dart',
        builder: (_) => const CardTocavel(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ExpansionTile',
    description: const Tr(
      pt: 'Uma linha que abre e fecha para mostrar mais conteúdo.',
      en: 'A row that expands and collapses to show more content.',
      es: 'Una fila que se abre y se cierra para mostrar más contenido.',
    ),
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
        title: const Tr(
          pt: 'Perguntas frequentes',
          en: 'FAQ',
          es: 'Preguntas frecuentes',
        ),
        description: const Tr(
          pt: 'Toque numa pergunta para ver a resposta.',
          en: 'Tap a question to see the answer.',
          es: 'Toca una pregunta para ver la respuesta.',
        ),
        sourcePath: '$_kPasta/expansion_tile_basico.dart',
        builder: (_) => const ExpansionTileBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Começa aberto',
          en: 'Starts expanded',
          es: 'Empieza abierto',
        ),
        description: const Tr(
          pt: 'initiallyExpanded, ícone e onExpansionChanged.',
          en: 'initiallyExpanded, an icon and onExpansionChanged.',
          es: 'initiallyExpanded, ícono y onExpansionChanged.',
        ),
        sourcePath: '$_kPasta/expansion_tile_aberto.dart',
        builder: (_) => const ExpansionTileAberto(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ExpansionPanelList',
    description: const Tr(
      pt: 'Uma lista de painéis que abrem e fecham, com divisórias.',
      en: 'A list of panels that expand and collapse, with dividers.',
      es: 'Una lista de paneles que se abren y cierran, con divisiones.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Você guarda o aberto/fechado de cada painel.',
          en: 'You keep track of whether each panel is open.',
          es: 'Tú guardas si cada panel está abierto o cerrado.',
        ),
        sourcePath: '$_kPasta/expansion_panel_basico.dart',
        builder: (_) => const ExpansionPanelBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Um aberto por vez',
          en: 'One open at a time',
          es: 'Uno abierto a la vez',
        ),
        description: const Tr(
          pt: 'ExpansionPanelList.radio fecha os outros sozinho.',
          en: 'ExpansionPanelList.radio closes the others by itself.',
          es: 'ExpansionPanelList.radio cierra los demás por sí solo.',
        ),
        sourcePath: '$_kPasta/expansion_panel_radio.dart',
        builder: (_) => const ExpansionPanelRadioExemplo(),
      ),
    ],
  ),
];
