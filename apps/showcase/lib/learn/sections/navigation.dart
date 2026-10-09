import 'package:flutter/material.dart';

import '../examples/navigation/app_bar_acoes.dart';
import '../examples/navigation/app_bar_basico.dart';
import '../examples/navigation/app_bar_cores.dart';
import '../examples/navigation/bottom_app_bar_entalhe.dart';
import '../examples/navigation/bottom_app_bar_fab.dart';
import '../examples/navigation/navigation_bar_basico.dart';
import '../examples/navigation/navigation_bar_selos.dart';
import '../examples/navigation/navigation_drawer_basico.dart';
import '../examples/navigation/navigation_drawer_codigo.dart';
import '../examples/navigation/navigation_rail_basico.dart';
import '../examples/navigation/navigation_rail_fab.dart';
import '../examples/navigation/navigator_push_pop.dart';
import '../examples/navigation/navigator_resultado.dart';
import '../examples/navigation/tab_bar_rolavel.dart';
import '../examples/navigation/tab_bar_view.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/navigation';

Widget _bloco(Color cor, double largura, double altura, {double raio = 0}) =>
    Container(
      width: largura,
      height: altura,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(raio),
      ),
    );

/// Esquema de uma tela de celular, usado na prévia do Navigator.
Widget _telinha(ColorScheme cores, {bool comVoltar = false}) => Container(
  width: 48,
  height: 72,
  clipBehavior: Clip.antiAlias,
  decoration: BoxDecoration(
    border: Border.all(color: cores.outline),
    borderRadius: BorderRadius.circular(6),
  ),
  child: Column(
    children: [
      Container(
        height: 14,
        color: cores.primaryContainer,
        alignment: Alignment.centerLeft,
        child: comVoltar
            ? Icon(Icons.arrow_back, size: 10, color: cores.onPrimaryContainer)
            : null,
      ),
    ],
  ),
);

final kNavigationDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'AppBar',
    description: 'A barra do topo da tela: título, menu e ações.',
    preview: SizedBox(
      width: 240,
      height: 56,
      child: AppBar(
        primary: false,
        automaticallyImplyLeading: false,
        title: const Text('Mensagens'),
        actions: const [Icon(Icons.search), SizedBox(width: 12)],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Um Scaffold com AppBar e título.',
        sourcePath: '$_kPasta/app_bar_basico.dart',
        builder: (_) => const AppBarBasico(),
      ),
      WidgetExample(
        title: 'leading e actions',
        description: 'Menu à esquerda e botões de ação à direita.',
        sourcePath: '$_kPasta/app_bar_acoes.dart',
        builder: (_) => const AppBarAcoes(),
      ),
      WidgetExample(
        title: 'Cores e título no meio',
        description: 'backgroundColor, foregroundColor e centerTitle.',
        sourcePath: '$_kPasta/app_bar_cores.dart',
        builder: (_) => const AppBarCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationBar',
    description: 'A barra de abas embaixo da tela, para trocar de seção.',
    preview: SizedBox(
      width: 260,
      height: 80,
      child: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Perfil'),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Três abas que trocam o conteúdo da tela.',
        sourcePath: '$_kPasta/navigation_bar_basico.dart',
        builder: (_) => const NavigationBarBasico(),
      ),
      WidgetExample(
        title: 'Com selos',
        description: 'Badge nos ícones e texto só na aba escolhida.',
        sourcePath: '$_kPasta/navigation_bar_selos.dart',
        builder: (_) => const NavigationBarSelos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationRail',
    description: 'A barra de navegação lateral, para tablets e telas largas.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 76,
              color: cores.surfaceContainerLow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  _bloco(cores.secondaryContainer, 28, 14, raio: 7),
                  _bloco(cores.outline, 12, 12, raio: 6),
                  _bloco(cores.outline, 12, 12, raio: 6),
                ],
              ),
            ),
            _bloco(cores.surface, 110, 76),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Destinos com ícone e texto ao lado do conteúdo.',
        sourcePath: '$_kPasta/navigation_rail_basico.dart',
        builder: (_) => const NavigationRailBasico(),
      ),
      WidgetExample(
        title: 'Com FAB',
        description: 'leading com um FAB e destinos no meio da barra.',
        sourcePath: '$_kPasta/navigation_rail_fab.dart',
        builder: (_) => const NavigationRailFab(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationDrawer',
    description: 'O menu lateral que abre pelo ☰ ou deslizando da borda.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              height: 76,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: cores.surfaceContainerLow,
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  _bloco(cores.secondaryContainer, 80, 14, raio: 7),
                  _bloco(cores.outline, 56, 6, raio: 3),
                  _bloco(cores.outline, 56, 6, raio: 3),
                ],
              ),
            ),
            _bloco(Colors.black26, 50, 76),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Menu lateral',
        description: 'drawer no Scaffold e o ☰ automático na AppBar.',
        sourcePath: '$_kPasta/navigation_drawer_basico.dart',
        builder: (_) => const NavigationDrawerBasico(),
      ),
      WidgetExample(
        title: 'Abrir pelo código',
        description: 'endDrawer e Scaffold.of(context) dentro de um Builder.',
        sourcePath: '$_kPasta/navigation_drawer_codigo.dart',
        builder: (_) => const NavigationDrawerCodigo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TabBar',
    description: 'Abas no topo para alternar entre conteúdos da mesma tela.',
    preview: const DefaultTabController(
      length: 3,
      child: SizedBox(
        width: 260,
        child: TabBar(
          tabs: [
            Tab(text: 'Chats'),
            Tab(text: 'Status'),
            Tab(text: 'Ligações'),
          ],
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Com TabBarView',
        description: 'Abas na AppBar e conteúdo que troca deslizando.',
        sourcePath: '$_kPasta/tab_bar_view.dart',
        builder: (_) => const TabBarComView(),
      ),
      WidgetExample(
        title: 'Rolável com ícones',
        description: 'isScrollable para muitas abas, com ícone e texto.',
        sourcePath: '$_kPasta/tab_bar_rolavel.dart',
        builder: (_) => const TabBarRolavel(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'BottomAppBar',
    description: 'Uma barra de ações embaixo da tela, com espaço para o FAB.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Container(
          width: 200,
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: cores.surfaceContainerHighest,
          child: Row(
            spacing: 16,
            children: [
              const Icon(Icons.check_box_outlined, size: 20),
              const Icon(Icons.brush_outlined, size: 20),
              const Spacer(),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: cores.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add, size: 20, color: cores.onPrimaryContainer),
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'FAB dentro da barra',
        description: 'floatingActionButtonLocation.endContained.',
        sourcePath: '$_kPasta/bottom_app_bar_fab.dart',
        builder: (_) => const BottomAppBarFab(),
      ),
      WidgetExample(
        title: 'FAB encaixado no meio',
        description: 'centerDocked com o recorte CircularNotchedRectangle.',
        sourcePath: '$_kPasta/bottom_app_bar_entalhe.dart',
        builder: (_) => const BottomAppBarEntalhe(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Navigator',
    description: 'Troca de tela: abre uma nova por cima e volta para a anterior.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            _telinha(cores),
            const Icon(Icons.arrow_forward, size: 20),
            _telinha(cores, comVoltar: true),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'push e pop',
        description: 'Abre uma tela nova e volta para esta.',
        sourcePath: '$_kPasta/navigator_push_pop.dart',
        builder: (_) => const NavigatorPushPop(),
      ),
      WidgetExample(
        title: 'Recebendo um valor',
        description: 'A outra tela devolve a escolha no pop.',
        sourcePath: '$_kPasta/navigator_resultado.dart',
        builder: (_) => const NavigatorResultado(),
      ),
    ],
  ),
];
