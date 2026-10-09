import 'package:flutter/material.dart';

import '../examples/text_images/badge_contador.dart';
import '../examples/text_images/badge_numero.dart';
import '../examples/text_images/badge_ponto.dart';
import '../examples/text_images/circle_avatar_imagem.dart';
import '../examples/text_images/circle_avatar_iniciais.dart';
import '../examples/text_images/circle_avatar_tamanhos.dart';
import '../examples/text_images/icon_basico.dart';
import '../examples/text_images/icon_tamanho_cor.dart';
import '../examples/text_images/icon_variantes.dart';
import '../examples/text_images/image_asset.dart';
import '../examples/text_images/image_cantos.dart';
import '../examples/text_images/image_fit.dart';
import '../examples/text_images/image_network.dart';
import '../examples/text_images/rich_text_basico.dart';
import '../examples/text_images/rich_text_icone.dart';
import '../examples/text_images/rich_text_text_rich.dart';
import '../examples/text_images/selectable_text_area.dart';
import '../examples/text_images/selectable_text_basico.dart';
import '../examples/text_images/text_basico.dart';
import '../examples/text_images/text_estilo.dart';
import '../examples/text_images/text_longo.dart';
import '../examples/text_images/text_tema.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/text_images';
const _kPaisagem = 'assets/images/paisagem.png';

final kTextImagesDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Text',
    description: 'Mostra um texto na tela, com o estilo que você quiser.',
    preview: Builder(
      builder: (context) => Text(
        'Olá, Flutter!',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Só o texto, com o estilo padrão do tema.',
        sourcePath: '$_kPasta/text_basico.dart',
        builder: (_) => const TextBasico(),
      ),
      WidgetExample(
        title: 'Estilo',
        description: 'TextStyle: tamanho, peso, cor, itálico, sublinhado.',
        sourcePath: '$_kPasta/text_estilo.dart',
        builder: (_) => const TextEstilo(),
      ),
      WidgetExample(
        title: 'Estilos do tema',
        description: 'Os tamanhos prontos do textTheme, em vez de números soltos.',
        sourcePath: '$_kPasta/text_tema.dart',
        builder: (_) => const TextTema(),
      ),
      WidgetExample(
        title: 'Texto longo',
        description: 'maxLines e overflow cortam com "...". Toque em Ver mais.',
        sourcePath: '$_kPasta/text_longo.dart',
        builder: (_) => const TextLongo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RichText',
    description: 'Um texto com partes de estilos diferentes.',
    preview: const Text.rich(
      TextSpan(
        style: TextStyle(fontSize: 16),
        children: [
          TextSpan(text: 'O Flutter é '),
          TextSpan(
            text: 'rápido',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: ' e '),
          TextSpan(
            text: 'bonito',
            style: TextStyle(color: Colors.teal, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Uma árvore de TextSpan, cada pedaço com seu estilo.',
        sourcePath: '$_kPasta/rich_text_basico.dart',
        builder: (_) => const RichTextBasico(),
      ),
      WidgetExample(
        title: 'Text.rich',
        description: 'O atalho recomendado, que já herda o estilo do app.',
        sourcePath: '$_kPasta/rich_text_text_rich.dart',
        builder: (_) => const RichTextTextRich(),
      ),
      WidgetExample(
        title: 'Ícone no texto',
        description: 'WidgetSpan coloca um widget no meio da frase.',
        sourcePath: '$_kPasta/rich_text_icone.dart',
        builder: (_) => const RichTextIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SelectableText',
    description: 'Um texto que a pessoa pode selecionar e copiar.',
    preview: Builder(
      builder: (context) => Text.rich(
        TextSpan(
          style: const TextStyle(fontSize: 16),
          children: [
            const TextSpan(text: 'Selecione '),
            TextSpan(
              text: 'este trecho',
              style: TextStyle(
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.25),
              ),
            ),
          ],
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Toque e segure para selecionar e copiar.',
        sourcePath: '$_kPasta/selectable_text_basico.dart',
        builder: (_) => const SelectableTextBasico(),
      ),
      WidgetExample(
        title: 'SelectionArea',
        description: 'Deixa vários textos selecionáveis de uma vez.',
        sourcePath: '$_kPasta/selectable_text_area.dart',
        builder: (_) => const SelectableTextArea(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Icon',
    description: 'Desenha um ícone do Material Design, com tamanho e cor.',
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 20,
      children: [
        Icon(Icons.home, size: 32),
        Icon(Icons.search, size: 32),
        Icon(Icons.settings, size: 32),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Ícones da classe Icons, no tamanho padrão.',
        sourcePath: '$_kPasta/icon_basico.dart',
        builder: (_) => const IconBasico(),
      ),
      WidgetExample(
        title: 'Tamanho e cor',
        description: 'size e color mudam o tamanho e a cor.',
        sourcePath: '$_kPasta/icon_tamanho_cor.dart',
        builder: (_) => const IconTamanhoCor(),
      ),
      WidgetExample(
        title: 'Variantes',
        description: 'O mesmo ícone em padrão, outlined, rounded e sharp.',
        sourcePath: '$_kPasta/icon_variantes.dart',
        builder: (_) => const IconVariantes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Image',
    description: 'Mostra uma imagem do próprio app (asset) ou da internet.',
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(_kPaisagem, width: 120, height: 72, fit: BoxFit.cover),
    ),
    examples: [
      WidgetExample(
        title: 'Do app (asset)',
        description: 'Image.asset com um arquivo declarado no pubspec.yaml.',
        sourcePath: '$_kPasta/image_asset.dart',
        builder: (_) => const ImageAsset(),
      ),
      WidgetExample(
        title: 'Da internet',
        description: 'Image.network, com telas de carregando e de erro.',
        sourcePath: '$_kPasta/image_network.dart',
        builder: (_) => const ImageNetwork(),
      ),
      WidgetExample(
        title: 'Ajuste (fit)',
        description: 'BoxFit decide como a imagem cabe na caixa. Toque nas opções.',
        sourcePath: '$_kPasta/image_fit.dart',
        builder: (_) => const ImageFit(),
      ),
      WidgetExample(
        title: 'Cantos arredondados',
        description: 'ClipRRect recorta a imagem com cantos redondos.',
        sourcePath: '$_kPasta/image_cantos.dart',
        builder: (_) => const ImageCantos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CircleAvatar',
    description:
        'Um círculo com foto, iniciais ou ícone, para representar uma pessoa.',
    preview: const Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        CircleAvatar(child: Text('AS')),
        CircleAvatar(child: Icon(Icons.person)),
        CircleAvatar(backgroundImage: AssetImage(_kPaisagem)),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Iniciais e ícone',
        description: 'Um Text ou Icon como child.',
        sourcePath: '$_kPasta/circle_avatar_iniciais.dart',
        builder: (_) => const CircleAvatarIniciais(),
      ),
      WidgetExample(
        title: 'Com imagem',
        description: 'backgroundImage recorta a imagem em círculo.',
        sourcePath: '$_kPasta/circle_avatar_imagem.dart',
        builder: (_) => const CircleAvatarImagem(),
      ),
      WidgetExample(
        title: 'Tamanhos e cores',
        description: 'radius, backgroundColor e foregroundColor.',
        sourcePath: '$_kPasta/circle_avatar_tamanhos.dart',
        builder: (_) => const CircleAvatarTamanhos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Badge',
    description: 'Um selo sobre um ícone, para avisos ou contagens.',
    preview: Badge.count(
      count: 3,
      child: const Icon(Icons.notifications_outlined, size: 32),
    ),
    examples: [
      WidgetExample(
        title: 'Ponto',
        description: 'Sem label: só um ponto indicando novidade.',
        sourcePath: '$_kPasta/badge_ponto.dart',
        builder: (_) => const BadgePonto(),
      ),
      WidgetExample(
        title: 'Com número',
        description: 'label com um texto, ou Badge.count com limite de 99+.',
        sourcePath: '$_kPasta/badge_numero.dart',
        builder: (_) => const BadgeNumero(),
      ),
      WidgetExample(
        title: 'Contador',
        description: 'isLabelVisible esconde o selo quando a contagem é zero.',
        sourcePath: '$_kPasta/badge_contador.dart',
        builder: (_) => const BadgeContador(),
      ),
    ],
  ),
];
