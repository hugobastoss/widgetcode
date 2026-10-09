import 'package:flutter/material.dart';

import 'models.dart';
import 'sections/buttons.dart';
import 'sections/layout.dart';
import 'sections/text_images.dart';

/// As 12 seções da tela inicial, na ordem de exibição. Só as que têm `docs`
/// abrem; as demais mostram "em construção".
final kLearnSections = <LearnSection>[
  LearnSection(
    name: 'Layout',
    icon: Icons.dashboard_outlined,
    plannedWidgets: [for (final doc in kLayoutDocs) doc.name],
    intro:
        'Widgets de layout organizam os outros na tela: lado a lado, empilhados, sobrepostos ou com espaço entre eles.',
    docs: kLayoutDocs,
  ),
  LearnSection(
    name: 'Texto e imagens',
    icon: Icons.text_fields,
    plannedWidgets: [for (final doc in kTextImagesDocs) doc.name],
    intro:
        'Widgets que mostram conteúdo: textos, ícones, imagens e avatares.',
    docs: kTextImagesDocs,
  ),
  LearnSection(
    name: 'Botões',
    icon: Icons.smart_button_outlined,
    plannedWidgets: [for (final doc in kButtonDocs) doc.name],
    intro:
        'Botões disparam uma ação quando tocados. Escolha o tipo pela importância da ação na tela.',
    docs: kButtonDocs,
  ),
  const LearnSection(
    name: 'Formulários',
    icon: Icons.input,
    plannedWidgets: [
      'TextField', 'TextFormField', 'Form', 'SearchBar', 'DropdownMenu', //
      'Autocomplete',
    ],
  ),
  const LearnSection(
    name: 'Seleção',
    icon: Icons.check_box_outlined,
    plannedWidgets: [
      'Checkbox', 'Radio', 'Switch', 'Slider', 'RangeSlider', 'FilterChip', //
      'ChoiceChip',
    ],
  ),
  const LearnSection(
    name: 'Listas e rolagem',
    icon: Icons.list,
    plannedWidgets: [
      'ListView', 'GridView', 'ListTile', 'SingleChildScrollView', //
      'PageView', 'CustomScrollView', 'RefreshIndicator', 'DataTable',
    ],
  ),
  const LearnSection(
    name: 'Navegação',
    icon: Icons.explore_outlined,
    plannedWidgets: [
      'AppBar', 'NavigationBar', 'NavigationRail', 'NavigationDrawer', //
      'TabBar', 'BottomAppBar',
    ],
  ),
  const LearnSection(
    name: 'Diálogos e avisos',
    icon: Icons.chat_bubble_outline,
    plannedWidgets: [
      'AlertDialog', 'SnackBar', 'BottomSheet', 'Tooltip', 'MaterialBanner', //
      'CircularProgressIndicator', 'LinearProgressIndicator',
    ],
  ),
  const LearnSection(
    name: 'Cartões e painéis',
    icon: Icons.style_outlined,
    plannedWidgets: ['Card', 'ExpansionTile', 'ExpansionPanelList'],
  ),
  const LearnSection(
    name: 'Animações',
    icon: Icons.animation,
    plannedWidgets: [
      'AnimatedContainer', 'AnimatedOpacity', 'AnimatedSwitcher', 'Hero', //
      'TweenAnimationBuilder',
    ],
  ),
  const LearnSection(
    name: 'Gestos',
    icon: Icons.touch_app_outlined,
    plannedWidgets: [
      'GestureDetector', 'InkWell', 'Dismissible', 'Draggable', //
      'InteractiveViewer',
    ],
  ),
  const LearnSection(
    name: 'Estilo iOS',
    icon: Icons.phone_iphone,
    plannedWidgets: [
      'CupertinoButton', 'CupertinoSwitch', 'CupertinoNavigationBar', //
      'CupertinoAlertDialog', 'CupertinoPicker', 'CupertinoSlider',
    ],
  ),
];
