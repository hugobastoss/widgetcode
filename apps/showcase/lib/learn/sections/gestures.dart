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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/gestures';

final kGesturesDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'GestureDetector',
    description: const Tr(
      pt: 'Detecta toques, toques longos e arrastos em qualquer widget.',
      en: 'Detects taps, long presses and drags on any widget.',
      es: 'Detecta toques, pulsaciones largas y arrastres en cualquier widget.',
    ),
    preview: const Icon(Icons.touch_app_outlined, size: 44),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Tipos de toque', en: 'Kinds of tap', es: 'Tipos de toque'),
        description: const Tr(
          pt: 'onTap, onDoubleTap e onLongPress na mesma caixa.',
          en: 'onTap, onDoubleTap and onLongPress on the same box.',
          es: 'onTap, onDoubleTap y onLongPress en la misma caja.',
        ),
        sourcePath: '$_kPasta/gesture_detector_toques.dart',
        builder: (_) => const GestureDetectorToques(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Arrastar', en: 'Dragging', es: 'Arrastrar'),
        description: const Tr(
          pt: 'onHorizontalDragUpdate move a bolinha pela trilha.',
          en: 'onHorizontalDragUpdate moves the ball along the track.',
          es: 'onHorizontalDragUpdate mueve la bolita por el riel.',
        ),
        sourcePath: '$_kPasta/gesture_detector_arrastar.dart',
        builder: (_) => const GestureDetectorArrastar(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Área de toque', en: 'Hit area', es: 'Área de toque'),
        description: const Tr(
          pt: 'Toque no espaço vazio de cada caixa: só a da direita conta.',
          en: 'Tap the empty space in each box: only the right one counts.',
          es: 'Toca el espacio vacío de cada caja: solo cuenta la de la derecha.',
        ),
        sourcePath: '$_kPasta/gesture_detector_area.dart',
        builder: (_) => const GestureDetectorArea(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'InkWell',
    description: const Tr(
      pt: 'Deixa algo tocável com o efeito de onda do Material.',
      en: 'Makes something tappable with the Material ripple effect.',
      es: 'Hace que algo se pueda tocar con el efecto de onda de Material.',
    ),
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
        title: const Tr(pt: 'Básico', en: 'Basic', es: 'Básico'),
        description: const Tr(
          pt: 'onTap com a onda respeitando os cantos.',
          en: 'onTap with the ripple respecting the corners.',
          es: 'onTap con la onda respetando las esquinas.',
        ),
        sourcePath: '$_kPasta/ink_well_basico.dart',
        builder: (_) => const InkWellBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Fundo colorido: use Ink',
          en: 'Colored background: use Ink',
          es: 'Fondo de color: usa Ink',
        ),
        description: const Tr(
          pt: 'Com Container a onda some; com Ink ela aparece.',
          en: 'With Container the ripple disappears; with Ink it shows.',
          es: 'Con Container la onda desaparece; con Ink se ve.',
        ),
        sourcePath: '$_kPasta/ink_well_ink.dart',
        builder: (_) => const InkWellInk(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Onda redonda', en: 'Round ripple', es: 'Onda redonda'),
        description: const Tr(
          pt: 'customBorder e splashColor num ícone.',
          en: 'customBorder and splashColor on an icon.',
          es: 'customBorder y splashColor en un ícono.',
        ),
        sourcePath: '$_kPasta/ink_well_redondo.dart',
        builder: (_) => const InkWellRedondo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Dismissible',
    description: const Tr(
      pt: 'Arraste um item para o lado para apagá-lo.',
      en: 'Swipe an item sideways to delete it.',
      es: 'Desliza un elemento hacia el lado para borrarlo.',
    ),
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
        title: const Tr(
          pt: 'Arrastar para apagar',
          en: 'Swipe to delete',
          es: 'Deslizar para borrar',
        ),
        description: const Tr(
          pt: 'key única, fundo vermelho e onDismissed.',
          en: 'A unique key, a red background and onDismissed.',
          es: 'key única, fondo rojo y onDismissed.',
        ),
        sourcePath: '$_kPasta/dismissible_apagar.dart',
        builder: (_) => const DismissibleApagar(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Confirmar antes', en: 'Confirm first', es: 'Confirmar antes'),
        description: const Tr(
          pt: 'confirmDismiss pergunta antes de apagar.',
          en: 'confirmDismiss asks before deleting.',
          es: 'confirmDismiss pregunta antes de borrar.',
        ),
        sourcePath: '$_kPasta/dismissible_confirmar.dart',
        builder: (_) => const DismissibleConfirmar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Draggable',
    description: const Tr(
      pt: 'Arrasta um widget e solta num DragTarget.',
      en: 'Drag a widget and drop it on a DragTarget.',
      es: 'Arrastra un widget y suéltalo en un DragTarget.',
    ),
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
        title: const Tr(
          pt: 'Arrastar e soltar',
          en: 'Drag and drop',
          es: 'Arrastrar y soltar',
        ),
        description: const Tr(
          pt: 'Draggable com data e um DragTarget que recebe a cor.',
          en: 'Draggable with data and a DragTarget that receives the color.',
          es: 'Draggable con data y un DragTarget que recibe el color.',
        ),
        sourcePath: '$_kPasta/draggable_soltar.dart',
        builder: (_) => const DraggableSoltar(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Segurar para arrastar',
          en: 'Hold to drag',
          es: 'Mantener para arrastrar',
        ),
        description: const Tr(
          pt: 'LongPressDraggable: não atrapalha a rolagem da página.',
          en: "LongPressDraggable: it doesn't get in the way of page scrolling.",
          es: 'LongPressDraggable: no interfiere con el scroll de la página.',
        ),
        sourcePath: '$_kPasta/draggable_segurar.dart',
        builder: (_) => const DraggableSegurar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'InteractiveViewer',
    description: const Tr(
      pt: 'Zoom com dois dedos e arrasto, como numa foto ou mapa.',
      en: 'Two-finger zoom and panning, like on a photo or a map.',
      es: 'Zoom con dos dedos y arrastre, como en una foto o un mapa.',
    ),
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
        title: const Tr(
          pt: 'Zoom numa imagem',
          en: 'Zooming an image',
          es: 'Zoom en una imagen',
        ),
        description: const Tr(
          pt: 'minScale e maxScale limitam o zoom.',
          en: 'minScale and maxScale limit the zoom.',
          es: 'minScale y maxScale limitan el zoom.',
        ),
        sourcePath: '$_kPasta/interactive_viewer_zoom.dart',
        builder: (_) => const InteractiveViewerZoom(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Voltar ao normal', en: 'Reset', es: 'Restablecer'),
        description: const Tr(
          pt: 'TransformationController desfaz o zoom pelo código.',
          en: 'TransformationController undoes the zoom from code.',
          es: 'TransformationController deshace el zoom desde el código.',
        ),
        sourcePath: '$_kPasta/interactive_viewer_reset.dart',
        builder: (_) => const InteractiveViewerReset(),
      ),
    ],
  ),
];
