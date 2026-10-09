import 'package:flutter/material.dart';

import '../examples/feedback/alert_dialog_basico.dart';
import '../examples/feedback/alert_dialog_icone.dart';
import '../examples/feedback/alert_dialog_opcoes.dart';
import '../examples/feedback/alert_dialog_resultado.dart';
import '../examples/feedback/bottom_sheet_arrastavel.dart';
import '../examples/feedback/bottom_sheet_basico.dart';
import '../examples/feedback/bottom_sheet_teclado.dart';
import '../examples/feedback/circular_determinado.dart';
import '../examples/feedback/circular_indeterminado.dart';
import '../examples/feedback/linear_etapas.dart';
import '../examples/feedback/linear_indeterminado.dart';
import '../examples/feedback/material_banner_acoes.dart';
import '../examples/feedback/material_banner_basico.dart';
import '../examples/feedback/snack_bar_basico.dart';
import '../examples/feedback/snack_bar_desfazer.dart';
import '../examples/feedback/snack_bar_flutuante.dart';
import '../examples/feedback/tooltip_basico.dart';
import '../examples/feedback/tooltip_personalizado.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/feedback';

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
    description: 'Uma janela por cima da tela que pede atenção ou confirmação.',
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
        title: 'Básico',
        description: 'showDialog com título, texto e um botão OK.',
        sourcePath: '$_kPasta/alert_dialog_basico.dart',
        builder: (_) => const AlertDialogBasico(),
      ),
      WidgetExample(
        title: 'Confirmação com resposta',
        description: 'O valor do pop volta no await do showDialog.',
        sourcePath: '$_kPasta/alert_dialog_resultado.dart',
        builder: (_) => const AlertDialogResultado(),
      ),
      WidgetExample(
        title: 'Com ícone e ação perigosa',
        description: 'icon no topo e o botão de excluir em destaque.',
        sourcePath: '$_kPasta/alert_dialog_icone.dart',
        builder: (_) => const AlertDialogIcone(),
      ),
      WidgetExample(
        title: 'Escolher uma opção',
        description: 'SimpleDialog: cada opção fecha e devolve seu valor.',
        sourcePath: '$_kPasta/alert_dialog_opcoes.dart',
        builder: (_) => const AlertDialogOpcoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SnackBar',
    description: 'Um aviso rápido na parte de baixo da tela, que some sozinho.',
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
        title: 'Básico',
        description: 'ScaffoldMessenger.showSnackBar com uma mensagem.',
        sourcePath: '$_kPasta/snack_bar_basico.dart',
        builder: (_) => const SnackBarBasico(),
      ),
      WidgetExample(
        title: 'Com Desfazer',
        description: 'SnackBarAction: um botão dentro do aviso.',
        sourcePath: '$_kPasta/snack_bar_desfazer.dart',
        builder: (_) => const SnackBarDesfazer(),
      ),
      WidgetExample(
        title: 'Flutuante',
        description: 'Solta das bordas, com X para fechar e duração maior.',
        sourcePath: '$_kPasta/snack_bar_flutuante.dart',
        builder: (_) => const SnackBarFlutuante(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'BottomSheet',
    description: 'Um painel que sobe da parte de baixo da tela.',
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
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
        title: 'Menu de opções',
        description: 'showModalBottomSheet com uma lista de ações.',
        sourcePath: '$_kPasta/bottom_sheet_basico.dart',
        builder: (_) => const BottomSheetBasico(),
      ),
      WidgetExample(
        title: 'Arrastável',
        description: 'DraggableScrollableSheet: arraste o painel e role a lista.',
        sourcePath: '$_kPasta/bottom_sheet_arrastavel.dart',
        builder: (_) => const BottomSheetArrastavel(),
      ),
      WidgetExample(
        title: 'Com campo de texto',
        description: 'viewInsets faz o painel subir junto com o teclado.',
        sourcePath: '$_kPasta/bottom_sheet_teclado.dart',
        builder: (_) => const BottomSheetTeclado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Tooltip',
    description: 'Uma dica curta que aparece ao tocar e segurar.',
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
        title: 'Básico',
        description: 'Toque e segure o ícone para ver a dica.',
        sourcePath: '$_kPasta/tooltip_basico.dart',
        builder: (_) => const TooltipBasico(),
      ),
      WidgetExample(
        title: 'Personalizado',
        description: 'Abre com um toque, em cima do ícone, com outras cores.',
        sourcePath: '$_kPasta/tooltip_personalizado.dart',
        builder: (_) => const TooltipPersonalizado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'MaterialBanner',
    description: 'Um aviso importante que fica até a pessoa tomar uma ação.',
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
        title: 'Básico',
        description: 'Ícone, mensagem e uma ação para fechar.',
        sourcePath: '$_kPasta/material_banner_basico.dart',
        builder: (_) => const MaterialBannerBasico(),
      ),
      WidgetExample(
        title: 'Com duas ações',
        description: 'Cores do tema e ações embaixo do texto.',
        sourcePath: '$_kPasta/material_banner_acoes.dart',
        builder: (_) => const MaterialBannerAcoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CircularProgressIndicator',
    description: 'O círculo de "carregando", girando ou mostrando o progresso.',
    preview: const CircularProgressIndicator(value: 0.65),
    examples: [
      WidgetExample(
        title: 'Girando',
        description: 'Sem value: carregando sem saber quanto falta.',
        sourcePath: '$_kPasta/circular_indeterminado.dart',
        builder: (_) => const CircularIndeterminado(),
      ),
      WidgetExample(
        title: 'Com progresso',
        description: 'value de 0 a 1 mostra quanto já foi feito.',
        sourcePath: '$_kPasta/circular_determinado.dart',
        builder: (_) => const CircularDeterminado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'LinearProgressIndicator',
    description: 'A barra de progresso horizontal.',
    preview: const SizedBox(
      width: 200,
      child: LinearProgressIndicator(value: 0.65),
    ),
    examples: [
      WidgetExample(
        title: 'Correndo',
        description: 'Sem value: a barra corre sem parar.',
        sourcePath: '$_kPasta/linear_indeterminado.dart',
        builder: (_) => const LinearIndeterminado(),
      ),
      WidgetExample(
        title: 'Etapas',
        description: 'Progresso de um passo a passo, com altura e cantos.',
        sourcePath: '$_kPasta/linear_etapas.dart',
        builder: (_) => const LinearEtapas(),
      ),
    ],
  ),
];
