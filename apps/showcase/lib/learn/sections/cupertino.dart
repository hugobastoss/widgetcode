import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../examples/cupertino/cupertino_action_sheet.dart';
import '../examples/cupertino/cupertino_alert_basico.dart';
import '../examples/cupertino/cupertino_alert_destrutivo.dart';
import '../examples/cupertino/cupertino_button_estilos.dart';
import '../examples/cupertino/cupertino_button_icone.dart';
import '../examples/cupertino/cupertino_date_picker.dart';
import '../examples/cupertino/cupertino_nav_bar_basico.dart';
import '../examples/cupertino/cupertino_nav_bar_titulo_grande.dart';
import '../examples/cupertino/cupertino_picker_lista.dart';
import '../examples/cupertino/cupertino_slider_basico.dart';
import '../examples/cupertino/cupertino_switch_basico.dart';
import '../examples/cupertino/widgets_adaptativos.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/cupertino';

// As pré-visualizações dos cartões não recebem toques; os controles só
// precisam de um callback não nulo para aparecer habilitados.
void _semAcao() {}
void _semAcaoValor(Object? _) {}

final kCupertinoDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'CupertinoButton',
    description: 'O botão no estilo iOS: só texto, tinted ou preenchido.',
    preview: const CupertinoButton.filled(
      onPressed: _semAcao,
      child: Text('Continuar'),
    ),
    examples: [
      WidgetExample(
        title: 'Três estilos',
        description: 'Padrão, .tinted e .filled.',
        sourcePath: '$_kPasta/cupertino_button_estilos.dart',
        builder: (_) => const CupertinoButtonEstilos(),
      ),
      WidgetExample(
        title: 'Com ícone e desabilitado',
        description: 'CupertinoIcons e onPressed: null.',
        sourcePath: '$_kPasta/cupertino_button_icone.dart',
        builder: (_) => const CupertinoButtonIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoSwitch',
    description: 'O switch do iPhone, e os widgets que se adaptam à plataforma.',
    preview: const CupertinoSwitch(value: true, onChanged: _semAcaoValor),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'value, onChanged e a cor de ligado.',
        sourcePath: '$_kPasta/cupertino_switch_basico.dart',
        builder: (_) => const CupertinoSwitchBasico(),
      ),
      WidgetExample(
        title: 'Widgets adaptativos',
        description: '.adaptive vira Cupertino no iPhone. Troque a plataforma.',
        sourcePath: '$_kPasta/widgets_adaptativos.dart',
        builder: (_) => const WidgetsAdaptativos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoNavigationBar',
    description: 'A barra do topo no estilo iOS, com o título no meio.',
    preview: const SizedBox(
      width: 240,
      height: 44,
      child: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Ajustes'),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'CupertinoPageScaffold com título e botão.',
        sourcePath: '$_kPasta/cupertino_nav_bar_basico.dart',
        builder: (_) => const CupertinoNavBarBasico(),
      ),
      WidgetExample(
        title: 'Título grande',
        description: 'CupertinoSliverNavigationBar encolhe ao rolar.',
        sourcePath: '$_kPasta/cupertino_nav_bar_titulo_grande.dart',
        builder: (_) => const CupertinoNavBarTituloGrande(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoAlertDialog',
    description: 'O alerta do iPhone, e a lista de opções que sobe de baixo.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        const azul = CupertinoColors.systemBlue;
        return Container(
          width: 170,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: cores.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Permitir?',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(height: 1),
              SizedBox(
                height: 30,
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text('Não', style: TextStyle(color: azul, fontSize: 13)),
                      ),
                    ),
                    Container(width: 1, color: cores.outlineVariant),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Sim',
                          style: TextStyle(
                            color: azul,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'showCupertinoDialog com a ação recomendada em negrito.',
        sourcePath: '$_kPasta/cupertino_alert_basico.dart',
        builder: (_) => const CupertinoAlertBasico(),
      ),
      WidgetExample(
        title: 'Ação destrutiva',
        description: 'isDestructiveAction deixa a ação perigosa em vermelho.',
        sourcePath: '$_kPasta/cupertino_alert_destrutivo.dart',
        builder: (_) => const CupertinoAlertDestrutivo(),
      ),
      WidgetExample(
        title: 'CupertinoActionSheet',
        description: 'Opções que sobem de baixo, com o Cancelar separado.',
        sourcePath: '$_kPasta/cupertino_action_sheet.dart',
        builder: (_) => const CupertinoActionSheetExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoPicker',
    description: 'A roleta do iPhone para escolher uma opção, data ou hora.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        final apagado = TextStyle(fontSize: 12, color: cores.outline);
        return SizedBox(
          width: 160,
          height: 72,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 24,
                decoration: BoxDecoration(
                  color: cores.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text('Pequena', style: apagado),
                  const Text('Média', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Grande', style: apagado),
                ],
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Lista de opções',
        description: 'itemExtent, controller inicial e onSelectedItemChanged.',
        sourcePath: '$_kPasta/cupertino_picker_lista.dart',
        builder: (_) => const CupertinoPickerLista(),
      ),
      WidgetExample(
        title: 'Hora (CupertinoDatePicker)',
        description: 'A roleta de horário, em formato 24h.',
        sourcePath: '$_kPasta/cupertino_date_picker.dart',
        builder: (_) => const CupertinoDatePickerExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoSlider',
    description: 'O slider no estilo iOS.',
    preview: const SizedBox(
      width: 200,
      child: CupertinoSlider(value: 0.6, onChanged: _semAcaoValor),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'value, min, max e divisions, como no Slider.',
        sourcePath: '$_kPasta/cupertino_slider_basico.dart',
        builder: (_) => const CupertinoSliderBasico(),
      ),
    ],
  ),
];
