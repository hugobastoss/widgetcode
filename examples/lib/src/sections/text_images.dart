import 'package:flutter/material.dart';

import '../../text_images/badge_contador.dart';
import '../../text_images/badge_numero.dart';
import '../../text_images/badge_ponto.dart';
import '../../text_images/circle_avatar_imagem.dart';
import '../../text_images/circle_avatar_iniciais.dart';
import '../../text_images/circle_avatar_tamanhos.dart';
import '../../text_images/icon_basico.dart';
import '../../text_images/icon_tamanho_cor.dart';
import '../../text_images/icon_variantes.dart';
import '../../text_images/image_asset.dart';
import '../../text_images/image_cantos.dart';
import '../../text_images/image_fit.dart';
import '../../text_images/image_network.dart';
import '../../text_images/rich_text_basico.dart';
import '../../text_images/rich_text_icone.dart';
import '../../text_images/rich_text_text_rich.dart';
import '../../text_images/selectable_text_area.dart';
import '../../text_images/selectable_text_basico.dart';
import '../../text_images/text_basico.dart';
import '../../text_images/text_estilo.dart';
import '../../text_images/text_longo.dart';
import '../../text_images/text_tema.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/text_images';
const _kPaisagem = 'assets/images/paisagem.png';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

final kTextImagesDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'Text',
    description: const Tr(
      pt: 'Mostra um texto na tela, com o estilo que você quiser.',
      en: 'Shows text on screen, in any style you want.',
      es: 'Muestra un texto en la pantalla, con el estilo que quieras.',
    ),
    preview: Builder(
      builder: (context) => Text(
        'Olá, Flutter!',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    ),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Só o texto, com o estilo padrão do tema.',
          en: "Just the text, with the theme's default style.",
          es: 'Solo el texto, con el estilo predeterminado del tema.',
        ),
        sourcePath: '$_kPasta/text_basico.dart',
        builder: (_) => const TextBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Estilo', en: 'Style', es: 'Estilo'),
        description: const Tr(
          pt: 'TextStyle: tamanho, peso, cor, itálico, sublinhado.',
          en: 'TextStyle: size, weight, color, italic, underline.',
          es: 'TextStyle: tamaño, grosor, color, cursiva, subrayado.',
        ),
        sourcePath: '$_kPasta/text_estilo.dart',
        builder: (_) => const TextEstilo(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Estilos do tema',
          en: 'Theme styles',
          es: 'Estilos del tema',
        ),
        description: const Tr(
          pt: 'Os tamanhos prontos do textTheme, em vez de números soltos.',
          en: 'The ready-made textTheme sizes, instead of loose numbers.',
          es: 'Los tamaños predefinidos del textTheme, en lugar de números sueltos.',
        ),
        sourcePath: '$_kPasta/text_tema.dart',
        builder: (_) => const TextTema(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Texto longo', en: 'Long text', es: 'Texto largo'),
        description: const Tr(
          pt: 'maxLines e overflow cortam com "...". Toque em Ver mais.',
          en: 'maxLines and overflow cut it off with "...". Tap the button to expand.',
          es: 'maxLines y overflow lo cortan con "...". Toca el botón para expandir.',
        ),
        sourcePath: '$_kPasta/text_longo.dart',
        builder: (_) => const TextLongo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'RichText',
    description: const Tr(
      pt: 'Um texto com partes de estilos diferentes.',
      en: 'Text with parts in different styles.',
      es: 'Un texto con partes de estilos diferentes.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Uma árvore de TextSpan, cada pedaço com seu estilo.',
          en: 'A tree of TextSpans, each piece with its own style.',
          es: 'Un árbol de TextSpan, cada parte con su estilo.',
        ),
        sourcePath: '$_kPasta/rich_text_basico.dart',
        builder: (_) => const RichTextBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Text.rich', en: 'Text.rich', es: 'Text.rich'),
        description: const Tr(
          pt: 'O atalho recomendado, que já herda o estilo do app.',
          en: "The recommended shortcut, which already inherits the app's style.",
          es: 'El atajo recomendado, que ya hereda el estilo de la app.',
        ),
        sourcePath: '$_kPasta/rich_text_text_rich.dart',
        builder: (_) => const RichTextTextRich(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Ícone no texto',
          en: 'Icon in text',
          es: 'Ícono en el texto',
        ),
        description: const Tr(
          pt: 'WidgetSpan coloca um widget no meio da frase.',
          en: 'WidgetSpan puts a widget in the middle of a sentence.',
          es: 'WidgetSpan coloca un widget en medio de la frase.',
        ),
        sourcePath: '$_kPasta/rich_text_icone.dart',
        builder: (_) => const RichTextIcone(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SelectableText',
    description: const Tr(
      pt: 'Um texto que a pessoa pode selecionar e copiar.',
      en: 'Text that people can select and copy.',
      es: 'Un texto que se puede seleccionar y copiar.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Toque e segure para selecionar e copiar.',
          en: 'Touch and hold to select and copy.',
          es: 'Mantén pulsado para seleccionar y copiar.',
        ),
        sourcePath: '$_kPasta/selectable_text_basico.dart',
        builder: (_) => const SelectableTextBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'SelectionArea',
          en: 'SelectionArea',
          es: 'SelectionArea',
        ),
        description: const Tr(
          pt: 'Deixa vários textos selecionáveis de uma vez.',
          en: 'Makes several texts selectable at once.',
          es: 'Hace que varios textos se puedan seleccionar a la vez.',
        ),
        sourcePath: '$_kPasta/selectable_text_area.dart',
        builder: (_) => const SelectableTextArea(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Icon',
    description: const Tr(
      pt: 'Desenha um ícone do Material Design, com tamanho e cor.',
      en: 'Draws a Material Design icon, with a size and a color.',
      es: 'Dibuja un ícono de Material Design, con tamaño y color.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Ícones da classe Icons, no tamanho padrão.',
          en: 'Icons from the Icons class, at the default size.',
          es: 'Íconos de la clase Icons, en el tamaño predeterminado.',
        ),
        sourcePath: '$_kPasta/icon_basico.dart',
        builder: (_) => const IconBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Tamanho e cor',
          en: 'Size and color',
          es: 'Tamaño y color',
        ),
        description: const Tr(
          pt: 'size e color mudam o tamanho e a cor.',
          en: 'size and color change the size and the color.',
          es: 'size y color cambian el tamaño y el color.',
        ),
        sourcePath: '$_kPasta/icon_tamanho_cor.dart',
        builder: (_) => const IconTamanhoCor(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Variantes', en: 'Variants', es: 'Variantes'),
        description: const Tr(
          pt: 'O mesmo ícone em padrão, outlined, rounded e sharp.',
          en: 'The same icon as default, outlined, rounded and sharp.',
          es: 'El mismo ícono en estándar, outlined, rounded y sharp.',
        ),
        sourcePath: '$_kPasta/icon_variantes.dart',
        builder: (_) => const IconVariantes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Image',
    description: const Tr(
      pt: 'Mostra uma imagem do próprio app (asset) ou da internet.',
      en: 'Shows an image bundled with the app (asset) or from the internet.',
      es: 'Muestra una imagen de la propia app (asset) o de internet.',
    ),
    preview: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(_kPaisagem, width: 120, height: 72, fit: BoxFit.cover),
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Do app (asset)',
          en: 'From the app (asset)',
          es: 'De la app (asset)',
        ),
        description: const Tr(
          pt: 'Image.asset com um arquivo declarado no pubspec.yaml.',
          en: 'Image.asset with a file declared in pubspec.yaml.',
          es: 'Image.asset con un archivo declarado en pubspec.yaml.',
        ),
        sourcePath: '$_kPasta/image_asset.dart',
        builder: (_) => const ImageAsset(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Da internet',
          en: 'From the internet',
          es: 'De internet',
        ),
        description: const Tr(
          pt: 'Image.network, com telas de carregando e de erro.',
          en: 'Image.network, with loading and error placeholders.',
          es: 'Image.network, con pantallas de carga y de error.',
        ),
        sourcePath: '$_kPasta/image_network.dart',
        builder: (_) => const ImageNetwork(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Ajuste (fit)', en: 'Fit', es: 'Ajuste (fit)'),
        description: const Tr(
          pt: 'BoxFit decide como a imagem cabe na caixa. Toque nas opções.',
          en: 'BoxFit decides how the image fits the box. Tap the options.',
          es: 'BoxFit decide cómo cabe la imagen en la caja. Toca las opciones.',
        ),
        sourcePath: '$_kPasta/image_fit.dart',
        builder: (_) => const ImageFit(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Cantos arredondados',
          en: 'Rounded corners',
          es: 'Esquinas redondeadas',
        ),
        description: const Tr(
          pt: 'ClipRRect recorta a imagem com cantos redondos.',
          en: 'ClipRRect clips the image with rounded corners.',
          es: 'ClipRRect recorta la imagen con esquinas redondeadas.',
        ),
        sourcePath: '$_kPasta/image_cantos.dart',
        builder: (_) => const ImageCantos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'CircleAvatar',
    description: const Tr(
      pt: 'Um círculo com foto, iniciais ou ícone, para representar uma pessoa.',
      en: 'A circle with a photo, initials or an icon, to represent a person.',
      es: 'Un círculo con foto, iniciales o ícono, para representar a una persona.',
    ),
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
        title: const Tr(
          pt: 'Iniciais e ícone',
          en: 'Initials and icon',
          es: 'Iniciales e ícono',
        ),
        description: const Tr(
          pt: 'Um Text ou Icon como child.',
          en: 'A Text or an Icon as the child.',
          es: 'Un Text o un Icon como child.',
        ),
        sourcePath: '$_kPasta/circle_avatar_iniciais.dart',
        builder: (_) => const CircleAvatarIniciais(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com imagem',
          en: 'With an image',
          es: 'Con imagen',
        ),
        description: const Tr(
          pt: 'backgroundImage recorta a imagem em círculo.',
          en: 'backgroundImage crops the image into a circle.',
          es: 'backgroundImage recorta la imagen en círculo.',
        ),
        sourcePath: '$_kPasta/circle_avatar_imagem.dart',
        builder: (_) => const CircleAvatarImagem(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Tamanhos e cores',
          en: 'Sizes and colors',
          es: 'Tamaños y colores',
        ),
        description: const Tr(
          pt: 'radius, backgroundColor e foregroundColor.',
          en: 'radius, backgroundColor and foregroundColor.',
          es: 'radius, backgroundColor y foregroundColor.',
        ),
        sourcePath: '$_kPasta/circle_avatar_tamanhos.dart',
        builder: (_) => const CircleAvatarTamanhos(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Badge',
    description: const Tr(
      pt: 'Um selo sobre um ícone, para avisos ou contagens.',
      en: 'A badge on an icon, for alerts or counts.',
      es: 'Una insignia sobre un ícono, para avisos o contadores.',
    ),
    preview: Badge.count(
      count: 3,
      child: const Icon(Icons.notifications_outlined, size: 32),
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Ponto', en: 'Dot', es: 'Punto'),
        description: const Tr(
          pt: 'Sem label: só um ponto indicando novidade.',
          en: 'No label: just a dot to signal something new.',
          es: 'Sin label: solo un punto que indica una novedad.',
        ),
        sourcePath: '$_kPasta/badge_ponto.dart',
        builder: (_) => const BadgePonto(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Com número',
          en: 'With a number',
          es: 'Con número',
        ),
        description: const Tr(
          pt: 'label com um texto, ou Badge.count com limite de 99+.',
          en: 'label with a text, or Badge.count with a 99+ cap.',
          es: 'label con un texto, o Badge.count con límite de 99+.',
        ),
        sourcePath: '$_kPasta/badge_numero.dart',
        builder: (_) => const BadgeNumero(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Contador', en: 'Counter', es: 'Contador'),
        description: const Tr(
          pt: 'isLabelVisible esconde o selo quando a contagem é zero.',
          en: 'isLabelVisible hides the badge when the count is zero.',
          es: 'isLabelVisible oculta la insignia cuando el contador es cero.',
        ),
        sourcePath: '$_kPasta/badge_contador.dart',
        builder: (_) => const BadgeContador(),
      ),
    ],
  ),
];
