import 'package:flutter/material.dart';

import '../../lists/custom_scroll_view_app_bar.dart';
import '../../lists/custom_scroll_view_slivers.dart';
import '../../lists/data_table_basico.dart';
import '../../lists/data_table_ordenacao.dart';
import '../../lists/grid_view_builder.dart';
import '../../lists/grid_view_count.dart';
import '../../lists/grid_view_extent.dart';
import '../../lists/list_tile_basico.dart';
import '../../lists/list_tile_leading_trailing.dart';
import '../../lists/list_tile_selecao.dart';
import '../../lists/list_tile_tres_linhas.dart';
import '../../lists/list_view_builder.dart';
import '../../lists/list_view_horizontal.dart';
import '../../lists/list_view_separated.dart';
import '../../lists/list_view_simples.dart';
import '../../lists/page_view_basico.dart';
import '../../lists/page_view_botoes.dart';
import '../../lists/page_view_indicador.dart';
import '../../lists/refresh_indicator_basico.dart';
import '../../lists/refresh_indicator_vazio.dart';
import '../../lists/single_child_scroll_view_horizontal.dart';
import '../../lists/single_child_scroll_view_vertical.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/lists';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

// Pré-visualizações dos cartões: esquemas com blocos coloridos que cabem na
// faixa de 88 de altura.

Widget _bloco(
  Color cor, {
  double? largura,
  double altura = 16,
  double raio = 0,
}) => Container(
  width: largura,
  height: altura,
  decoration: BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.circular(raio),
  ),
);

final _kCinza = Colors.grey.shade400;

final kListsDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'ListView',
    description: const Tr(
      pt: 'A lista com rolagem do Flutter: vertical ou horizontal, de qualquer tamanho.',
      en: "Flutter's scrolling list: vertical or horizontal, of any length.",
      es: 'La lista con scroll de Flutter: vertical u horizontal, de cualquier tamaño.',
    ),
    preview: SizedBox(
      width: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          for (final cor in const [
            Colors.indigo,
            Colors.teal,
            Colors.deepOrange,
          ])
            Row(
              spacing: 8,
              children: [
                _bloco(cor, largura: 16, raio: 8),
                Expanded(child: _bloco(_kCinza, altura: 10)),
              ],
            ),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Lista simples',
          en: 'Simple list',
          es: 'Lista simple',
        ),
        description: const Tr(
          pt: 'Itens fixos em children. Dentro de outra rolagem, precisa de altura.',
          en: 'Fixed items in children. Inside another scroll view, it needs a height.',
          es: 'Elementos fijos en children. Dentro de otro scroll, necesita una altura.',
        ),
        sourcePath: '$_kPasta/list_view_simples.dart',
        builder: (_) => const ListViewSimples(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'ListView.builder',
          en: 'ListView.builder',
          es: 'ListView.builder',
        ),
        description: const Tr(
          pt: 'Cria só os itens visíveis: aguenta 1000 contatos.',
          en: 'Builds only the visible items: it handles 1000 contacts.',
          es: 'Crea solo los elementos visibles: aguanta 1000 contactos.',
        ),
        sourcePath: '$_kPasta/list_view_builder.dart',
        builder: (_) => const ListViewBuilder(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'ListView.separated',
          en: 'ListView.separated',
          es: 'ListView.separated',
        ),
        description: const Tr(
          pt: 'Um separador entre cada item.',
          en: 'A separator between each item.',
          es: 'Un separador entre cada elemento.',
        ),
        sourcePath: '$_kPasta/list_view_separated.dart',
        builder: (_) => const ListViewSeparated(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Horizontal', en: 'Horizontal', es: 'Horizontal'),
        description: const Tr(
          pt: 'scrollDirection: Axis.horizontal, com cards lado a lado.',
          en: 'scrollDirection: Axis.horizontal, with cards side by side.',
          es: 'scrollDirection: Axis.horizontal, con tarjetas una al lado de la otra.',
        ),
        sourcePath: '$_kPasta/list_view_horizontal.dart',
        builder: (_) => const ListViewHorizontal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'GridView',
    description: const Tr(
      pt: 'Uma grade com rolagem, em linhas e colunas.',
      en: 'A scrolling grid of rows and columns.',
      es: 'Una cuadrícula con scroll, en filas y columnas.',
    ),
    preview: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        for (var linha = 0; linha < 2; linha++)
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              _bloco(Colors.indigo, largura: 24, altura: 24),
              _bloco(Colors.teal, largura: 24, altura: 24),
              _bloco(Colors.deepOrange, largura: 24, altura: 24),
            ],
          ),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'GridView.count',
          en: 'GridView.count',
          es: 'GridView.count',
        ),
        description: const Tr(
          pt: 'Um número fixo de colunas.',
          en: 'A fixed number of columns.',
          es: 'Un número fijo de columnas.',
        ),
        sourcePath: '$_kPasta/grid_view_count.dart',
        builder: (_) => const GridViewCount(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'GridView.builder',
          en: 'GridView.builder',
          es: 'GridView.builder',
        ),
        description: const Tr(
          pt: 'Itens sob demanda e proporção com childAspectRatio.',
          en: 'Items on demand and proportions with childAspectRatio.',
          es: 'Elementos bajo demanda y proporción con childAspectRatio.',
        ),
        sourcePath: '$_kPasta/grid_view_builder.dart',
        builder: (_) => const GridViewBuilder(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Largura máxima',
          en: 'Maximum width',
          es: 'Ancho máximo',
        ),
        description: const Tr(
          pt: 'As colunas se ajustam ao tamanho da tela.',
          en: 'The columns adapt to the screen size.',
          es: 'Las columnas se ajustan al tamaño de la pantalla.',
        ),
        sourcePath: '$_kPasta/grid_view_extent.dart',
        builder: (_) => const GridViewExtent(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ListTile',
    description: const Tr(
      pt: 'A linha de lista pronta: título, subtítulo, ícone e ação.',
      en: 'The ready-made list row: title, subtitle, icon and action.',
      es: 'La fila de lista ya hecha: título, subtítulo, ícono y acción.',
    ),
    preview: const SizedBox(
      width: 260,
      child: ListTile(
        leading: CircleAvatar(child: Text('MS')),
        title: Text('Maria Souza'),
        subtitle: Text('Oi! Tudo certo?'),
        trailing: Text('10:42'),
      ),
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Título e subtítulo.',
          en: 'Title and subtitle.',
          es: 'Título y subtítulo.',
        ),
        sourcePath: '$_kPasta/list_tile_basico.dart',
        builder: (_) => const ListTileBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'leading e trailing',
          en: 'leading and trailing',
          es: 'leading y trailing',
        ),
        description: const Tr(
          pt: 'Avatar antes e horário depois do texto.',
          en: 'An avatar before the text and a time after it.',
          es: 'Avatar antes y hora después del texto.',
        ),
        sourcePath: '$_kPasta/list_tile_leading_trailing.dart',
        builder: (_) => const ListTileLeadingTrailing(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Seleção', en: 'Selection', es: 'Selección'),
        description: const Tr(
          pt: 'selected e onTap para escolher uma opção.',
          en: 'selected and onTap to choose an option.',
          es: 'selected y onTap para elegir una opción.',
        ),
        sourcePath: '$_kPasta/list_tile_selecao.dart',
        builder: (_) => const ListTileSelecao(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Três linhas',
          en: 'Three lines',
          es: 'Tres líneas',
        ),
        description: const Tr(
          pt: 'isThreeLine para subtítulos longos.',
          en: 'isThreeLine for long subtitles.',
          es: 'isThreeLine para subtítulos largos.',
        ),
        sourcePath: '$_kPasta/list_tile_tres_linhas.dart',
        builder: (_) => const ListTileTresLinhas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SingleChildScrollView',
    description: const Tr(
      pt: 'Faz um único conteúdo grande rolar, como uma Column que não cabe.',
      en: "Makes a single large child scroll, like a Column that doesn't fit.",
      es: 'Hace que un único contenido grande se desplace, como una Column que no cabe.',
    ),
    preview: SizedBox(
      width: 140,
      height: 64,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          spacing: 6,
          children: [
            for (final cor in const [
              Colors.indigo,
              Colors.teal,
              Colors.deepOrange,
              Colors.indigo,
            ])
              _bloco(cor, largura: double.infinity, altura: 18),
          ],
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Vertical', en: 'Vertical', es: 'Vertical'),
        description: const Tr(
          pt: 'Uma Column maior que o espaço, sem overflow.',
          en: 'A Column taller than the space, with no overflow.',
          es: 'Una Column más alta que el espacio, sin overflow.',
        ),
        sourcePath: '$_kPasta/single_child_scroll_view_vertical.dart',
        builder: (_) => const SingleChildScrollViewVertical(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Horizontal', en: 'Horizontal', es: 'Horizontal'),
        description: const Tr(
          pt: 'Uma fileira de filtros que rola para o lado.',
          en: 'A row of filters that scrolls sideways.',
          es: 'Una fila de filtros que se desplaza hacia el lado.',
        ),
        sourcePath: '$_kPasta/single_child_scroll_view_horizontal.dart',
        builder: (_) => const SingleChildScrollViewHorizontal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'PageView',
    description: const Tr(
      pt: 'Páginas que trocam deslizando para o lado, como um carrossel.',
      en: 'Pages you switch by swiping sideways, like a carousel.',
      es: 'Páginas que cambian deslizando hacia el lado, como un carrusel.',
    ),
    preview: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            _bloco(Colors.teal.shade200, largura: 18, altura: 44, raio: 6),
            _bloco(Colors.indigo, largura: 96, altura: 56, raio: 8),
            _bloco(
              Colors.deepOrange.shade200,
              largura: 18,
              altura: 44,
              raio: 6,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            _bloco(Colors.indigo, largura: 16, altura: 6, raio: 3),
            _bloco(_kCinza, largura: 6, altura: 6, raio: 3),
            _bloco(_kCinza, largura: 6, altura: 6, raio: 3),
          ],
        ),
      ],
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Deslize para trocar de página.',
          en: 'Swipe to change pages.',
          es: 'Desliza para cambiar de página.',
        ),
        sourcePath: '$_kPasta/page_view_basico.dart',
        builder: (_) => const PageViewBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com indicador',
          en: 'With indicator',
          es: 'Con indicador',
        ),
        description: const Tr(
          pt: 'onPageChanged atualiza os pontinhos.',
          en: 'onPageChanged updates the dots.',
          es: 'onPageChanged actualiza los puntitos.',
        ),
        sourcePath: '$_kPasta/page_view_indicador.dart',
        builder: (_) => const PageViewIndicador(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com botões',
          en: 'With buttons',
          es: 'Con botones',
        ),
        description: const Tr(
          pt: 'PageController muda de página pelo código.',
          en: 'PageController changes pages from code.',
          es: 'PageController cambia de página desde el código.',
        ),
        sourcePath: '$_kPasta/page_view_botoes.dart',
        builder: (_) => const PageViewBotoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CustomScrollView',
    description: const Tr(
      pt: 'Junta listas, grades e cabeçalhos numa rolagem só.',
      en: 'Combines lists, grids and headers in a single scroll.',
      es: 'Une listas, cuadrículas y cabeceras en un solo scroll.',
    ),
    preview: SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          _bloco(Colors.indigo, altura: 20, raio: 4),
          Row(
            spacing: 4,
            children: [
              Expanded(child: _bloco(Colors.teal, altura: 20)),
              Expanded(child: _bloco(Colors.teal, altura: 20)),
              Expanded(child: _bloco(Colors.teal, altura: 20)),
            ],
          ),
          _bloco(_kCinza, altura: 8),
          _bloco(_kCinza, altura: 8),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Slivers', en: 'Slivers', es: 'Slivers'),
        description: const Tr(
          pt: 'Cabeçalho, grade e lista numa rolagem só.',
          en: 'Header, grid and list in a single scroll.',
          es: 'Cabecera, cuadrícula y lista en un solo scroll.',
        ),
        sourcePath: '$_kPasta/custom_scroll_view_slivers.dart',
        builder: (_) => const CustomScrollViewSlivers(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'SliverAppBar',
          en: 'SliverAppBar',
          es: 'SliverAppBar',
        ),
        description: const Tr(
          pt: 'Uma barra com imagem que encolhe ao rolar.',
          en: 'A bar with an image that shrinks as you scroll.',
          es: 'Una barra con imagen que se encoge al desplazarse.',
        ),
        sourcePath: '$_kPasta/custom_scroll_view_app_bar.dart',
        builder: (_) => const CustomScrollViewAppBar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RefreshIndicator',
    description: const Tr(
      pt: 'O "puxe para atualizar" no topo de uma lista.',
      en: 'The "pull to refresh" at the top of a list.',
      es: 'El "desliza para actualizar" en la parte superior de una lista.',
    ),
    preview: const RefreshProgressIndicator(value: 0.7),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Puxe para atualizar',
          en: 'Pull to refresh',
          es: 'Desliza para actualizar',
        ),
        description: const Tr(
          pt: 'Puxe a lista para baixo: chega uma mensagem nova.',
          en: 'Pull the list down: a new message arrives.',
          es: 'Desliza la lista hacia abajo: llega un mensaje nuevo.',
        ),
        sourcePath: '$_kPasta/refresh_indicator_basico.dart',
        builder: (_) => const RefreshIndicatorBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Lista vazia', en: 'Empty list', es: 'Lista vacía'),
        description: const Tr(
          pt: 'Como deixar puxar mesmo sem nenhum item.',
          en: 'How to allow pulling even with no items.',
          es: 'Cómo permitir deslizar incluso sin ningún elemento.',
        ),
        sourcePath: '$_kPasta/refresh_indicator_vazio.dart',
        builder: (_) => const RefreshIndicatorVazio(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'DataTable',
    description: const Tr(
      pt: 'Uma tabela com colunas, linhas e ordenação.',
      en: 'A table with columns, rows and sorting.',
      es: 'Una tabla con columnas, filas y ordenación.',
    ),
    preview: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        for (var linha = 0; linha < 3; linha++)
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              for (var coluna = 0; coluna < 3; coluna++)
                _bloco(
                  linha == 0 ? Colors.indigo : _kCinza,
                  largura: 44,
                  altura: 12,
                  raio: 2,
                ),
            ],
          ),
      ],
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Colunas, linhas e células.',
          en: 'Columns, rows and cells.',
          es: 'Columnas, filas y celdas.',
        ),
        sourcePath: '$_kPasta/data_table_basico.dart',
        builder: (_) => const DataTableBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Ordenação', en: 'Sorting', es: 'Ordenación'),
        description: const Tr(
          pt: 'Toque no cabeçalho de uma coluna para ordenar.',
          en: 'Tap a column header to sort.',
          es: 'Toca la cabecera de una columna para ordenar.',
        ),
        sourcePath: '$_kPasta/data_table_ordenacao.dart',
        builder: (_) => const DataTableOrdenacao(),
      ),
    ],
  ),
];
