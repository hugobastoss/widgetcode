import 'package:flutter/material.dart';

import 'models.dart';
import 'sections/animations.dart';
import 'sections/buttons.dart';
import 'sections/cards.dart';
import 'sections/cupertino.dart';
import 'sections/feedback.dart';
import 'sections/gestures.dart';
import 'sections/forms.dart';
import 'sections/layout.dart';
import 'sections/lists.dart';
import 'sections/navigation.dart';
import 'sections/selection.dart';
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
  LearnSection(
    name: 'Formulários',
    icon: Icons.input,
    plannedWidgets: [for (final doc in kFormsDocs) doc.name],
    intro:
        'Campos para a pessoa digitar e escolher: a base das telas de login, cadastro e busca.',
    docs: kFormsDocs,
  ),
  LearnSection(
    name: 'Seleção',
    icon: Icons.check_box_outlined,
    plannedWidgets: [for (final doc in kSelectionDocs) doc.name],
    intro:
        'Controles para marcar, ligar, escolher e ajustar valores com um toque.',
    docs: kSelectionDocs,
  ),
  LearnSection(
    name: 'Listas e rolagem',
    icon: Icons.list,
    plannedWidgets: [for (final doc in kListsDocs) doc.name],
    intro:
        'Listas, grades e tudo o que rola na tela. Quase todo app tem pelo menos uma.',
    docs: kListsDocs,
  ),
  LearnSection(
    name: 'Navegação',
    icon: Icons.explore_outlined,
    plannedWidgets: [for (final doc in kNavigationDocs) doc.name],
    intro:
        'Como a pessoa anda pelo app: barras, abas, menus e a troca entre telas.',
    docs: kNavigationDocs,
  ),
  LearnSection(
    name: 'Diálogos e avisos',
    icon: Icons.chat_bubble_outline,
    plannedWidgets: [for (final doc in kFeedbackDocs) doc.name],
    intro:
        'Como o app conversa com a pessoa: confirmações, avisos, painéis e indicadores de carregando.',
    docs: kFeedbackDocs,
  ),
  LearnSection(
    name: 'Cartões e painéis',
    icon: Icons.style_outlined,
    plannedWidgets: [for (final doc in kCardsDocs) doc.name],
    intro:
        'Superfícies que agrupam conteúdo e painéis que abrem e fecham para mostrar mais.',
    docs: kCardsDocs,
  ),
  LearnSection(
    name: 'Animações',
    icon: Icons.animation,
    plannedWidgets: [for (final doc in kAnimationsDocs) doc.name],
    intro:
        'Animações prontas: mude um valor com setState e o Flutter faz a transição.',
    docs: kAnimationsDocs,
  ),
  LearnSection(
    name: 'Gestos',
    icon: Icons.touch_app_outlined,
    plannedWidgets: [for (final doc in kGesturesDocs) doc.name],
    intro:
        'Interações além do botão: toques, arrastos, deslizar para apagar e zoom.',
    docs: kGesturesDocs,
  ),
  LearnSection(
    name: 'Estilo iOS',
    icon: Icons.phone_iphone,
    plannedWidgets: [for (final doc in kCupertinoDocs) doc.name],
    intro:
        'O visual do iPhone: os widgets Cupertino imitam os componentes nativos do iOS.',
    docs: kCupertinoDocs,
  ),
];
