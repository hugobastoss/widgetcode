import 'package:flutter/material.dart';

import '../../feedback/alert_dialog_basico.dart';
import '../../feedback/alert_dialog_icone.dart';
import '../../feedback/alert_dialog_opcoes.dart';
import '../../feedback/alert_dialog_resultado.dart';
import '../../feedback/bottom_sheet_arrastavel.dart';
import '../../feedback/bottom_sheet_basico.dart';
import '../../feedback/bottom_sheet_teclado.dart';
import '../../feedback/circular_determinado.dart';
import '../../feedback/circular_indeterminado.dart';
import '../../feedback/linear_etapas.dart';
import '../../feedback/linear_indeterminado.dart';
import '../../feedback/material_banner_acoes.dart';
import '../../feedback/material_banner_basico.dart';
import '../../feedback/snack_bar_basico.dart';
import '../../feedback/snack_bar_desfazer.dart';
import '../../feedback/snack_bar_flutuante.dart';
import '../../feedback/tooltip_basico.dart';
import '../../feedback/tooltip_personalizado.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/feedback';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

// Pré-visualizações: esquemas desenhados com as cores do tema, já que
// diálogos e avisos de verdade abrem por cima da tela.

Widget _barra(Color cor, double largura, {double altura = 8}) => Container(
  width: largura,
  height: altura,
  decoration: BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.circular(altura / 2),
  ),
);

final kFeedbackDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'AlertDialog',
    description: const Tr(
      pt: 'Uma janela por cima da tela que pede atenção ou confirmação.',
      en: 'A window over the screen that asks for attention or confirmation.',
      es: 'Una ventana sobre la pantalla que pide atención o confirmación.',
    ),
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Container(
          width: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: cores.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              _barra(cores.onSurface, 70, altura: 10),
              _barra(cores.outline, 120, altura: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  _barra(cores.primary, 30, altura: 6),
                  _barra(cores.primary, 30, altura: 6),
                ],
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'showDialog com título, texto e um botão OK.',
          en: 'showDialog with a title, text and an OK button.',
          es: 'showDialog con título, texto y un botón OK.',
        ),
        sourcePath: '$_kPasta/alert_dialog_basico.dart',
        builder: (_) => const AlertDialogBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Confirmação com resposta',
          en: 'Confirmation with an answer',
          es: 'Confirmación con respuesta',
        ),
        description: const Tr(
          pt: 'O valor do pop volta no await do showDialog.',
          en: 'The value passed to pop comes back from the awaited showDialog.',
          es: 'El valor del pop vuelve en el await del showDialog.',
        ),
        sourcePath: '$_kPasta/alert_dialog_resultado.dart',
        builder: (_) => const AlertDialogResultado(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com ícone e ação perigosa',
          en: 'Icon and dangerous action',
          es: 'Ícono y acción peligrosa',
        ),
        description: const Tr(
          pt: 'icon no topo e o botão de excluir em destaque.',
          en: 'icon at the top and the delete button highlighted.',
          es: 'icon arriba y el botón de borrar destacado.',
        ),
        sourcePath: '$_kPasta/alert_dialog_icone.dart',
        builder: (_) => const AlertDialogIcone(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Escolher uma opção',
          en: 'Choose an option',
          es: 'Elegir una opción',
        ),
        description: const Tr(
          pt: 'SimpleDialog: cada opção fecha e devolve seu valor.',
          en: 'SimpleDialog: each option closes it and returns its value.',
          es: 'SimpleDialog: cada opción lo cierra y devuelve su valor.',
        ),
        sourcePath: '$_kPasta/alert_dialog_opcoes.dart',
        builder: (_) => const AlertDialogOpcoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SnackBar',
    description: const Tr(
      pt: 'Um aviso rápido na parte de baixo da tela, que some sozinho.',
      en: 'A quick message at the bottom of the screen that goes away on its own.',
      es: 'Un aviso rápido en la parte inferior de la pantalla, que desaparece solo.',
    ),
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Container(
          width: 220,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: cores.inverseSurface,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Enviada',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: cores.onInverseSurface, fontSize: 12),
                ),
              ),
              Text(
                'Desfazer',
                style: TextStyle(color: cores.inversePrimary, fontSize: 12),
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'ScaffoldMessenger.showSnackBar com uma mensagem.',
          en: 'ScaffoldMessenger.showSnackBar with a message.',
          es: 'ScaffoldMessenger.showSnackBar con un mensaje.',
        ),
        sourcePath: '$_kPasta/snack_bar_basico.dart',
        builder: (_) => const SnackBarBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com Desfazer',
          en: 'With Undo',
          es: 'Con Deshacer',
        ),
        description: const Tr(
          pt: 'SnackBarAction: um botão dentro do aviso.',
          en: 'SnackBarAction: a button inside the message.',
          es: 'SnackBarAction: un botón dentro del aviso.',
        ),
        sourcePath: '$_kPasta/snack_bar_desfazer.dart',
        builder: (_) => const SnackBarDesfazer(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Flutuante', en: 'Floating', es: 'Flotante'),
        description: const Tr(
          pt: 'Solta das bordas, com X para fechar e duração maior.',
          en: 'Detached from the edges, with an X to close and a longer duration.',
          es: 'Separada de los bordes, con X para cerrar y mayor duración.',
        ),
        sourcePath: '$_kPasta/snack_bar_flutuante.dart',
        builder: (_) => const SnackBarFlutuante(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'BottomSheet',
    description: const Tr(
      pt: 'Um painel que sobe da parte de baixo da tela.',
      en: 'A panel that slides up from the bottom of the screen.',
      es: 'Un panel que sube desde la parte inferior de la pantalla.',
    ),
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Container(
          width: 110,
          height: 76,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: cores.outline),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: cores.surfaceContainerHighest,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(top: 6),
            alignment: Alignment.topCenter,
            child: _barra(cores.outline, 24, altura: 4),
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Menu de opções',
          en: 'Options menu',
          es: 'Menú de opciones',
        ),
        description: const Tr(
          pt: 'showModalBottomSheet com uma lista de ações.',
          en: 'showModalBottomSheet with a list of actions.',
          es: 'showModalBottomSheet con una lista de acciones.',
        ),
        sourcePath: '$_kPasta/bottom_sheet_basico.dart',
        builder: (_) => const BottomSheetBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Arrastável', en: 'Draggable', es: 'Arrastrable'),
        description: const Tr(
          pt: 'DraggableScrollableSheet: arraste o painel e role a lista.',
          en: 'DraggableScrollableSheet: drag the panel and scroll the list.',
          es: 'DraggableScrollableSheet: arrastra el panel y desplaza la lista.',
        ),
        sourcePath: '$_kPasta/bottom_sheet_arrastavel.dart',
        builder: (_) => const BottomSheetArrastavel(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com campo de texto',
          en: 'With a text field',
          es: 'Con campo de texto',
        ),
        description: const Tr(
          pt: 'viewInsets faz o painel subir junto com o teclado.',
          en: 'viewInsets makes the panel rise along with the keyboard.',
          es: 'viewInsets hace que el panel suba junto con el teclado.',
        ),
        sourcePath: '$_kPasta/bottom_sheet_teclado.dart',
        builder: (_) => const BottomSheetTeclado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Tooltip',
    description: const Tr(
      pt: 'Uma dica curta que aparece ao tocar e segurar.',
      en: 'A short hint that appears on touch and hold.',
      es: 'Una pista corta que aparece al mantener pulsado.',
    ),
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: cores.inverseSurface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Favoritar',
                style: TextStyle(color: cores.onInverseSurface, fontSize: 12),
              ),
            ),
            const Icon(Icons.favorite_border, size: 28),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Toque e segure o ícone para ver a dica.',
          en: 'Touch and hold the icon to see the hint.',
          es: 'Mantén pulsado el ícono para ver la pista.',
        ),
        sourcePath: '$_kPasta/tooltip_basico.dart',
        builder: (_) => const TooltipBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Personalizado',
          en: 'Customized',
          es: 'Personalizado',
        ),
        description: const Tr(
          pt: 'Abre com um toque, em cima do ícone, com outras cores.',
          en: 'Opens with a single tap, above the icon, in other colors.',
          es: 'Se abre con un toque, encima del ícono, con otros colores.',
        ),
        sourcePath: '$_kPasta/tooltip_personalizado.dart',
        builder: (_) => const TooltipPersonalizado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'MaterialBanner',
    description: const Tr(
      pt: 'Um aviso importante que fica até a pessoa tomar uma ação.',
      en: 'An important message that stays until the person acts on it.',
      es: 'Un aviso importante que se queda hasta que la persona actúa.',
    ),
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        final estilo = TextStyle(fontSize: 12, color: cores.onSurface);
        return Container(
          width: 240,
          padding: const EdgeInsets.all(10),
          color: cores.surfaceContainerLow,
          child: Row(
            spacing: 8,
            children: [
              const Icon(Icons.wifi_off, size: 20),
              Expanded(
                child: Text(
                  'Sem internet',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: estilo,
                ),
              ),
              Text('Fechar', style: estilo.copyWith(color: cores.primary)),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Ícone, mensagem e uma ação para fechar.',
          en: 'Icon, message and an action to dismiss it.',
          es: 'Ícono, mensaje y una acción para cerrar.',
        ),
        sourcePath: '$_kPasta/material_banner_basico.dart',
        builder: (_) => const MaterialBannerBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com duas ações',
          en: 'With two actions',
          es: 'Con dos acciones',
        ),
        description: const Tr(
          pt: 'Cores do tema e ações embaixo do texto.',
          en: 'Theme colors and actions below the text.',
          es: 'Colores del tema y acciones debajo del texto.',
        ),
        sourcePath: '$_kPasta/material_banner_acoes.dart',
        builder: (_) => const MaterialBannerAcoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CircularProgressIndicator',
    description: const Tr(
      pt: 'O círculo de "carregando", girando ou mostrando o progresso.',
      en: 'The "loading" circle, spinning or showing progress.',
      es: 'El círculo de "cargando", girando o mostrando el progreso.',
    ),
    preview: const CircularProgressIndicator(value: 0.65),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Girando', en: 'Spinning', es: 'Girando'),
        description: const Tr(
          pt: 'Sem value: carregando sem saber quanto falta.',
          en: 'No value: loading without knowing how much is left.',
          es: 'Sin value: cargando sin saber cuánto falta.',
        ),
        sourcePath: '$_kPasta/circular_indeterminado.dart',
        builder: (_) => const CircularIndeterminado(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com progresso',
          en: 'With progress',
          es: 'Con progreso',
        ),
        description: const Tr(
          pt: 'value de 0 a 1 mostra quanto já foi feito.',
          en: 'value from 0 to 1 shows how much is done.',
          es: 'value de 0 a 1 muestra cuánto se ha hecho.',
        ),
        sourcePath: '$_kPasta/circular_determinado.dart',
        builder: (_) => const CircularDeterminado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'LinearProgressIndicator',
    description: const Tr(
      pt: 'A barra de progresso horizontal.',
      en: 'The horizontal progress bar.',
      es: 'La barra de progreso horizontal.',
    ),
    preview: const SizedBox(
      width: 200,
      child: LinearProgressIndicator(value: 0.65),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Correndo', en: 'Running', es: 'En marcha'),
        description: const Tr(
          pt: 'Sem value: a barra corre sem parar.',
          en: 'No value: the bar keeps running.',
          es: 'Sin value: la barra se mueve sin parar.',
        ),
        sourcePath: '$_kPasta/linear_indeterminado.dart',
        builder: (_) => const LinearIndeterminado(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Etapas', en: 'Steps', es: 'Etapas'),
        description: const Tr(
          pt: 'Progresso de um passo a passo, com altura e cantos.',
          en: 'Progress through a step-by-step flow, with height and corners.',
          es: 'Progreso de un paso a paso, con altura y esquinas.',
        ),
        sourcePath: '$_kPasta/linear_etapas.dart',
        builder: (_) => const LinearEtapas(),
      ),
    ],
  ),
];
