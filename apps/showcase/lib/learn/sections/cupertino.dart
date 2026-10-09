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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/cupertino';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

// As pré-visualizações dos cartões não recebem toques; os controles só
// precisam de um callback não nulo para aparecer habilitados.
void _semAcao() {}
void _semAcaoValor(Object? _) {}

final kCupertinoDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'CupertinoButton',
    description: const Tr(
      pt: 'O botão no estilo iOS: só texto, tinted ou preenchido.',
      en: 'The iOS-style button: text only, tinted or filled.',
      es: 'El botón al estilo iOS: solo texto, tinted o relleno.',
    ),
    preview: const CupertinoButton.filled(
      onPressed: _semAcao,
      child: Text('Continuar'),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Três estilos', en: 'Three styles', es: 'Tres estilos'),
        description: const Tr(
          pt: 'Padrão, .tinted e .filled.',
          en: 'Default, .tinted and .filled.',
          es: 'Estándar, .tinted y .filled.',
        ),
        sourcePath: '$_kPasta/cupertino_button_estilos.dart',
        builder: (_) => const CupertinoButtonEstilos(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com ícone e desabilitado',
          en: 'With icon and disabled',
          es: 'Con ícono y deshabilitado',
        ),
        description: const Tr(
          pt: 'CupertinoIcons e onPressed: null.',
          en: 'CupertinoIcons and onPressed: null.',
          es: 'CupertinoIcons y onPressed: null.',
        ),
        sourcePath: '$_kPasta/cupertino_button_icone.dart',
        builder: (_) => const CupertinoButtonIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoSwitch',
    description: const Tr(
      pt: 'O switch do iPhone, e os widgets que se adaptam à plataforma.',
      en: 'The iPhone switch, and widgets that adapt to the platform.',
      es: 'El switch del iPhone y los widgets que se adaptan a la plataforma.',
    ),
    preview: const CupertinoSwitch(value: true, onChanged: _semAcaoValor),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'value, onChanged e a cor de ligado.',
          en: 'value, onChanged and the "on" color.',
          es: 'value, onChanged y el color de encendido.',
        ),
        sourcePath: '$_kPasta/cupertino_switch_basico.dart',
        builder: (_) => const CupertinoSwitchBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Widgets adaptativos',
          en: 'Adaptive widgets',
          es: 'Widgets adaptativos',
        ),
        description: const Tr(
          pt: '.adaptive vira Cupertino no iPhone. Troque a plataforma.',
          en: '.adaptive becomes Cupertino on iPhone. Switch the platform.',
          es: '.adaptive se vuelve Cupertino en el iPhone. Cambia la plataforma.',
        ),
        sourcePath: '$_kPasta/widgets_adaptativos.dart',
        builder: (_) => const WidgetsAdaptativos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoNavigationBar',
    description: const Tr(
      pt: 'A barra do topo no estilo iOS, com o título no meio.',
      en: 'The iOS-style top bar, with the title in the middle.',
      es: 'La barra superior al estilo iOS, con el título en el medio.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'CupertinoPageScaffold com título e botão.',
          en: 'CupertinoPageScaffold with a title and a button.',
          es: 'CupertinoPageScaffold con título y botón.',
        ),
        sourcePath: '$_kPasta/cupertino_nav_bar_basico.dart',
        builder: (_) => const CupertinoNavBarBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Título grande', en: 'Large title', es: 'Título grande'),
        description: const Tr(
          pt: 'CupertinoSliverNavigationBar encolhe ao rolar.',
          en: 'CupertinoSliverNavigationBar shrinks as you scroll.',
          es: 'CupertinoSliverNavigationBar se encoge al desplazarse.',
        ),
        sourcePath: '$_kPasta/cupertino_nav_bar_titulo_grande.dart',
        builder: (_) => const CupertinoNavBarTituloGrande(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoAlertDialog',
    description: const Tr(
      pt: 'O alerta do iPhone, e a lista de opções que sobe de baixo.',
      en: 'The iPhone alert, and the list of options that slides up from the bottom.',
      es: 'La alerta del iPhone y la lista de opciones que sube desde abajo.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'showCupertinoDialog com a ação recomendada em negrito.',
          en: 'showCupertinoDialog with the recommended action in bold.',
          es: 'showCupertinoDialog con la acción recomendada en negrita.',
        ),
        sourcePath: '$_kPasta/cupertino_alert_basico.dart',
        builder: (_) => const CupertinoAlertBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Ação destrutiva',
          en: 'Destructive action',
          es: 'Acción destructiva',
        ),
        description: const Tr(
          pt: 'isDestructiveAction deixa a ação perigosa em vermelho.',
          en: 'isDestructiveAction makes the dangerous action red.',
          es: 'isDestructiveAction pone la acción peligrosa en rojo.',
        ),
        sourcePath: '$_kPasta/cupertino_alert_destrutivo.dart',
        builder: (_) => const CupertinoAlertDestrutivo(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'CupertinoActionSheet',
          en: 'CupertinoActionSheet',
          es: 'CupertinoActionSheet',
        ),
        description: const Tr(
          pt: 'Opções que sobem de baixo, com o Cancelar separado.',
          en: 'Options that slide up from the bottom, with Cancel set apart.',
          es: 'Opciones que suben desde abajo, con Cancelar separado.',
        ),
        sourcePath: '$_kPasta/cupertino_action_sheet.dart',
        builder: (_) => const CupertinoActionSheetExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoPicker',
    description: const Tr(
      pt: 'A roleta do iPhone para escolher uma opção, data ou hora.',
      en: 'The iPhone wheel for picking an option, a date or a time.',
      es: 'La rueda del iPhone para elegir una opción, fecha u hora.',
    ),
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
        title: const Tr(
          pt: 'Lista de opções',
          en: 'List of options',
          es: 'Lista de opciones',
        ),
        description: const Tr(
          pt: 'itemExtent, controller inicial e onSelectedItemChanged.',
          en: 'itemExtent, an initial controller and onSelectedItemChanged.',
          es: 'itemExtent, controller inicial y onSelectedItemChanged.',
        ),
        sourcePath: '$_kPasta/cupertino_picker_lista.dart',
        builder: (_) => const CupertinoPickerLista(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Hora (CupertinoDatePicker)',
          en: 'Time (CupertinoDatePicker)',
          es: 'Hora (CupertinoDatePicker)',
        ),
        description: const Tr(
          pt: 'A roleta de horário, em formato 24h.',
          en: 'The time wheel, in 24-hour format.',
          es: 'La rueda de horario, en formato de 24 h.',
        ),
        sourcePath: '$_kPasta/cupertino_date_picker.dart',
        builder: (_) => const CupertinoDatePickerExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CupertinoSlider',
    description: const Tr(
      pt: 'O slider no estilo iOS.',
      en: 'The iOS-style slider.',
      es: 'El slider al estilo iOS.',
    ),
    preview: const SizedBox(
      width: 200,
      child: CupertinoSlider(value: 0.6, onChanged: _semAcaoValor),
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'value, min, max e divisions, como no Slider.',
          en: 'value, min, max and divisions, like the Slider.',
          es: 'value, min, max y divisions, como en el Slider.',
        ),
        sourcePath: '$_kPasta/cupertino_slider_basico.dart',
        builder: (_) => const CupertinoSliderBasico(),
      ),
    ],
  ),
];
