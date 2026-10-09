import 'package:flutter/material.dart';

import '../examples/gestures/dismissible_apagar.dart';
import '../examples/gestures/dismissible_confirmar.dart';
import '../examples/gestures/draggable_segurar.dart';
import '../examples/gestures/draggable_soltar.dart';
import '../examples/gestures/gesture_detector_area.dart';
import '../examples/gestures/gesture_detector_arrastar.dart';
import '../examples/gestures/gesture_detector_toques.dart';
import '../examples/gestures/ink_well_basico.dart';
import '../examples/gestures/ink_well_ink.dart';
import '../examples/gestures/ink_well_redondo.dart';
import '../examples/gestures/interactive_viewer_reset.dart';
import '../examples/gestures/interactive_viewer_zoom.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/gestures';

final kGesturesDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'GestureDetector',
    description: 'Detecta toques, toques longos e arrastos em qualquer widget.',
    preview: const Icon(Icons.touch_app_outlined, size: 44),
    examples: [
      WidgetExample(
        title: 'Tipos de toque',
        description: 'onTap, onDoubleTap e onLongPress na mesma caixa.',
        sourcePath: '$_kPasta/gesture_detector_toques.dart',
        builder: (_) => const GestureDetectorToques(),
      ),
      WidgetExample(
        title: 'Arrastar',
        description: 'onHorizontalDragUpdate move a bolinha pela trilha.',
        sourcePath: '$_kPasta/gesture_detector_arrastar.dart',
        builder: (_) => const GestureDetectorArrastar(),
      ),
      WidgetExample(
        title: 'Área de toque',
        description: 'Toque no espaço vazio de cada caixa: só a da direita conta.',
        sourcePath: '$_kPasta/gesture_detector_area.dart',
        builder: (_) => const GestureDetectorArea(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'InkWell',
    description: 'Deixa algo tocável com o efeito de onda do Material.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 44,
              decoration: BoxDecoration(
                color: cores.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: cores.onPrimaryContainer.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
            ),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'onTap com a onda respeitando os cantos.',
        sourcePath: '$_kPasta/ink_well_basico.dart',
        builder: (_) => const InkWellBasico(),
      ),
      WidgetExample(
        title: 'Fundo colorido: use Ink',
        description: 'Com Container a onda some; com Ink ela aparece.',
        sourcePath: '$_kPasta/ink_well_ink.dart',
        builder: (_) => const InkWellInk(),
      ),
      WidgetExample(
        title: 'Onda redonda',
        description: 'customBorder e splashColor num ícone.',
        sourcePath: '$_kPasta/ink_well_redondo.dart',
        builder: (_) => const InkWellRedondo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Dismissible',
    description: 'Arraste um item para o lado para apagá-lo.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 44,
              color: Colors.red.shade700,
              child: const Icon(Icons.delete_outline, color: Colors.white),
            ),
            Container(
              width: 140,
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: cores.surfaceContainerHighest,
              child: const Row(
                children: [Icon(Icons.mail_outline, size: 20)],
              ),
            ),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Arrastar para apagar',
        description: 'key única, fundo vermelho e onDismissed.',
        sourcePath: '$_kPasta/dismissible_apagar.dart',
        builder: (_) => const DismissibleApagar(),
      ),
      WidgetExample(
        title: 'Confirmar antes',
        description: 'confirmDismiss pergunta antes de apagar.',
        sourcePath: '$_kPasta/dismissible_confirmar.dart',
        builder: (_) => const DismissibleConfirmar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Draggable',
    description: 'Arrasta um widget e solta num DragTarget.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const Icon(Icons.arrow_forward, size: 18),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(color: cores.outline, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Arrastar e soltar',
        description: 'Draggable com data e um DragTarget que recebe a cor.',
        sourcePath: '$_kPasta/draggable_soltar.dart',
        builder: (_) => const DraggableSoltar(),
      ),
      WidgetExample(
        title: 'Segurar para arrastar',
        description: 'LongPressDraggable: não atrapalha a rolagem da página.',
        sourcePath: '$_kPasta/draggable_segurar.dart',
        builder: (_) => const DraggableSegurar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'InteractiveViewer',
    description: 'Zoom com dois dedos e arrasto, como numa foto ou mapa.',
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 120,
        height: 72,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Transform.scale(
              scale: 1.6,
              child: Image.asset('assets/images/paisagem.png', fit: BoxFit.cover),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.zoom_in, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Zoom numa imagem',
        description: 'minScale e maxScale limitam o zoom.',
        sourcePath: '$_kPasta/interactive_viewer_zoom.dart',
        builder: (_) => const InteractiveViewerZoom(),
      ),
      WidgetExample(
        title: 'Voltar ao normal',
        description: 'TransformationController desfaz o zoom pelo código.',
        sourcePath: '$_kPasta/interactive_viewer_reset.dart',
        builder: (_) => const InteractiveViewerReset(),
      ),
    ],
  ),
];
