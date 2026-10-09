import 'package:flutter/material.dart';

import '../examples/lists/custom_scroll_view_app_bar.dart';
import '../examples/lists/custom_scroll_view_slivers.dart';
import '../examples/lists/data_table_basico.dart';
import '../examples/lists/data_table_ordenacao.dart';
import '../examples/lists/grid_view_builder.dart';
import '../examples/lists/grid_view_count.dart';
import '../examples/lists/grid_view_extent.dart';
import '../examples/lists/list_tile_basico.dart';
import '../examples/lists/list_tile_leading_trailing.dart';
import '../examples/lists/list_tile_selecao.dart';
import '../examples/lists/list_tile_tres_linhas.dart';
import '../examples/lists/list_view_builder.dart';
import '../examples/lists/list_view_horizontal.dart';
import '../examples/lists/list_view_separated.dart';
import '../examples/lists/list_view_simples.dart';
import '../examples/lists/page_view_basico.dart';
import '../examples/lists/page_view_botoes.dart';
import '../examples/lists/page_view_indicador.dart';
import '../examples/lists/refresh_indicator_basico.dart';
import '../examples/lists/refresh_indicator_vazio.dart';
import '../examples/lists/single_child_scroll_view_horizontal.dart';
import '../examples/lists/single_child_scroll_view_vertical.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/lists';

// Pré-visualizações dos cartões: esquemas com blocos coloridos que cabem na
// faixa de 88 de altura.

Widget _bloco(Color cor, {double? largura, double altura = 16, double raio = 0}) =>
    Container(
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
    description:
        'A lista com rolagem do Flutter: vertical ou horizontal, de qualquer tamanho.',
    preview: SizedBox(
      width: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          for (final cor in const [Colors.indigo, Colors.teal, Colors.deepOrange])
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
        title: 'Lista simples',
        description:
            'Itens fixos em children. Dentro de outra rolagem, precisa de altura.',
        sourcePath: '$_kPasta/list_view_simples.dart',
        builder: (_) => const ListViewSimples(),
      ),
      WidgetExample(
        title: 'ListView.builder',
        description: 'Cria só os itens visíveis: aguenta 1000 contatos.',
        sourcePath: '$_kPasta/list_view_builder.dart',
        builder: (_) => const ListViewBuilder(),
      ),
      WidgetExample(
        title: 'ListView.separated',
        description: 'Um separador entre cada item.',
        sourcePath: '$_kPasta/list_view_separated.dart',
        builder: (_) => const ListViewSeparated(),
      ),
      WidgetExample(
        title: 'Horizontal',
        description: 'scrollDirection: Axis.horizontal, com cards lado a lado.',
        sourcePath: '$_kPasta/list_view_horizontal.dart',
        builder: (_) => const ListViewHorizontal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'GridView',
    description: 'Uma grade com rolagem, em linhas e colunas.',
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
        title: 'GridView.count',
        description: 'Um número fixo de colunas.',
        sourcePath: '$_kPasta/grid_view_count.dart',
        builder: (_) => const GridViewCount(),
      ),
      WidgetExample(
        title: 'GridView.builder',
        description: 'Itens sob demanda e proporção com childAspectRatio.',
        sourcePath: '$_kPasta/grid_view_builder.dart',
        builder: (_) => const GridViewBuilder(),
      ),
      WidgetExample(
        title: 'Largura máxima',
        description: 'As colunas se ajustam ao tamanho da tela.',
        sourcePath: '$_kPasta/grid_view_extent.dart',
        builder: (_) => const GridViewExtent(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ListTile',
    description: 'A linha de lista pronta: título, subtítulo, ícone e ação.',
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
        title: 'Básico',
        description: 'Título e subtítulo.',
        sourcePath: '$_kPasta/list_tile_basico.dart',
        builder: (_) => const ListTileBasico(),
      ),
      WidgetExample(
        title: 'leading e trailing',
        description: 'Avatar antes e horário depois do texto.',
        sourcePath: '$_kPasta/list_tile_leading_trailing.dart',
        builder: (_) => const ListTileLeadingTrailing(),
      ),
      WidgetExample(
        title: 'Seleção',
        description: 'selected e onTap para escolher uma opção.',
        sourcePath: '$_kPasta/list_tile_selecao.dart',
        builder: (_) => const ListTileSelecao(),
      ),
      WidgetExample(
        title: 'Três linhas',
        description: 'isThreeLine para subtítulos longos.',
        sourcePath: '$_kPasta/list_tile_tres_linhas.dart',
        builder: (_) => const ListTileTresLinhas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SingleChildScrollView',
    description:
        'Faz um único conteúdo grande rolar, como uma Column que não cabe.',
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
        title: 'Vertical',
        description: 'Uma Column maior que o espaço, sem overflow.',
        sourcePath: '$_kPasta/single_child_scroll_view_vertical.dart',
        builder: (_) => const SingleChildScrollViewVertical(),
      ),
      WidgetExample(
        title: 'Horizontal',
        description: 'Uma fileira de filtros que rola para o lado.',
        sourcePath: '$_kPasta/single_child_scroll_view_horizontal.dart',
        builder: (_) => const SingleChildScrollViewHorizontal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'PageView',
    description: 'Páginas que trocam deslizando para o lado, como um carrossel.',
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
            _bloco(Colors.deepOrange.shade200, largura: 18, altura: 44, raio: 6),
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
        title: 'Básico',
        description: 'Deslize para trocar de página.',
        sourcePath: '$_kPasta/page_view_basico.dart',
        builder: (_) => const PageViewBasico(),
      ),
      WidgetExample(
        title: 'Com indicador',
        description: 'onPageChanged atualiza os pontinhos.',
        sourcePath: '$_kPasta/page_view_indicador.dart',
        builder: (_) => const PageViewIndicador(),
      ),
      WidgetExample(
        title: 'Com botões',
        description: 'PageController muda de página pelo código.',
        sourcePath: '$_kPasta/page_view_botoes.dart',
        builder: (_) => const PageViewBotoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CustomScrollView',
    description: 'Junta listas, grades e cabeçalhos numa rolagem só.',
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
        title: 'Slivers',
        description: 'Cabeçalho, grade e lista numa rolagem só.',
        sourcePath: '$_kPasta/custom_scroll_view_slivers.dart',
        builder: (_) => const CustomScrollViewSlivers(),
      ),
      WidgetExample(
        title: 'SliverAppBar',
        description: 'Uma barra com imagem que encolhe ao rolar.',
        sourcePath: '$_kPasta/custom_scroll_view_app_bar.dart',
        builder: (_) => const CustomScrollViewAppBar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RefreshIndicator',
    description: 'O "puxe para atualizar" no topo de uma lista.',
    preview: const RefreshProgressIndicator(value: 0.7),
    examples: [
      WidgetExample(
        title: 'Puxe para atualizar',
        description: 'Puxe a lista para baixo: chega uma mensagem nova.',
        sourcePath: '$_kPasta/refresh_indicator_basico.dart',
        builder: (_) => const RefreshIndicatorBasico(),
      ),
      WidgetExample(
        title: 'Lista vazia',
        description: 'Como deixar puxar mesmo sem nenhum item.',
        sourcePath: '$_kPasta/refresh_indicator_vazio.dart',
        builder: (_) => const RefreshIndicatorVazio(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'DataTable',
    description: 'Uma tabela com colunas, linhas e ordenação.',
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
        title: 'Básico',
        description: 'Colunas, linhas e células.',
        sourcePath: '$_kPasta/data_table_basico.dart',
        builder: (_) => const DataTableBasico(),
      ),
      WidgetExample(
        title: 'Ordenação',
        description: 'Toque no cabeçalho de uma coluna para ordenar.',
        sourcePath: '$_kPasta/data_table_ordenacao.dart',
        builder: (_) => const DataTableOrdenacao(),
      ),
    ],
  ),
];
