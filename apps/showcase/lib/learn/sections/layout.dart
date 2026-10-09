import 'package:flutter/material.dart';

import '../examples/layout/align_coordenadas.dart';
import '../examples/layout/align_posicoes.dart';
import '../examples/layout/center_basico.dart';
import '../examples/layout/center_fatores.dart';
import '../examples/layout/column_alinhamento.dart';
import '../examples/layout/column_basico.dart';
import '../examples/layout/column_tamanho.dart';
import '../examples/layout/container_basico.dart';
import '../examples/layout/container_bordas.dart';
import '../examples/layout/container_margem_padding.dart';
import '../examples/layout/container_sombra_gradiente.dart';
import '../examples/layout/divider_entre_itens.dart';
import '../examples/layout/divider_personalizado.dart';
import '../examples/layout/expanded_basico.dart';
import '../examples/layout/expanded_column.dart';
import '../examples/layout/expanded_flex.dart';
import '../examples/layout/expanded_flexible.dart';
import '../examples/layout/padding_basico.dart';
import '../examples/layout/padding_edge_insets.dart';
import '../examples/layout/row_alinhamento.dart';
import '../examples/layout/row_alinhamento_cruzado.dart';
import '../examples/layout/row_basico.dart';
import '../examples/layout/row_espacamento.dart';
import '../examples/layout/sizedbox_espaco.dart';
import '../examples/layout/sizedbox_tamanho.dart';
import '../examples/layout/stack_camadas.dart';
import '../examples/layout/stack_positioned.dart';
import '../examples/layout/stack_texto_sobre_fundo.dart';
import '../examples/layout/wrap_basico.dart';
import '../examples/layout/wrap_centralizado.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/layout';

// Pré-visualizações dos cartões da seção: esquemas pequenos com caixas
// coloridas, que cabem na faixa de 88 de altura do cartão.

Widget _bloco(Color cor, {double largura = 28, double altura = 28}) =>
    Container(width: largura, height: altura, color: cor);

final _kMoldura = BoxDecoration(border: Border.all(color: Colors.grey));

final kLayoutDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Container',
    description:
        'A "caixa" do Flutter: junta tamanho, cor, borda, espaçamento e alinhamento.',
    preview: Container(
      width: 96,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Tamanho, cor e um texto centralizado com alignment.',
        sourcePath: '$_kPasta/container_basico.dart',
        builder: (_) => const ContainerBasico(),
      ),
      WidgetExample(
        title: 'Bordas e cantos',
        description: 'decoration com BoxDecoration: borda e cantos arredondados.',
        sourcePath: '$_kPasta/container_bordas.dart',
        builder: (_) => const ContainerBordas(),
      ),
      WidgetExample(
        title: 'Sombra e gradiente',
        description: 'BoxDecoration também desenha gradientes e sombras.',
        sourcePath: '$_kPasta/container_sombra_gradiente.dart',
        builder: (_) => const ContainerSombraGradiente(),
      ),
      WidgetExample(
        title: 'Margem e padding',
        description: 'margin é o espaço por fora; padding, por dentro.',
        sourcePath: '$_kPasta/container_margem_padding.dart',
        builder: (_) => const ContainerMargemPadding(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Row',
    description: 'Coloca os filhos lado a lado, na horizontal.',
    preview: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        _bloco(Colors.indigo),
        _bloco(Colors.teal),
        _bloco(Colors.deepOrange),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Três caixas lado a lado.',
        sourcePath: '$_kPasta/row_basico.dart',
        builder: (_) => const RowBasico(),
      ),
      WidgetExample(
        title: 'Alinhamento principal',
        description:
            'mainAxisAlignment distribui na horizontal. Toque nas opções.',
        sourcePath: '$_kPasta/row_alinhamento.dart',
        builder: (_) => const RowAlinhamento(),
      ),
      WidgetExample(
        title: 'Alinhamento cruzado',
        description: 'crossAxisAlignment alinha na vertical. Toque nas opções.',
        sourcePath: '$_kPasta/row_alinhamento_cruzado.dart',
        builder: (_) => const RowAlinhamentoCruzado(),
      ),
      WidgetExample(
        title: 'Espaçamento',
        description: 'spacing põe o mesmo espaço entre todos os filhos.',
        sourcePath: '$_kPasta/row_espacamento.dart',
        builder: (_) => const RowEspacamento(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Column',
    description: 'Empilha os filhos de cima para baixo, na vertical.',
    preview: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        _bloco(Colors.indigo, largura: 72, altura: 16),
        _bloco(Colors.teal, largura: 72, altura: 16),
        _bloco(Colors.deepOrange, largura: 72, altura: 16),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Três caixas empilhadas.',
        sourcePath: '$_kPasta/column_basico.dart',
        builder: (_) => const ColumnBasico(),
      ),
      WidgetExample(
        title: 'Alinhamento principal',
        description: 'mainAxisAlignment distribui na vertical. Toque nas opções.',
        sourcePath: '$_kPasta/column_alinhamento.dart',
        builder: (_) => const ColumnAlinhamento(),
      ),
      WidgetExample(
        title: 'Tamanho (mainAxisSize)',
        description: 'max ocupa toda a altura; min, só o necessário.',
        sourcePath: '$_kPasta/column_tamanho.dart',
        builder: (_) => const ColumnTamanho(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Stack',
    description: 'Sobrepõe os filhos, um em cima do outro, como camadas.',
    preview: SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        children: [
          _bloco(Colors.indigo, largura: 64, altura: 64),
          Positioned(left: 16, top: 16, child: _bloco(Colors.teal, largura: 48, altura: 48)),
          Positioned(left: 32, top: 32, child: _bloco(Colors.deepOrange, largura: 32, altura: 32)),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Camadas',
        description: 'O primeiro filho fica no fundo; os seguintes, por cima.',
        sourcePath: '$_kPasta/stack_camadas.dart',
        builder: (_) => const StackCamadas(),
      ),
      WidgetExample(
        title: 'Positioned',
        description:
            'Prende um filho a uma distância das bordas, como um selo de status.',
        sourcePath: '$_kPasta/stack_positioned.dart',
        builder: (_) => const StackPositioned(),
      ),
      WidgetExample(
        title: 'Texto sobre fundo',
        description: 'Uma faixa de texto por cima de uma imagem.',
        sourcePath: '$_kPasta/stack_texto_sobre_fundo.dart',
        builder: (_) => const StackTextoSobreFundo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Expanded',
    description: 'Faz um filho de Row ou Column ocupar o espaço que sobra.',
    preview: SizedBox(
      width: 200,
      child: Row(
        children: [
          _bloco(Colors.indigo, largura: 32, altura: 32),
          Expanded(child: _bloco(Colors.teal, altura: 32)),
          _bloco(Colors.indigo, largura: 32, altura: 32),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Ocupar o resto',
        description: 'O filho com Expanded fica com todo o espaço livre.',
        sourcePath: '$_kPasta/expanded_basico.dart',
        builder: (_) => const ExpandedBasico(),
      ),
      WidgetExample(
        title: 'Proporções com flex',
        description: 'flex divide o espaço em partes: 1, 2 e 1.',
        sourcePath: '$_kPasta/expanded_flex.dart',
        builder: (_) => const ExpandedFlex(),
      ),
      WidgetExample(
        title: 'Dentro de uma Column',
        description: 'Cabeçalho e rodapé fixos, conteúdo ocupando o meio.',
        sourcePath: '$_kPasta/expanded_column.dart',
        builder: (_) => const ExpandedColumn(),
      ),
      WidgetExample(
        title: 'Expanded × Flexible',
        description: 'Expanded obriga a ocupar o espaço; Flexible só permite.',
        sourcePath: '$_kPasta/expanded_flexible.dart',
        builder: (_) => const ExpandedFlexible(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Padding',
    description: 'Adiciona espaço em volta de um widget.',
    preview: Container(
      color: Colors.indigo.shade100,
      padding: const EdgeInsets.all(12),
      child: _bloco(Colors.indigo, largura: 64, altura: 32),
    ),
    examples: [
      WidgetExample(
        title: 'Com e sem padding',
        description: 'O mesmo texto, encostado e com 16 de espaço.',
        sourcePath: '$_kPasta/padding_basico.dart',
        builder: (_) => const PaddingBasico(),
      ),
      WidgetExample(
        title: 'Tipos de EdgeInsets',
        description:
            'all, symmetric e only: espaço igual, por eixo ou por lado.',
        sourcePath: '$_kPasta/padding_edge_insets.dart',
        builder: (_) => const PaddingEdgeInsets(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Center',
    description: 'Centraliza o filho no espaço disponível.',
    preview: Container(
      width: 120,
      height: 60,
      decoration: _kMoldura,
      child: Center(child: _bloco(Colors.indigo, largura: 20, altura: 20)),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Coloca o filho no meio do espaço.',
        sourcePath: '$_kPasta/center_basico.dart',
        builder: (_) => const CenterBasico(),
      ),
      WidgetExample(
        title: 'widthFactor e heightFactor',
        description: 'O Center fica do tamanho do filho vezes o fator.',
        sourcePath: '$_kPasta/center_fatores.dart',
        builder: (_) => const CenterFatores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Align',
    description: 'Posiciona o filho em qualquer ponto do espaço disponível.',
    preview: Container(
      width: 120,
      height: 60,
      padding: const EdgeInsets.all(6),
      decoration: _kMoldura,
      child: Align(
        alignment: Alignment.bottomRight,
        child: _bloco(Colors.indigo, largura: 20, altura: 20),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Posições prontas',
        description: 'As 9 posições de Alignment. Escolha na lista.',
        sourcePath: '$_kPasta/align_posicoes.dart',
        builder: (_) => const AlignPosicoes(),
      ),
      WidgetExample(
        title: 'Coordenadas',
        description: 'Alignment(x, y) de -1 a 1. Arraste os controles.',
        sourcePath: '$_kPasta/align_coordenadas.dart',
        builder: (_) => const AlignCoordenadas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SizedBox',
    description: 'Dá um tamanho fixo a um widget, ou cria um espaço vazio.',
    preview: Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
      alignment: Alignment.center,
      child: const Text(
        '120 × 40',
        style: TextStyle(fontFamily: 'monospace', color: Colors.indigo),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Tamanho fixo',
        description: 'Força um tamanho exato no filho.',
        sourcePath: '$_kPasta/sizedbox_tamanho.dart',
        builder: (_) => const SizedBoxTamanho(),
      ),
      WidgetExample(
        title: 'Espaço entre widgets',
        description: 'Sem filho, vira um espaço vazio.',
        sourcePath: '$_kPasta/sizedbox_espaco.dart',
        builder: (_) => const SizedBoxEspaco(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Wrap',
    description:
        'Como uma Row que quebra para a linha de baixo quando falta espaço.',
    preview: SizedBox(
      width: 190,
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final (i, largura) in const [40.0, 64.0, 48.0, 56.0, 36.0, 72.0].indexed)
            _bloco(
              const [Colors.indigo, Colors.teal, Colors.deepOrange][i % 3],
              largura: largura,
              altura: 20,
            ),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Quebra de linha',
        description: 'Os itens que não cabem vão para a linha de baixo.',
        sourcePath: '$_kPasta/wrap_basico.dart',
        builder: (_) => const WrapBasico(),
      ),
      WidgetExample(
        title: 'Centralizado',
        description: 'alignment centraliza os itens em cada linha.',
        sourcePath: '$_kPasta/wrap_centralizado.dart',
        builder: (_) => const WrapCentralizado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Divider',
    description: 'Uma linha fina para separar conteúdos.',
    preview: SizedBox(
      width: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _bloco(Colors.grey.shade400, largura: 180, altura: 10),
          const Divider(height: 16),
          _bloco(Colors.grey.shade400, largura: 180, altura: 10),
          const Divider(height: 16),
          _bloco(Colors.grey.shade400, largura: 180, altura: 10),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Entre itens',
        description: 'Separa os itens de uma lista.',
        sourcePath: '$_kPasta/divider_entre_itens.dart',
        builder: (_) => const DividerEntreItens(),
      ),
      WidgetExample(
        title: 'Personalizado e vertical',
        description: 'Espessura, recuo, cor e o VerticalDivider.',
        sourcePath: '$_kPasta/divider_personalizado.dart',
        builder: (_) => const DividerPersonalizado(),
      ),
    ],
  ),
];
