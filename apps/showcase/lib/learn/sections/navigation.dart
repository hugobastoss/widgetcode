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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/navigation';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

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
    description: const Tr(
      pt: 'A barra do topo da tela: título, menu e ações.',
      en: 'The bar at the top of the screen: title, menu and actions.',
      es: 'La barra superior de la pantalla: título, menú y acciones.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Um Scaffold com AppBar e título.',
          en: 'A Scaffold with an AppBar and a title.',
          es: 'Un Scaffold con AppBar y título.',
        ),
        sourcePath: '$_kPasta/app_bar_basico.dart',
        builder: (_) => const AppBarBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'leading e actions',
          en: 'leading and actions',
          es: 'leading y actions',
        ),
        description: const Tr(
          pt: 'Menu à esquerda e botões de ação à direita.',
          en: 'A menu on the left and action buttons on the right.',
          es: 'Menú a la izquierda y botones de acción a la derecha.',
        ),
        sourcePath: '$_kPasta/app_bar_acoes.dart',
        builder: (_) => const AppBarAcoes(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Cores e título no meio',
          en: 'Colors and centered title',
          es: 'Colores y título centrado',
        ),
        description: const Tr(
          pt: 'backgroundColor, foregroundColor e centerTitle.',
          en: 'backgroundColor, foregroundColor and centerTitle.',
          es: 'backgroundColor, foregroundColor y centerTitle.',
        ),
        sourcePath: '$_kPasta/app_bar_cores.dart',
        builder: (_) => const AppBarCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationBar',
    description: const Tr(
      pt: 'A barra de abas embaixo da tela, para trocar de seção.',
      en: 'The tab bar at the bottom of the screen, to switch sections.',
      es: 'La barra de pestañas en la parte inferior, para cambiar de sección.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Três abas que trocam o conteúdo da tela.',
          en: 'Three tabs that switch the screen content.',
          es: 'Tres pestañas que cambian el contenido de la pantalla.',
        ),
        sourcePath: '$_kPasta/navigation_bar_basico.dart',
        builder: (_) => const NavigationBarBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com selos', en: 'With badges', es: 'Con insignias'),
        description: const Tr(
          pt: 'Badge nos ícones e texto só na aba escolhida.',
          en: 'Badges on the icons and a label only on the selected tab.',
          es: 'Badge en los íconos y texto solo en la pestaña elegida.',
        ),
        sourcePath: '$_kPasta/navigation_bar_selos.dart',
        builder: (_) => const NavigationBarSelos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationRail',
    description: const Tr(
      pt: 'A barra de navegação lateral, para tablets e telas largas.',
      en: 'The side navigation bar, for tablets and wide screens.',
      es: 'La barra de navegación lateral, para tablets y pantallas anchas.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Destinos com ícone e texto ao lado do conteúdo.',
          en: 'Destinations with an icon and a label next to the content.',
          es: 'Destinos con ícono y texto al lado del contenido.',
        ),
        sourcePath: '$_kPasta/navigation_rail_basico.dart',
        builder: (_) => const NavigationRailBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com FAB', en: 'With a FAB', es: 'Con FAB'),
        description: const Tr(
          pt: 'leading com um FAB e destinos no meio da barra.',
          en: 'leading with a FAB and destinations in the middle of the bar.',
          es: 'leading con un FAB y destinos en el medio de la barra.',
        ),
        sourcePath: '$_kPasta/navigation_rail_fab.dart',
        builder: (_) => const NavigationRailFab(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'NavigationDrawer',
    description: const Tr(
      pt: 'O menu lateral que abre pelo ☰ ou deslizando da borda.',
      en: 'The side menu that opens from ☰ or by swiping from the edge.',
      es: 'El menú lateral que se abre con ☰ o deslizando desde el borde.',
    ),
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
        title: const Tr(pt: 'Menu lateral', en: 'Side menu', es: 'Menú lateral'),
        description: const Tr(
          pt: 'drawer no Scaffold e o ☰ automático na AppBar.',
          en: 'drawer in the Scaffold and the automatic ☰ in the AppBar.',
          es: 'drawer en el Scaffold y el ☰ automático en la AppBar.',
        ),
        sourcePath: '$_kPasta/navigation_drawer_basico.dart',
        builder: (_) => const NavigationDrawerBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Abrir pelo código',
          en: 'Open from code',
          es: 'Abrir desde el código',
        ),
        description: const Tr(
          pt: 'endDrawer e Scaffold.of(context) dentro de um Builder.',
          en: 'endDrawer and Scaffold.of(context) inside a Builder.',
          es: 'endDrawer y Scaffold.of(context) dentro de un Builder.',
        ),
        sourcePath: '$_kPasta/navigation_drawer_codigo.dart',
        builder: (_) => const NavigationDrawerCodigo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TabBar',
    description: const Tr(
      pt: 'Abas no topo para alternar entre conteúdos da mesma tela.',
      en: 'Tabs at the top to switch between contents of the same screen.',
      es: 'Pestañas arriba para alternar entre contenidos de la misma pantalla.',
    ),
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
        title: const Tr(
          pt: 'Com TabBarView',
          en: 'With TabBarView',
          es: 'Con TabBarView',
        ),
        description: const Tr(
          pt: 'Abas na AppBar e conteúdo que troca deslizando.',
          en: 'Tabs in the AppBar and content you can swipe through.',
          es: 'Pestañas en la AppBar y contenido que cambia deslizando.',
        ),
        sourcePath: '$_kPasta/tab_bar_view.dart',
        builder: (_) => const TabBarComView(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Rolável com ícones',
          en: 'Scrollable with icons',
          es: 'Desplazable con íconos',
        ),
        description: const Tr(
          pt: 'isScrollable para muitas abas, com ícone e texto.',
          en: 'isScrollable for many tabs, with an icon and a label.',
          es: 'isScrollable para muchas pestañas, con ícono y texto.',
        ),
        sourcePath: '$_kPasta/tab_bar_rolavel.dart',
        builder: (_) => const TabBarRolavel(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'BottomAppBar',
    description: const Tr(
      pt: 'Uma barra de ações embaixo da tela, com espaço para o FAB.',
      en: 'An action bar at the bottom of the screen, with room for the FAB.',
      es: 'Una barra de acciones en la parte inferior, con espacio para el FAB.',
    ),
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
        title: const Tr(
          pt: 'FAB dentro da barra',
          en: 'FAB inside the bar',
          es: 'FAB dentro de la barra',
        ),
        description: const Tr(
          pt: 'floatingActionButtonLocation.endContained.',
          en: 'floatingActionButtonLocation.endContained.',
          es: 'floatingActionButtonLocation.endContained.',
        ),
        sourcePath: '$_kPasta/bottom_app_bar_fab.dart',
        builder: (_) => const BottomAppBarFab(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'FAB encaixado no meio',
          en: 'FAB docked in the middle',
          es: 'FAB encajado en el medio',
        ),
        description: const Tr(
          pt: 'centerDocked com o recorte CircularNotchedRectangle.',
          en: 'centerDocked with the CircularNotchedRectangle notch.',
          es: 'centerDocked con el recorte CircularNotchedRectangle.',
        ),
        sourcePath: '$_kPasta/bottom_app_bar_entalhe.dart',
        builder: (_) => const BottomAppBarEntalhe(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Navigator',
    description: const Tr(
      pt: 'Troca de tela: abre uma nova por cima e volta para a anterior.',
      en: 'Switching screens: opens a new one on top and goes back to the previous one.',
      es: 'Cambio de pantalla: abre una nueva encima y vuelve a la anterior.',
    ),
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
        title: const Tr(pt: 'push e pop', en: 'push and pop', es: 'push y pop'),
        description: const Tr(
          pt: 'Abre uma tela nova e volta para esta.',
          en: 'Opens a new screen and comes back to this one.',
          es: 'Abre una pantalla nueva y vuelve a esta.',
        ),
        sourcePath: '$_kPasta/navigator_push_pop.dart',
        builder: (_) => const NavigatorPushPop(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Recebendo um valor',
          en: 'Receiving a value',
          es: 'Recibiendo un valor',
        ),
        description: const Tr(
          pt: 'A outra tela devolve a escolha no pop.',
          en: 'The other screen returns the choice in pop.',
          es: 'La otra pantalla devuelve la elección en el pop.',
        ),
        sourcePath: '$_kPasta/navigator_resultado.dart',
        builder: (_) => const NavigatorResultado(),
      ),
    ],
  ),
];
