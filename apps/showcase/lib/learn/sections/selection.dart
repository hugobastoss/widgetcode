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

const _kPasta = 'lib/learn/examples/selection';

// As pré-visualizações dos cartões não recebem toques, então os controles só
// precisam de um callback não nulo para aparecer habilitados.
void _semAcao(Object? _) {}

final kSelectionDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Checkbox',
    description: 'Uma caixa de marcar: sim ou não, para cada opção.',
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
        title: 'Básico',
        description: 'value e onChanged, com o valor guardado no State.',
        sourcePath: '$_kPasta/checkbox_basico.dart',
        builder: (_) => const CheckboxBasico(),
      ),
      WidgetExample(
        title: 'CheckboxListTile',
        description: 'Checkbox e texto numa linha toda tocável.',
        sourcePath: '$_kPasta/checkbox_list_tile.dart',
        builder: (_) => const CheckboxListTileExemplo(),
      ),
      WidgetExample(
        title: 'Selecionar tudo',
        description: 'tristate: marcado, desmarcado ou "alguns" (null).',
        sourcePath: '$_kPasta/checkbox_tres_estados.dart',
        builder: (_) => const CheckboxTresEstados(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Radio',
    description: 'Escolha de uma única opção entre várias.',
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
        title: 'RadioGroup',
        description: 'O jeito atual: o grupo guarda a escolha, cada Radio só o valor.',
        sourcePath: '$_kPasta/radio_grupo.dart',
        builder: (_) => const RadioGrupo(),
      ),
      WidgetExample(
        title: 'RadioListTile',
        description: 'Cada opção numa linha tocável, com subtítulo.',
        sourcePath: '$_kPasta/radio_list_tile.dart',
        builder: (_) => const RadioListTileExemplo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Switch',
    description: 'Liga e desliga algo na hora, como nas Configurações.',
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
        title: 'Básico',
        description: 'Liga e desliga, mostrando o estado ao lado.',
        sourcePath: '$_kPasta/switch_basico.dart',
        builder: (_) => const SwitchBasico(),
      ),
      WidgetExample(
        title: 'SwitchListTile',
        description: 'O formato clássico das telas de Configurações.',
        sourcePath: '$_kPasta/switch_list_tile.dart',
        builder: (_) => const SwitchListTileExemplo(),
      ),
      WidgetExample(
        title: 'Com ícone',
        description: 'thumbIcon muda o ícone da bolinha conforme o estado.',
        sourcePath: '$_kPasta/switch_icone.dart',
        builder: (_) => const SwitchIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Slider',
    description: 'Escolhe um valor arrastando, dentro de uma faixa.',
    preview: const SizedBox(
      width: 220,
      child: Slider(value: 0.6, onChanged: _semAcao),
    ),
    examples: [
      WidgetExample(
        title: 'Contínuo',
        description: 'Qualquer valor de 0 a 1, como um volume.',
        sourcePath: '$_kPasta/slider_continuo.dart',
        builder: (_) => const SliderContinuo(),
      ),
      WidgetExample(
        title: 'Divisões e rótulo',
        description: 'divisions faz pular de 1 em 1; label mostra o valor.',
        sourcePath: '$_kPasta/slider_divisoes.dart',
        builder: (_) => const SliderDivisoes(),
      ),
      WidgetExample(
        title: 'Cores',
        description: 'activeColor, inactiveColor e thumbColor.',
        sourcePath: '$_kPasta/slider_cores.dart',
        builder: (_) => const SliderCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RangeSlider',
    description: 'Um Slider com duas bolinhas, para escolher uma faixa.',
    preview: SizedBox(
      width: 220,
      child: RangeSlider(
        values: const RangeValues(0.2, 0.7),
        onChanged: _semAcao,
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Faixa de preço',
        description: 'RangeValues, divisões e um rótulo em cada ponta.',
        sourcePath: '$_kPasta/range_slider_preco.dart',
        builder: (_) => const RangeSliderPreco(),
      ),
      WidgetExample(
        title: 'Ao soltar',
        description: 'onChangeEnd só roda quando a pessoa solta o dedo.',
        sourcePath: '$_kPasta/range_slider_ao_soltar.dart',
        builder: (_) => const RangeSliderAoSoltar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FilterChip',
    description: 'Etiquetas de filtro: dá para marcar várias ao mesmo tempo.',
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
        title: 'Filtros',
        description: 'Um Set guarda as etiquetas marcadas.',
        sourcePath: '$_kPasta/filter_chip_filtros.dart',
        builder: (_) => const FilterChipFiltros(),
      ),
      WidgetExample(
        title: 'Com ícones',
        description: 'avatar com um ícone e sem o ✓ (showCheckmark).',
        sourcePath: '$_kPasta/filter_chip_icones.dart',
        builder: (_) => const FilterChipIcones(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'ChoiceChip',
    description: 'Etiquetas de escolha: só uma marcada por vez.',
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
        title: 'Opcional',
        description: 'Tocar na escolhida desmarca: pode ficar sem nenhuma.',
        sourcePath: '$_kPasta/choice_chip_opcional.dart',
        builder: (_) => const ChoiceChipOpcional(),
      ),
      WidgetExample(
        title: 'Sempre uma escolhida',
        description: 'Ignorando o bool, nunca fica sem opção.',
        sourcePath: '$_kPasta/choice_chip_obrigatorio.dart',
        builder: (_) => const ChoiceChipObrigatorio(),
      ),
    ],
  ),
];
