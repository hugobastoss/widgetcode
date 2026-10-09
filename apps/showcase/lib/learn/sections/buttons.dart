import 'package:flutter/material.dart';

import '../examples/buttons/elevated_button_basico.dart';
import '../examples/buttons/elevated_button_carregando.dart';
import '../examples/buttons/elevated_button_com_icone.dart';
import '../examples/buttons/elevated_button_cores.dart';
import '../examples/buttons/elevated_button_desabilitado.dart';
import '../examples/buttons/fab_estendido.dart';
import '../examples/buttons/fab_grande.dart';
import '../examples/buttons/fab_padrao.dart';
import '../examples/buttons/fab_pequeno.dart';
import '../examples/buttons/filled_button_basico.dart';
import '../examples/buttons/filled_button_com_icone.dart';
import '../examples/buttons/filled_button_largura_total.dart';
import '../examples/buttons/filled_button_tonal.dart';
import '../examples/buttons/icon_button_alternavel.dart';
import '../examples/buttons/icon_button_padrao.dart';
import '../examples/buttons/icon_button_tamanho_cor.dart';
import '../examples/buttons/icon_button_variantes.dart';
import '../examples/buttons/outlined_button_basico.dart';
import '../examples/buttons/outlined_button_borda.dart';
import '../examples/buttons/outlined_button_com_icone.dart';
import '../examples/buttons/outlined_button_destrutivo.dart';
import '../examples/buttons/segmented_button_icones.dart';
import '../examples/buttons/segmented_button_multipla.dart';
import '../examples/buttons/segmented_button_unica.dart';
import '../examples/buttons/text_button_basico.dart';
import '../examples/buttons/text_button_com_icone.dart';
import '../examples/buttons/text_button_dialogo.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/buttons';

// As pré-visualizações dos cartões da seção não recebem toques (ver
// SectionScreen), então os botões só precisam de um onPressed não nulo pra
// aparecer habilitados.
void _semAcao() {}

final kButtonDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'ElevatedButton',
    description:
        'Botão com sombra, para destacar a ação sobre fundos coloridos ou com imagem.',
    preview: const ElevatedButton(onPressed: _semAcao, child: Text('Salvar')),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'O mínimo: um texto e a função chamada no toque.',
        sourcePath: '$_kPasta/elevated_button_basico.dart',
        builder: (_) => const ElevatedButtonBasico(),
      ),
      WidgetExample(
        title: 'Com ícone',
        description: 'O construtor .icon põe um ícone antes do texto.',
        sourcePath: '$_kPasta/elevated_button_com_icone.dart',
        builder: (_) => const ElevatedButtonComIcone(),
      ),
      WidgetExample(
        title: 'Carregando',
        description:
            'Troca o texto por um indicador enquanto a ação roda e bloqueia novos toques.',
        sourcePath: '$_kPasta/elevated_button_carregando.dart',
        builder: (_) => const ElevatedButtonCarregando(),
      ),
      WidgetExample(
        title: 'Desabilitado',
        description:
            'Com onPressed: null o botão fica desabilitado. Use a chave para alternar.',
        sourcePath: '$_kPasta/elevated_button_desabilitado.dart',
        builder: (_) => const ElevatedButtonDesabilitado(),
      ),
      WidgetExample(
        title: 'Cores personalizadas',
        description: 'styleFrom muda cor, sombra, espaçamento e formato.',
        sourcePath: '$_kPasta/elevated_button_cores.dart',
        builder: (_) => const ElevatedButtonCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FilledButton',
    description:
        'Preenchido com a cor principal. Ideal para a ação mais importante da tela.',
    preview: const FilledButton(onPressed: _semAcao, child: Text('Confirmar')),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'A ação principal da tela, na cor primária do tema.',
        sourcePath: '$_kPasta/filled_button_basico.dart',
        builder: (_) => const FilledButtonBasico(),
      ),
      WidgetExample(
        title: 'Tonal',
        description:
            'A versão .tonal, mais suave, junto da padrão para comparar.',
        sourcePath: '$_kPasta/filled_button_tonal.dart',
        builder: (_) => const FilledButtonTonal(),
      ),
      WidgetExample(
        title: 'Com ícone',
        description: 'O construtor .icon com ícone e texto.',
        sourcePath: '$_kPasta/filled_button_com_icone.dart',
        builder: (_) => const FilledButtonComIcone(),
      ),
      WidgetExample(
        title: 'Largura total',
        description:
            'Dentro de um SizedBox com largura infinita, ocupa a linha toda.',
        sourcePath: '$_kPasta/filled_button_largura_total.dart',
        builder: (_) => const FilledButtonLarguraTotal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'OutlinedButton',
    description:
        'Só com borda. Bom para ações secundárias, como Cancelar ou Voltar.',
    preview: const OutlinedButton(onPressed: _semAcao, child: Text('Cancelar')),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Só a borda, sem preenchimento.',
        sourcePath: '$_kPasta/outlined_button_basico.dart',
        builder: (_) => const OutlinedButtonBasico(),
      ),
      WidgetExample(
        title: 'Com ícone',
        description: 'O construtor .icon com ícone e texto.',
        sourcePath: '$_kPasta/outlined_button_com_icone.dart',
        builder: (_) => const OutlinedButtonComIcone(),
      ),
      WidgetExample(
        title: 'Borda personalizada',
        description: 'styleFrom com side muda a cor e a espessura da borda.',
        sourcePath: '$_kPasta/outlined_button_borda.dart',
        builder: (_) => const OutlinedButtonBorda(),
      ),
      WidgetExample(
        title: 'Destrutivo',
        description:
            'Usa a cor de erro do tema para sinalizar uma ação perigosa.',
        sourcePath: '$_kPasta/outlined_button_destrutivo.dart',
        builder: (_) => const OutlinedButtonDestrutivo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TextButton',
    description:
        'Só com texto. Para ações discretas, como em diálogos e cartões.',
    preview: const TextButton(onPressed: _semAcao, child: Text('Saiba mais')),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Só o texto. O fundo aparece ao tocar.',
        sourcePath: '$_kPasta/text_button_basico.dart',
        builder: (_) => const TextButtonBasico(),
      ),
      WidgetExample(
        title: 'Com ícone',
        description: 'O construtor .icon com ícone e texto.',
        sourcePath: '$_kPasta/text_button_com_icone.dart',
        builder: (_) => const TextButtonComIcone(),
      ),
      WidgetExample(
        title: 'Em um diálogo',
        description: 'O uso mais comum: as ações de um AlertDialog.',
        sourcePath: '$_kPasta/text_button_dialogo.dart',
        builder: (_) => const TextButtonDialogo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'IconButton',
    description:
        'Só com ícone, para ações compactas como favoritar ou compartilhar.',
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(onPressed: _semAcao, icon: Icon(Icons.favorite_border)),
        SizedBox(width: 12),
        IconButton.filled(onPressed: _semAcao, icon: Icon(Icons.favorite)),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Padrão',
        description: 'Um ícone tocável, com tooltip para acessibilidade.',
        sourcePath: '$_kPasta/icon_button_padrao.dart',
        builder: (_) => const IconButtonPadrao(),
      ),
      WidgetExample(
        title: 'Variantes de estilo',
        description: 'Padrão, .filled, .filledTonal e .outlined lado a lado.',
        sourcePath: '$_kPasta/icon_button_variantes.dart',
        builder: (_) => const IconButtonVariantes(),
      ),
      WidgetExample(
        title: 'Alternável',
        description: 'isSelected alterna entre dois ícones, como em favoritar.',
        sourcePath: '$_kPasta/icon_button_alternavel.dart',
        builder: (_) => const IconButtonAlternavel(),
      ),
      WidgetExample(
        title: 'Tamanho e cor',
        description: 'iconSize e color mudam o tamanho e a cor do ícone.',
        sourcePath: '$_kPasta/icon_button_tamanho_cor.dart',
        builder: (_) => const IconButtonTamanhoCor(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FloatingActionButton',
    description:
        'Flutua sobre a tela, para a ação principal, como criar um item novo.',
    preview: const FloatingActionButton(
      onPressed: _semAcao,
      child: Icon(Icons.add),
    ),
    examples: [
      WidgetExample(
        title: 'Padrão',
        description:
            'O tamanho normal. Costuma ir no floatingActionButton do Scaffold.',
        sourcePath: '$_kPasta/fab_padrao.dart',
        builder: (_) => const FabPadrao(),
      ),
      WidgetExample(
        title: 'Pequeno',
        description: '.small, para telas com pouco espaço.',
        sourcePath: '$_kPasta/fab_pequeno.dart',
        builder: (_) => const FabPequeno(),
      ),
      WidgetExample(
        title: 'Grande',
        description: '.large, para dar mais destaque à ação.',
        sourcePath: '$_kPasta/fab_grande.dart',
        builder: (_) => const FabGrande(),
      ),
      WidgetExample(
        title: 'Estendido',
        description: '.extended, com ícone e texto.',
        sourcePath: '$_kPasta/fab_estendido.dart',
        builder: (_) => const FabEstendido(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SegmentedButton',
    description:
        'Opções lado a lado no mesmo grupo. Permite escolher uma ou várias.',
    preview: SegmentedButton<String>(
      segments: const [
        ButtonSegment(value: 'dia', label: Text('Dia')),
        ButtonSegment(value: 'semana', label: Text('Semana')),
        ButtonSegment(value: 'mes', label: Text('Mês')),
      ],
      selected: const {'dia'},
      onSelectionChanged: (_) {},
    ),
    examples: [
      WidgetExample(
        title: 'Seleção única',
        description: 'Só um segmento marcado por vez.',
        sourcePath: '$_kPasta/segmented_button_unica.dart',
        builder: (_) => const SegmentedButtonUnica(),
      ),
      WidgetExample(
        title: 'Seleção múltipla',
        description: 'multiSelectionEnabled permite marcar vários.',
        sourcePath: '$_kPasta/segmented_button_multipla.dart',
        builder: (_) => const SegmentedButtonMultipla(),
      ),
      WidgetExample(
        title: 'Com ícones',
        description: 'Segmentos só com ícone, cada um com seu tooltip.',
        sourcePath: '$_kPasta/segmented_button_icones.dart',
        builder: (_) => const SegmentedButtonIcones(),
      ),
    ],
  ),
];
