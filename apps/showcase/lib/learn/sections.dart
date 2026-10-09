import 'package:flutter/material.dart';

import 'models.dart';
import 'sections/animations.dart';
import 'sections/buttons.dart';
import 'sections/cards.dart';
import 'sections/cupertino.dart';
import 'sections/feedback.dart';
import 'sections/forms.dart';
import 'sections/gestures.dart';
import 'sections/layout.dart';
import 'sections/lists.dart';
import 'sections/navigation.dart';
import 'sections/selection.dart';
import 'sections/text_images.dart';
import 'tr.dart';

/// As 12 seções da tela inicial, na ordem de exibição. Só as que têm `docs`
/// abrem; as demais mostram "em construção".
final kLearnSections = <LearnSection>[
  LearnSection(
    id: 'layout',
    name: const Tr(pt: 'Layout', en: 'Layout', es: 'Layout'),
    icon: Icons.dashboard_outlined,
    plannedWidgets: [for (final doc in kLayoutDocs) doc.name],
    intro: const Tr(
      pt: 'Widgets de layout organizam os outros na tela: lado a lado, empilhados, sobrepostos ou com espaço entre eles.',
      en: 'Layout widgets arrange the others on screen: side by side, stacked, layered or with space between them.',
      es: 'Los widgets de layout organizan a los demás en la pantalla: uno al lado del otro, apilados, superpuestos o con espacio entre ellos.',
    ),
    docs: kLayoutDocs,
  ),
  LearnSection(
    id: 'text_images',
    name: const Tr(pt: 'Texto e imagens', en: 'Text & images', es: 'Texto e imágenes'),
    icon: Icons.text_fields,
    plannedWidgets: [for (final doc in kTextImagesDocs) doc.name],
    intro: const Tr(
      pt: 'Widgets que mostram conteúdo: textos, ícones, imagens e avatares.',
      en: 'Widgets that show content: text, icons, images and avatars.',
      es: 'Widgets que muestran contenido: textos, íconos, imágenes y avatares.',
    ),
    docs: kTextImagesDocs,
  ),
  LearnSection(
    id: 'buttons',
    name: const Tr(pt: 'Botões', en: 'Buttons', es: 'Botones'),
    icon: Icons.smart_button_outlined,
    plannedWidgets: [for (final doc in kButtonDocs) doc.name],
    intro: const Tr(
      pt: 'Botões disparam uma ação quando tocados. Escolha o tipo pela importância da ação na tela.',
      en: 'Buttons trigger an action when tapped. Pick the type based on how important the action is on the screen.',
      es: 'Los botones ejecutan una acción al tocarlos. Elige el tipo según la importancia de la acción en la pantalla.',
    ),
    docs: kButtonDocs,
  ),
  LearnSection(
    id: 'forms',
    name: const Tr(pt: 'Formulários', en: 'Forms', es: 'Formularios'),
    icon: Icons.input,
    plannedWidgets: [for (final doc in kFormsDocs) doc.name],
    intro: const Tr(
      pt: 'Campos para a pessoa digitar e escolher: a base das telas de login, cadastro e busca.',
      en: 'Fields for typing and choosing: the foundation of login, sign-up and search screens.',
      es: 'Campos para escribir y elegir: la base de las pantallas de inicio de sesión, registro y búsqueda.',
    ),
    docs: kFormsDocs,
  ),
  LearnSection(
    id: 'selection',
    name: const Tr(pt: 'Seleção', en: 'Selection', es: 'Selección'),
    icon: Icons.check_box_outlined,
    plannedWidgets: [for (final doc in kSelectionDocs) doc.name],
    intro: const Tr(
      pt: 'Controles para marcar, ligar, escolher e ajustar valores com um toque.',
      en: 'Controls to check, toggle, choose and adjust values with a tap.',
      es: 'Controles para marcar, activar, elegir y ajustar valores con un toque.',
    ),
    docs: kSelectionDocs,
  ),
  LearnSection(
    id: 'lists',
    name: const Tr(pt: 'Listas e rolagem', en: 'Lists & scrolling', es: 'Listas y scroll'),
    icon: Icons.list,
    plannedWidgets: [for (final doc in kListsDocs) doc.name],
    intro: const Tr(
      pt: 'Listas, grades e tudo o que rola na tela. Quase todo app tem pelo menos uma.',
      en: 'Lists, grids and everything that scrolls. Almost every app has at least one.',
      es: 'Listas, cuadrículas y todo lo que se desplaza en la pantalla. Casi todas las apps tienen al menos una.',
    ),
    docs: kListsDocs,
  ),
  LearnSection(
    id: 'navigation',
    name: const Tr(pt: 'Navegação', en: 'Navigation', es: 'Navegación'),
    icon: Icons.explore_outlined,
    plannedWidgets: [for (final doc in kNavigationDocs) doc.name],
    intro: const Tr(
      pt: 'Como a pessoa anda pelo app: barras, abas, menus e a troca entre telas.',
      en: 'How people move around the app: bars, tabs, menus and switching screens.',
      es: 'Cómo se mueve la persona por la app: barras, pestañas, menús y el cambio entre pantallas.',
    ),
    docs: kNavigationDocs,
  ),
  LearnSection(
    id: 'feedback',
    name: const Tr(pt: 'Diálogos e avisos', en: 'Dialogs & feedback', es: 'Diálogos y avisos'),
    icon: Icons.chat_bubble_outline,
    plannedWidgets: [for (final doc in kFeedbackDocs) doc.name],
    intro: const Tr(
      pt: 'Como o app conversa com a pessoa: confirmações, avisos, painéis e indicadores de carregando.',
      en: 'How the app talks to people: confirmations, alerts, sheets and loading indicators.',
      es: 'Cómo la app se comunica con la persona: confirmaciones, avisos, paneles e indicadores de carga.',
    ),
    docs: kFeedbackDocs,
  ),
  LearnSection(
    id: 'cards',
    name: const Tr(pt: 'Cartões e painéis', en: 'Cards & panels', es: 'Tarjetas y paneles'),
    icon: Icons.style_outlined,
    plannedWidgets: [for (final doc in kCardsDocs) doc.name],
    intro: const Tr(
      pt: 'Superfícies que agrupam conteúdo e painéis que abrem e fecham para mostrar mais.',
      en: 'Surfaces that group content and panels that open and close to show more.',
      es: 'Superficies que agrupan contenido y paneles que se abren y cierran para mostrar más.',
    ),
    docs: kCardsDocs,
  ),
  LearnSection(
    id: 'animations',
    name: const Tr(pt: 'Animações', en: 'Animations', es: 'Animaciones'),
    icon: Icons.animation,
    plannedWidgets: [for (final doc in kAnimationsDocs) doc.name],
    intro: const Tr(
      pt: 'Animações prontas: mude um valor com setState e o Flutter faz a transição.',
      en: 'Ready-made animations: change a value with setState and Flutter handles the transition.',
      es: 'Animaciones listas: cambia un valor con setState y Flutter hace la transición.',
    ),
    docs: kAnimationsDocs,
  ),
  LearnSection(
    id: 'gestures',
    name: const Tr(pt: 'Gestos', en: 'Gestures', es: 'Gestos'),
    icon: Icons.touch_app_outlined,
    plannedWidgets: [for (final doc in kGesturesDocs) doc.name],
    intro: const Tr(
      pt: 'Interações além do botão: toques, arrastos, deslizar para apagar e zoom.',
      en: 'Interactions beyond buttons: taps, drags, swipe to delete and zoom.',
      es: 'Interacciones más allá del botón: toques, arrastres, deslizar para borrar y zoom.',
    ),
    docs: kGesturesDocs,
  ),
  LearnSection(
    id: 'cupertino',
    name: const Tr(pt: 'Estilo iOS', en: 'iOS style', es: 'Estilo iOS'),
    icon: Icons.phone_iphone,
    plannedWidgets: [for (final doc in kCupertinoDocs) doc.name],
    intro: const Tr(
      pt: 'O visual do iPhone: os widgets Cupertino imitam os componentes nativos do iOS.',
      en: 'The iPhone look: Cupertino widgets mimic the native iOS components.',
      es: 'El aspecto del iPhone: los widgets Cupertino imitan los componentes nativos de iOS.',
    ),
    docs: kCupertinoDocs,
  ),
];
