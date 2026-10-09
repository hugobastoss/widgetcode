import 'package:flutter/material.dart';

import '../examples/selection/checkbox_basico.dart';
import '../examples/selection/checkbox_list_tile.dart';
import '../examples/selection/checkbox_tres_estados.dart';
import '../examples/selection/choice_chip_obrigatorio.dart';
import '../examples/selection/choice_chip_opcional.dart';
import '../examples/selection/filter_chip_filtros.dart';
import '../examples/selection/filter_chip_icones.dart';
import '../examples/selection/radio_grupo.dart';
import '../examples/selection/radio_list_tile.dart';
import '../examples/selection/range_slider_ao_soltar.dart';
import '../examples/selection/range_slider_preco.dart';
import '../examples/selection/slider_continuo.dart';
import '../examples/selection/slider_cores.dart';
import '../examples/selection/slider_divisoes.dart';
import '../examples/selection/switch_basico.dart';
import '../examples/selection/switch_icone.dart';
import '../examples/selection/switch_list_tile.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/learn/examples/selection';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

// As pré-visualizações dos cartões não recebem toques, então os controles só
// precisam de um callback não nulo para aparecer habilitados.
void _semAcao(Object? _) {}

final kSelectionDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Checkbox',
    description: const Tr(
      pt: 'Uma caixa de marcar: sim ou não, para cada opção.',
      en: 'A check box: yes or no, for each option.',
      es: 'Una casilla de verificación: sí o no, para cada opción.',
    ),
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(value: true, onChanged: _semAcao),
        Checkbox(value: false, onChanged: _semAcao),
        Checkbox(value: null, tristate: true, onChanged: _semAcao),
      ],
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'value e onChanged, com o valor guardado no State.',
          en: 'value and onChanged, with the value kept in the State.',
          es: 'value y onChanged, con el valor guardado en el State.',
        ),
        sourcePath: '$_kPasta/checkbox_basico.dart',
        builder: (_) => const CheckboxBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'CheckboxListTile',
          en: 'CheckboxListTile',
          es: 'CheckboxListTile',
        ),
        description: const Tr(
          pt: 'Checkbox e texto numa linha toda tocável.',
          en: 'A checkbox and text in a fully tappable row.',
          es: 'Checkbox y texto en una fila que se puede tocar entera.',
        ),
        sourcePath: '$_kPasta/checkbox_list_tile.dart',
        builder: (_) => const CheckboxListTileExemplo(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Selecionar tudo', en: 'Select all', es: 'Seleccionar todo'),
        description: const Tr(
          pt: 'tristate: marcado, desmarcado ou "alguns" (null).',
          en: 'tristate: checked, unchecked or "some" (null).',
          es: 'tristate: marcado, desmarcado o "algunos" (null).',
        ),
        sourcePath: '$_kPasta/checkbox_tres_estados.dart',
        builder: (_) => const CheckboxTresEstados(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Radio',
    description: const Tr(
      pt: 'Escolha de uma única opção entre várias.',
      en: 'Choose a single option among several.',
      es: 'Elección de una única opción entre varias.',
    ),
    preview: const RadioGroup<int>(
      groupValue: 0,
      onChanged: _semAcao,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Radio(value: 0), Radio(value: 1), Radio(value: 2)],
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'RadioGroup', en: 'RadioGroup', es: 'RadioGroup'),
        description: const Tr(
          pt: 'O jeito atual: o grupo guarda a escolha, cada Radio só o valor.',
          en: 'The current way: the group holds the choice, each Radio only its value.',
          es: 'La forma actual: el grupo guarda la elección, cada Radio solo su valor.',
        ),
        sourcePath: '$_kPasta/radio_grupo.dart',
        builder: (_) => const RadioGrupo(),
      ),
      WidgetExample(
        title: const Tr(pt: 'RadioListTile', en: 'RadioListTile', es: 'RadioListTile'),
        description: const Tr(
          pt: 'Cada opção numa linha tocável, com subtítulo.',
          en: 'Each option in a tappable row, with a subtitle.',
          es: 'Cada opción en una fila que se puede tocar, con subtítulo.',
        ),
        sourcePath: '$_kPasta/radio_list_tile.dart',
        builder: (_) => const RadioListTileExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Switch',
    description: const Tr(
      pt: 'Liga e desliga algo na hora, como nas Configurações.',
      en: 'Turns something on and off instantly, like in Settings.',
      es: 'Activa y desactiva algo al instante, como en Ajustes.',
    ),
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Switch(value: true, onChanged: _semAcao),
        Switch(value: false, onChanged: _semAcao),
      ],
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Liga e desliga, mostrando o estado ao lado.',
          en: 'Turns on and off, showing the state next to it.',
          es: 'Activa y desactiva, mostrando el estado al lado.',
        ),
        sourcePath: '$_kPasta/switch_basico.dart',
        builder: (_) => const SwitchBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'SwitchListTile', en: 'SwitchListTile', es: 'SwitchListTile'),
        description: const Tr(
          pt: 'O formato clássico das telas de Configurações.',
          en: 'The classic format of Settings screens.',
          es: 'El formato clásico de las pantallas de Ajustes.',
        ),
        sourcePath: '$_kPasta/switch_list_tile.dart',
        builder: (_) => const SwitchListTileExemplo(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com ícone', en: 'With icon', es: 'Con ícono'),
        description: const Tr(
          pt: 'thumbIcon muda o ícone da bolinha conforme o estado.',
          en: 'thumbIcon changes the thumb icon according to the state.',
          es: 'thumbIcon cambia el ícono del botón según el estado.',
        ),
        sourcePath: '$_kPasta/switch_icone.dart',
        builder: (_) => const SwitchIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Slider',
    description: const Tr(
      pt: 'Escolhe um valor arrastando, dentro de uma faixa.',
      en: 'Picks a value by dragging, within a range.',
      es: 'Elige un valor arrastrando, dentro de un rango.',
    ),
    preview: const SizedBox(
      width: 220,
      child: Slider(value: 0.6, onChanged: _semAcao),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Contínuo', en: 'Continuous', es: 'Continuo'),
        description: const Tr(
          pt: 'Qualquer valor de 0 a 1, como um volume.',
          en: 'Any value from 0 to 1, like a volume.',
          es: 'Cualquier valor de 0 a 1, como un volumen.',
        ),
        sourcePath: '$_kPasta/slider_continuo.dart',
        builder: (_) => const SliderContinuo(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Divisões e rótulo',
          en: 'Divisions and label',
          es: 'Divisiones y etiqueta',
        ),
        description: const Tr(
          pt: 'divisions faz pular de 1 em 1; label mostra o valor.',
          en: 'divisions makes it step 1 by 1; label shows the value.',
          es: 'divisions hace que avance de 1 en 1; label muestra el valor.',
        ),
        sourcePath: '$_kPasta/slider_divisoes.dart',
        builder: (_) => const SliderDivisoes(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Cores', en: 'Colors', es: 'Colores'),
        description: const Tr(
          pt: 'activeColor, inactiveColor e thumbColor.',
          en: 'activeColor, inactiveColor and thumbColor.',
          es: 'activeColor, inactiveColor y thumbColor.',
        ),
        sourcePath: '$_kPasta/slider_cores.dart',
        builder: (_) => const SliderCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RangeSlider',
    description: const Tr(
      pt: 'Um Slider com duas bolinhas, para escolher uma faixa.',
      en: 'A Slider with two thumbs, to pick a range.',
      es: 'Un Slider con dos controles, para elegir un rango.',
    ),
    preview: SizedBox(
      width: 220,
      child: RangeSlider(
        values: const RangeValues(0.2, 0.7),
        onChanged: _semAcao,
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Faixa de preço', en: 'Price range', es: 'Rango de precio'),
        description: const Tr(
          pt: 'RangeValues, divisões e um rótulo em cada ponta.',
          en: 'RangeValues, divisions and a label at each end.',
          es: 'RangeValues, divisiones y una etiqueta en cada extremo.',
        ),
        sourcePath: '$_kPasta/range_slider_preco.dart',
        builder: (_) => const RangeSliderPreco(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Ao soltar', en: 'On release', es: 'Al soltar'),
        description: const Tr(
          pt: 'onChangeEnd só roda quando a pessoa solta o dedo.',
          en: 'onChangeEnd only runs when the finger is lifted.',
          es: 'onChangeEnd solo se ejecuta cuando la persona suelta el dedo.',
        ),
        sourcePath: '$_kPasta/range_slider_ao_soltar.dart',
        builder: (_) => const RangeSliderAoSoltar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FilterChip',
    description: const Tr(
      pt: 'Etiquetas de filtro: dá para marcar várias ao mesmo tempo.',
      en: 'Filter chips: you can select several at once.',
      es: 'Etiquetas de filtro: se pueden marcar varias a la vez.',
    ),
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        FilterChip(label: Text('Wi-Fi'), selected: true, onSelected: _semAcao),
        FilterChip(label: Text('Piscina'), selected: false, onSelected: _semAcao),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Filtros', en: 'Filters', es: 'Filtros'),
        description: const Tr(
          pt: 'Um Set guarda as etiquetas marcadas.',
          en: 'A Set holds the selected chips.',
          es: 'Un Set guarda las etiquetas marcadas.',
        ),
        sourcePath: '$_kPasta/filter_chip_filtros.dart',
        builder: (_) => const FilterChipFiltros(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com ícones', en: 'With icons', es: 'Con íconos'),
        description: const Tr(
          pt: 'avatar com um ícone e sem o ✓ (showCheckmark).',
          en: 'avatar with an icon and no ✓ (showCheckmark).',
          es: 'avatar con un ícono y sin el ✓ (showCheckmark).',
        ),
        sourcePath: '$_kPasta/filter_chip_icones.dart',
        builder: (_) => const FilterChipIcones(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ChoiceChip',
    description: const Tr(
      pt: 'Etiquetas de escolha: só uma marcada por vez.',
      en: 'Choice chips: only one selected at a time.',
      es: 'Etiquetas de elección: solo una marcada a la vez.',
    ),
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        ChoiceChip(label: Text('Hoje'), selected: true, onSelected: _semAcao),
        ChoiceChip(label: Text('Amanhã'), selected: false, onSelected: _semAcao),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Opcional', en: 'Optional', es: 'Opcional'),
        description: const Tr(
          pt: 'Tocar na escolhida desmarca: pode ficar sem nenhuma.',
          en: 'Tapping the selected one clears it: there can be none.',
          es: 'Tocar la elegida la desmarca: puede quedar sin ninguna.',
        ),
        sourcePath: '$_kPasta/choice_chip_opcional.dart',
        builder: (_) => const ChoiceChipOpcional(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Sempre uma escolhida',
          en: 'Always one selected',
          es: 'Siempre una elegida',
        ),
        description: const Tr(
          pt: 'Ignorando o bool, nunca fica sem opção.',
          en: 'By ignoring the bool, there is always one selected.',
          es: 'Ignorando el bool, nunca queda sin opción.',
        ),
        sourcePath: '$_kPasta/choice_chip_obrigatorio.dart',
        builder: (_) => const ChoiceChipObrigatorio(),
      ),
    ],
  ),
];
