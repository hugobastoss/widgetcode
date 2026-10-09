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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/layout';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');
const _alinhamentoPrincipal = Tr(
  pt: 'Alinhamento principal',
  en: 'Main axis alignment',
  es: 'Alineación principal',
);

// Pré-visualizações dos cartões da seção: esquemas pequenos com caixas
// coloridas, que cabem na faixa de 88 de altura do cartão.

Widget _bloco(Color cor, {double largura = 28, double altura = 28}) =>
    Container(width: largura, height: altura, color: cor);

final _kMoldura = BoxDecoration(border: Border.all(color: Colors.grey));

final kLayoutDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Container',
    description: const Tr(
      pt: 'A "caixa" do Flutter: junta tamanho, cor, borda, espaçamento e alinhamento.',
      en: 'Flutter\'s "box": it combines size, color, border, spacing and alignment.',
      es: 'La "caja" de Flutter: reúne tamaño, color, borde, espaciado y alineación.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Tamanho, cor e um texto centralizado com alignment.',
          en: 'Size, color and a label centered with alignment.',
          es: 'Tamaño, color y un texto centrado con alignment.',
        ),
        sourcePath: '$_kPasta/container_basico.dart',
        builder: (_) => const ContainerBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Bordas e cantos',
          en: 'Borders and corners',
          es: 'Bordes y esquinas',
        ),
        description: const Tr(
          pt: 'decoration com BoxDecoration: borda e cantos arredondados.',
          en: 'decoration with BoxDecoration: border and rounded corners.',
          es: 'decoration con BoxDecoration: borde y esquinas redondeadas.',
        ),
        sourcePath: '$_kPasta/container_bordas.dart',
        builder: (_) => const ContainerBordas(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Sombra e gradiente',
          en: 'Shadow and gradient',
          es: 'Sombra y degradado',
        ),
        description: const Tr(
          pt: 'BoxDecoration também desenha gradientes e sombras.',
          en: 'BoxDecoration also draws gradients and shadows.',
          es: 'BoxDecoration también dibuja degradados y sombras.',
        ),
        sourcePath: '$_kPasta/container_sombra_gradiente.dart',
        builder: (_) => const ContainerSombraGradiente(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Margem e padding',
          en: 'Margin and padding',
          es: 'Margen y padding',
        ),
        description: const Tr(
          pt: 'margin é o espaço por fora; padding, por dentro.',
          en: 'margin is the space outside; padding, the space inside.',
          es: 'margin es el espacio por fuera; padding, por dentro.',
        ),
        sourcePath: '$_kPasta/container_margem_padding.dart',
        builder: (_) => const ContainerMargemPadding(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Row',
    description: const Tr(
      pt: 'Coloca os filhos lado a lado, na horizontal.',
      en: 'Places its children side by side, horizontally.',
      es: 'Coloca a sus hijos uno al lado del otro, en horizontal.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Três caixas lado a lado.',
          en: 'Three boxes side by side.',
          es: 'Tres cajas una al lado de la otra.',
        ),
        sourcePath: '$_kPasta/row_basico.dart',
        builder: (_) => const RowBasico(),
      ),
      WidgetExample(
        title: _alinhamentoPrincipal,
        description: const Tr(
          pt: 'mainAxisAlignment distribui na horizontal. Toque nas opções.',
          en: 'mainAxisAlignment distributes horizontally. Tap the options.',
          es: 'mainAxisAlignment distribuye en horizontal. Toca las opciones.',
        ),
        sourcePath: '$_kPasta/row_alinhamento.dart',
        builder: (_) => const RowAlinhamento(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Alinhamento cruzado',
          en: 'Cross axis alignment',
          es: 'Alineación cruzada',
        ),
        description: const Tr(
          pt: 'crossAxisAlignment alinha na vertical. Toque nas opções.',
          en: 'crossAxisAlignment aligns vertically. Tap the options.',
          es: 'crossAxisAlignment alinea en vertical. Toca las opciones.',
        ),
        sourcePath: '$_kPasta/row_alinhamento_cruzado.dart',
        builder: (_) => const RowAlinhamentoCruzado(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Espaçamento', en: 'Spacing', es: 'Espaciado'),
        description: const Tr(
          pt: 'spacing põe o mesmo espaço entre todos os filhos.',
          en: 'spacing puts the same gap between all children.',
          es: 'spacing pone el mismo espacio entre todos los hijos.',
        ),
        sourcePath: '$_kPasta/row_espacamento.dart',
        builder: (_) => const RowEspacamento(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Column',
    description: const Tr(
      pt: 'Empilha os filhos de cima para baixo, na vertical.',
      en: 'Stacks its children from top to bottom, vertically.',
      es: 'Apila a sus hijos de arriba abajo, en vertical.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Três caixas empilhadas.',
          en: 'Three stacked boxes.',
          es: 'Tres cajas apiladas.',
        ),
        sourcePath: '$_kPasta/column_basico.dart',
        builder: (_) => const ColumnBasico(),
      ),
      WidgetExample(
        title: _alinhamentoPrincipal,
        description: const Tr(
          pt: 'mainAxisAlignment distribui na vertical. Toque nas opções.',
          en: 'mainAxisAlignment distributes vertically. Tap the options.',
          es: 'mainAxisAlignment distribuye en vertical. Toca las opciones.',
        ),
        sourcePath: '$_kPasta/column_alinhamento.dart',
        builder: (_) => const ColumnAlinhamento(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Tamanho (mainAxisSize)',
          en: 'Size (mainAxisSize)',
          es: 'Tamaño (mainAxisSize)',
        ),
        description: const Tr(
          pt: 'max ocupa toda a altura; min, só o necessário.',
          en: 'max takes the full height; min, only what it needs.',
          es: 'max ocupa toda la altura; min, solo lo necesario.',
        ),
        sourcePath: '$_kPasta/column_tamanho.dart',
        builder: (_) => const ColumnTamanho(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Stack',
    description: const Tr(
      pt: 'Sobrepõe os filhos, um em cima do outro, como camadas.',
      en: 'Layers its children on top of each other.',
      es: 'Superpone a sus hijos, uno encima del otro, como capas.',
    ),
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
        title: const Tr(pt: 'Camadas', en: 'Layers', es: 'Capas'),
        description: const Tr(
          pt: 'O primeiro filho fica no fundo; os seguintes, por cima.',
          en: 'The first child is at the back; the next ones go on top.',
          es: 'El primer hijo queda al fondo; los siguientes, encima.',
        ),
        sourcePath: '$_kPasta/stack_camadas.dart',
        builder: (_) => const StackCamadas(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Positioned', en: 'Positioned', es: 'Positioned'),
        description: const Tr(
          pt: 'Prende um filho a uma distância das bordas, como um selo de status.',
          en: 'Pins a child at a distance from the edges, like a status badge.',
          es: 'Fija un hijo a cierta distancia de los bordes, como un indicador de estado.',
        ),
        sourcePath: '$_kPasta/stack_positioned.dart',
        builder: (_) => const StackPositioned(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Texto sobre fundo',
          en: 'Text over a background',
          es: 'Texto sobre fondo',
        ),
        description: const Tr(
          pt: 'Uma faixa de texto por cima de uma imagem.',
          en: 'A strip of text on top of an image.',
          es: 'Una franja de texto encima de una imagen.',
        ),
        sourcePath: '$_kPasta/stack_texto_sobre_fundo.dart',
        builder: (_) => const StackTextoSobreFundo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Expanded',
    description: const Tr(
      pt: 'Faz um filho de Row ou Column ocupar o espaço que sobra.',
      en: 'Makes a Row or Column child fill the remaining space.',
      es: 'Hace que un hijo de Row o Column ocupe el espacio que sobra.',
    ),
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
        title: const Tr(pt: 'Ocupar o resto', en: 'Fill the rest', es: 'Ocupar el resto'),
        description: const Tr(
          pt: 'O filho com Expanded fica com todo o espaço livre.',
          en: 'The child wrapped in Expanded takes all the free space.',
          es: 'El hijo con Expanded se queda con todo el espacio libre.',
        ),
        sourcePath: '$_kPasta/expanded_basico.dart',
        builder: (_) => const ExpandedBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Proporções com flex',
          en: 'Ratios with flex',
          es: 'Proporciones con flex',
        ),
        description: const Tr(
          pt: 'flex divide o espaço em partes: 1, 2 e 1.',
          en: 'flex splits the space into parts: 1, 2 and 1.',
          es: 'flex divide el espacio en partes: 1, 2 y 1.',
        ),
        sourcePath: '$_kPasta/expanded_flex.dart',
        builder: (_) => const ExpandedFlex(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Dentro de uma Column',
          en: 'Inside a Column',
          es: 'Dentro de una Column',
        ),
        description: const Tr(
          pt: 'Cabeçalho e rodapé fixos, conteúdo ocupando o meio.',
          en: 'Fixed header and footer, with the content filling the middle.',
          es: 'Cabecera y pie fijos, con el contenido ocupando el medio.',
        ),
        sourcePath: '$_kPasta/expanded_column.dart',
        builder: (_) => const ExpandedColumn(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Expanded × Flexible',
          en: 'Expanded × Flexible',
          es: 'Expanded × Flexible',
        ),
        description: const Tr(
          pt: 'Expanded obriga a ocupar o espaço; Flexible só permite.',
          en: 'Expanded forces the child to fill the space; Flexible only allows it.',
          es: 'Expanded obliga a ocupar el espacio; Flexible solo lo permite.',
        ),
        sourcePath: '$_kPasta/expanded_flexible.dart',
        builder: (_) => const ExpandedFlexible(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Padding',
    description: const Tr(
      pt: 'Adiciona espaço em volta de um widget.',
      en: 'Adds space around a widget.',
      es: 'Añade espacio alrededor de un widget.',
    ),
    preview: Container(
      color: Colors.indigo.shade100,
      padding: const EdgeInsets.all(12),
      child: _bloco(Colors.indigo, largura: 64, altura: 32),
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Com e sem padding',
          en: 'With and without padding',
          es: 'Con y sin padding',
        ),
        description: const Tr(
          pt: 'O mesmo texto, encostado e com 16 de espaço.',
          en: 'The same text, touching the edges and with 16 of space.',
          es: 'El mismo texto, pegado al borde y con 16 de espacio.',
        ),
        sourcePath: '$_kPasta/padding_basico.dart',
        builder: (_) => const PaddingBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Tipos de EdgeInsets',
          en: 'Kinds of EdgeInsets',
          es: 'Tipos de EdgeInsets',
        ),
        description: const Tr(
          pt: 'all, symmetric e only: espaço igual, por eixo ou por lado.',
          en: 'all, symmetric and only: equal space, per axis or per side.',
          es: 'all, symmetric y only: espacio igual, por eje o por lado.',
        ),
        sourcePath: '$_kPasta/padding_edge_insets.dart',
        builder: (_) => const PaddingEdgeInsets(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Center',
    description: const Tr(
      pt: 'Centraliza o filho no espaço disponível.',
      en: 'Centers its child in the available space.',
      es: 'Centra a su hijo en el espacio disponible.',
    ),
    preview: Container(
      width: 120,
      height: 60,
      decoration: _kMoldura,
      child: Center(child: _bloco(Colors.indigo, largura: 20, altura: 20)),
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Coloca o filho no meio do espaço.',
          en: 'Puts the child in the middle of the space.',
          es: 'Coloca al hijo en el medio del espacio.',
        ),
        sourcePath: '$_kPasta/center_basico.dart',
        builder: (_) => const CenterBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'widthFactor e heightFactor',
          en: 'widthFactor and heightFactor',
          es: 'widthFactor y heightFactor',
        ),
        description: const Tr(
          pt: 'O Center fica do tamanho do filho vezes o fator.',
          en: "The Center becomes the child's size times the factor.",
          es: 'El Center toma el tamaño del hijo multiplicado por el factor.',
        ),
        sourcePath: '$_kPasta/center_fatores.dart',
        builder: (_) => const CenterFatores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Align',
    description: const Tr(
      pt: 'Posiciona o filho em qualquer ponto do espaço disponível.',
      en: 'Positions its child anywhere in the available space.',
      es: 'Posiciona a su hijo en cualquier punto del espacio disponible.',
    ),
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
        title: const Tr(
          pt: 'Posições prontas',
          en: 'Preset positions',
          es: 'Posiciones predefinidas',
        ),
        description: const Tr(
          pt: 'As 9 posições de Alignment. Escolha na lista.',
          en: 'The 9 Alignment positions. Pick one from the list.',
          es: 'Las 9 posiciones de Alignment. Elige una en la lista.',
        ),
        sourcePath: '$_kPasta/align_posicoes.dart',
        builder: (_) => const AlignPosicoes(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Coordenadas', en: 'Coordinates', es: 'Coordenadas'),
        description: const Tr(
          pt: 'Alignment(x, y) de -1 a 1. Arraste os controles.',
          en: 'Alignment(x, y) from -1 to 1. Drag the sliders.',
          es: 'Alignment(x, y) de -1 a 1. Arrastra los controles.',
        ),
        sourcePath: '$_kPasta/align_coordenadas.dart',
        builder: (_) => const AlignCoordenadas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SizedBox',
    description: const Tr(
      pt: 'Dá um tamanho fixo a um widget, ou cria um espaço vazio.',
      en: 'Gives a widget a fixed size, or creates empty space.',
      es: 'Da un tamaño fijo a un widget o crea un espacio vacío.',
    ),
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
        title: const Tr(pt: 'Tamanho fixo', en: 'Fixed size', es: 'Tamaño fijo'),
        description: const Tr(
          pt: 'Força um tamanho exato no filho.',
          en: 'Forces an exact size on the child.',
          es: 'Fuerza un tamaño exacto en el hijo.',
        ),
        sourcePath: '$_kPasta/sizedbox_tamanho.dart',
        builder: (_) => const SizedBoxTamanho(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Espaço entre widgets',
          en: 'Space between widgets',
          es: 'Espacio entre widgets',
        ),
        description: const Tr(
          pt: 'Sem filho, vira um espaço vazio.',
          en: 'Without a child, it becomes empty space.',
          es: 'Sin hijo, se convierte en un espacio vacío.',
        ),
        sourcePath: '$_kPasta/sizedbox_espaco.dart',
        builder: (_) => const SizedBoxEspaco(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Wrap',
    description: const Tr(
      pt: 'Como uma Row que quebra para a linha de baixo quando falta espaço.',
      en: 'Like a Row that wraps to the next line when it runs out of space.',
      es: 'Como una Row que pasa a la línea de abajo cuando falta espacio.',
    ),
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
        title: const Tr(pt: 'Quebra de linha', en: 'Line wrapping', es: 'Salto de línea'),
        description: const Tr(
          pt: 'Os itens que não cabem vão para a linha de baixo.',
          en: "Items that don't fit move to the next line.",
          es: 'Los elementos que no caben pasan a la línea de abajo.',
        ),
        sourcePath: '$_kPasta/wrap_basico.dart',
        builder: (_) => const WrapBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Centralizado', en: 'Centered', es: 'Centrado'),
        description: const Tr(
          pt: 'alignment centraliza os itens em cada linha.',
          en: 'alignment centers the items on each line.',
          es: 'alignment centra los elementos en cada línea.',
        ),
        sourcePath: '$_kPasta/wrap_centralizado.dart',
        builder: (_) => const WrapCentralizado(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Divider',
    description: const Tr(
      pt: 'Uma linha fina para separar conteúdos.',
      en: 'A thin line to separate content.',
      es: 'Una línea fina para separar contenidos.',
    ),
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
        title: const Tr(pt: 'Entre itens', en: 'Between items', es: 'Entre elementos'),
        description: const Tr(
          pt: 'Separa os itens de uma lista.',
          en: 'Separates the items of a list.',
          es: 'Separa los elementos de una lista.',
        ),
        sourcePath: '$_kPasta/divider_entre_itens.dart',
        builder: (_) => const DividerEntreItens(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Personalizado e vertical',
          en: 'Custom and vertical',
          es: 'Personalizado y vertical',
        ),
        description: const Tr(
          pt: 'Espessura, recuo, cor e o VerticalDivider.',
          en: 'Thickness, indent, color and the VerticalDivider.',
          es: 'Grosor, sangría, color y el VerticalDivider.',
        ),
        sourcePath: '$_kPasta/divider_personalizado.dart',
        builder: (_) => const DividerPersonalizado(),
      ),
    ],
  ),
];
