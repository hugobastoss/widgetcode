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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/buttons';

// Títulos que se repetem entre os widgets da seção.
const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');
const _padrao = Tr(pt: 'Padrão', en: 'Default', es: 'Estándar');
const _comIcone = Tr(pt: 'Com ícone', en: 'With icon', es: 'Con ícono');
const _construtorIcon = Tr(
  pt: 'O construtor .icon com ícone e texto.',
  en: 'The .icon constructor with an icon and a label.',
  es: 'El constructor .icon con ícono y texto.',
);

// As pré-visualizações dos cartões da seção não recebem toques (ver
// SectionScreen), então os botões só precisam de um onPressed não nulo pra
// aparecer habilitados.
void _semAcao() {}

final kButtonDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'ElevatedButton',
    description: const Tr(
      pt: 'Botão com sombra, para destacar a ação sobre fundos coloridos ou com imagem.',
      en: 'A button with a shadow, to make the action stand out over colored or image backgrounds.',
      es: 'Botón con sombra, para destacar la acción sobre fondos de color o con imagen.',
    ),
    preview: const ElevatedButton(onPressed: _semAcao, child: Text('Salvar')),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'O mínimo: um texto e a função chamada no toque.',
          en: 'The minimum: a label and the function called on tap.',
          es: 'Lo mínimo: un texto y la función que se llama al tocar.',
        ),
        sourcePath: '$_kPasta/elevated_button_basico.dart',
        builder: (_) => const ElevatedButtonBasico(),
      ),
      WidgetExample(
        title: _comIcone,
        description: const Tr(
          pt: 'O construtor .icon põe um ícone antes do texto.',
          en: 'The .icon constructor puts an icon before the label.',
          es: 'El constructor .icon pone un ícono antes del texto.',
        ),
        sourcePath: '$_kPasta/elevated_button_com_icone.dart',
        builder: (_) => const ElevatedButtonComIcone(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Carregando', en: 'Loading', es: 'Cargando'),
        description: const Tr(
          pt: 'Troca o texto por um indicador enquanto a ação roda e bloqueia novos toques.',
          en: 'Swaps the label for a spinner while the action runs and blocks new taps.',
          es: 'Cambia el texto por un indicador mientras la acción se ejecuta y bloquea nuevos toques.',
        ),
        sourcePath: '$_kPasta/elevated_button_carregando.dart',
        builder: (_) => const ElevatedButtonCarregando(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Desabilitado', en: 'Disabled', es: 'Deshabilitado'),
        description: const Tr(
          pt: 'Com onPressed: null o botão fica desabilitado. Use a chave para alternar.',
          en: 'With onPressed: null the button is disabled. Use the switch to toggle it.',
          es: 'Con onPressed: null el botón queda deshabilitado. Usa el interruptor para alternarlo.',
        ),
        sourcePath: '$_kPasta/elevated_button_desabilitado.dart',
        builder: (_) => const ElevatedButtonDesabilitado(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Cores personalizadas',
          en: 'Custom colors',
          es: 'Colores personalizados',
        ),
        description: const Tr(
          pt: 'styleFrom muda cor, sombra, espaçamento e formato.',
          en: 'styleFrom changes color, shadow, padding and shape.',
          es: 'styleFrom cambia el color, la sombra, el espaciado y la forma.',
        ),
        sourcePath: '$_kPasta/elevated_button_cores.dart',
        builder: (_) => const ElevatedButtonCores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FilledButton',
    description: const Tr(
      pt: 'Preenchido com a cor principal. Ideal para a ação mais importante da tela.',
      en: 'Filled with the primary color. Ideal for the most important action on the screen.',
      es: 'Relleno con el color principal. Ideal para la acción más importante de la pantalla.',
    ),
    preview: const FilledButton(onPressed: _semAcao, child: Text('Confirmar')),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'A ação principal da tela, na cor primária do tema.',
          en: "The main action on the screen, in the theme's primary color.",
          es: 'La acción principal de la pantalla, en el color primario del tema.',
        ),
        sourcePath: '$_kPasta/filled_button_basico.dart',
        builder: (_) => const FilledButtonBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Tonal', en: 'Tonal', es: 'Tonal'),
        description: const Tr(
          pt: 'A versão .tonal, mais suave, junto da padrão para comparar.',
          en: 'The softer .tonal version, next to the default one for comparison.',
          es: 'La versión .tonal, más suave, junto a la estándar para comparar.',
        ),
        sourcePath: '$_kPasta/filled_button_tonal.dart',
        builder: (_) => const FilledButtonTonal(),
      ),
      WidgetExample(
        title: _comIcone,
        description: _construtorIcon,
        sourcePath: '$_kPasta/filled_button_com_icone.dart',
        builder: (_) => const FilledButtonComIcone(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Largura total', en: 'Full width', es: 'Ancho completo'),
        description: const Tr(
          pt: 'Dentro de um SizedBox com largura infinita, ocupa a linha toda.',
          en: 'Inside a SizedBox with infinite width, it fills the whole row.',
          es: 'Dentro de un SizedBox con ancho infinito, ocupa toda la fila.',
        ),
        sourcePath: '$_kPasta/filled_button_largura_total.dart',
        builder: (_) => const FilledButtonLarguraTotal(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'OutlinedButton',
    description: const Tr(
      pt: 'Só com borda. Bom para ações secundárias, como Cancelar ou Voltar.',
      en: 'Border only. Good for secondary actions, like Cancel or Back.',
      es: 'Solo con borde. Bueno para acciones secundarias, como Cancelar o Volver.',
    ),
    preview: const OutlinedButton(onPressed: _semAcao, child: Text('Cancelar')),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Só a borda, sem preenchimento.',
          en: 'Just the border, no fill.',
          es: 'Solo el borde, sin relleno.',
        ),
        sourcePath: '$_kPasta/outlined_button_basico.dart',
        builder: (_) => const OutlinedButtonBasico(),
      ),
      WidgetExample(
        title: _comIcone,
        description: _construtorIcon,
        sourcePath: '$_kPasta/outlined_button_com_icone.dart',
        builder: (_) => const OutlinedButtonComIcone(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Borda personalizada',
          en: 'Custom border',
          es: 'Borde personalizado',
        ),
        description: const Tr(
          pt: 'styleFrom com side muda a cor e a espessura da borda.',
          en: 'styleFrom with side changes the border color and width.',
          es: 'styleFrom con side cambia el color y el grosor del borde.',
        ),
        sourcePath: '$_kPasta/outlined_button_borda.dart',
        builder: (_) => const OutlinedButtonBorda(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Destrutivo', en: 'Destructive', es: 'Destructivo'),
        description: const Tr(
          pt: 'Usa a cor de erro do tema para sinalizar uma ação perigosa.',
          en: "Uses the theme's error color to flag a dangerous action.",
          es: 'Usa el color de error del tema para señalar una acción peligrosa.',
        ),
        sourcePath: '$_kPasta/outlined_button_destrutivo.dart',
        builder: (_) => const OutlinedButtonDestrutivo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TextButton',
    description: const Tr(
      pt: 'Só com texto. Para ações discretas, como em diálogos e cartões.',
      en: 'Text only. For low-emphasis actions, like in dialogs and cards.',
      es: 'Solo texto. Para acciones discretas, como en diálogos y tarjetas.',
    ),
    preview: const TextButton(onPressed: _semAcao, child: Text('Saiba mais')),
    examples: [
      WidgetExample(
        title: _basico,
        description: const Tr(
          pt: 'Só o texto. O fundo aparece ao tocar.',
          en: 'Just the label. The background shows up on tap.',
          es: 'Solo el texto. El fondo aparece al tocar.',
        ),
        sourcePath: '$_kPasta/text_button_basico.dart',
        builder: (_) => const TextButtonBasico(),
      ),
      WidgetExample(
        title: _comIcone,
        description: _construtorIcon,
        sourcePath: '$_kPasta/text_button_com_icone.dart',
        builder: (_) => const TextButtonComIcone(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Em um diálogo', en: 'In a dialog', es: 'En un diálogo'),
        description: const Tr(
          pt: 'O uso mais comum: as ações de um AlertDialog.',
          en: 'The most common use: the actions of an AlertDialog.',
          es: 'El uso más común: las acciones de un AlertDialog.',
        ),
        sourcePath: '$_kPasta/text_button_dialogo.dart',
        builder: (_) => const TextButtonDialogo(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'IconButton',
    description: const Tr(
      pt: 'Só com ícone, para ações compactas como favoritar ou compartilhar.',
      en: 'Icon only, for compact actions like favorite or share.',
      es: 'Solo con ícono, para acciones compactas como marcar favorito o compartir.',
    ),
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
        title: _padrao,
        description: const Tr(
          pt: 'Um ícone tocável, com tooltip para acessibilidade.',
          en: 'A tappable icon, with a tooltip for accessibility.',
          es: 'Un ícono que se puede tocar, con tooltip para accesibilidad.',
        ),
        sourcePath: '$_kPasta/icon_button_padrao.dart',
        builder: (_) => const IconButtonPadrao(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Variantes de estilo',
          en: 'Style variants',
          es: 'Variantes de estilo',
        ),
        description: const Tr(
          pt: 'Padrão, .filled, .filledTonal e .outlined lado a lado.',
          en: 'Default, .filled, .filledTonal and .outlined side by side.',
          es: 'Estándar, .filled, .filledTonal y .outlined uno al lado del otro.',
        ),
        sourcePath: '$_kPasta/icon_button_variantes.dart',
        builder: (_) => const IconButtonVariantes(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Alternável', en: 'Toggleable', es: 'Alternable'),
        description: const Tr(
          pt: 'isSelected alterna entre dois ícones, como em favoritar.',
          en: 'isSelected switches between two icons, like a favorite button.',
          es: 'isSelected alterna entre dos íconos, como al marcar favorito.',
        ),
        sourcePath: '$_kPasta/icon_button_alternavel.dart',
        builder: (_) => const IconButtonAlternavel(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Tamanho e cor', en: 'Size and color', es: 'Tamaño y color'),
        description: const Tr(
          pt: 'iconSize e color mudam o tamanho e a cor do ícone.',
          en: 'iconSize and color change the size and color of the icon.',
          es: 'iconSize y color cambian el tamaño y el color del ícono.',
        ),
        sourcePath: '$_kPasta/icon_button_tamanho_cor.dart',
        builder: (_) => const IconButtonTamanhoCor(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'FloatingActionButton',
    description: const Tr(
      pt: 'Flutua sobre a tela, para a ação principal, como criar um item novo.',
      en: 'Floats over the screen, for the main action, like creating a new item.',
      es: 'Flota sobre la pantalla, para la acción principal, como crear un elemento nuevo.',
    ),
    preview: const FloatingActionButton(
      onPressed: _semAcao,
      child: Icon(Icons.add),
    ),
    examples: [
      WidgetExample(
        title: _padrao,
        description: const Tr(
          pt: 'O tamanho normal. Costuma ir no floatingActionButton do Scaffold.',
          en: "The regular size. It usually goes in the Scaffold's floatingActionButton.",
          es: 'El tamaño normal. Suele ir en el floatingActionButton del Scaffold.',
        ),
        sourcePath: '$_kPasta/fab_padrao.dart',
        builder: (_) => const FabPadrao(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Pequeno', en: 'Small', es: 'Pequeño'),
        description: const Tr(
          pt: '.small, para telas com pouco espaço.',
          en: '.small, for screens with little room.',
          es: '.small, para pantallas con poco espacio.',
        ),
        sourcePath: '$_kPasta/fab_pequeno.dart',
        builder: (_) => const FabPequeno(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Grande', en: 'Large', es: 'Grande'),
        description: const Tr(
          pt: '.large, para dar mais destaque à ação.',
          en: '.large, to give the action more emphasis.',
          es: '.large, para dar más protagonismo a la acción.',
        ),
        sourcePath: '$_kPasta/fab_grande.dart',
        builder: (_) => const FabGrande(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Estendido', en: 'Extended', es: 'Extendido'),
        description: const Tr(
          pt: '.extended, com ícone e texto.',
          en: '.extended, with an icon and a label.',
          es: '.extended, con ícono y texto.',
        ),
        sourcePath: '$_kPasta/fab_estendido.dart',
        builder: (_) => const FabEstendido(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SegmentedButton',
    description: const Tr(
      pt: 'Opções lado a lado no mesmo grupo. Permite escolher uma ou várias.',
      en: 'Options side by side in one group. Lets you pick one or several.',
      es: 'Opciones una al lado de la otra en un mismo grupo. Permite elegir una o varias.',
    ),
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
        title: const Tr(pt: 'Seleção única', en: 'Single selection', es: 'Selección única'),
        description: const Tr(
          pt: 'Só um segmento marcado por vez.',
          en: 'Only one segment selected at a time.',
          es: 'Solo un segmento marcado a la vez.',
        ),
        sourcePath: '$_kPasta/segmented_button_unica.dart',
        builder: (_) => const SegmentedButtonUnica(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Seleção múltipla',
          en: 'Multiple selection',
          es: 'Selección múltiple',
        ),
        description: const Tr(
          pt: 'multiSelectionEnabled permite marcar vários.',
          en: 'multiSelectionEnabled lets you select several.',
          es: 'multiSelectionEnabled permite marcar varios.',
        ),
        sourcePath: '$_kPasta/segmented_button_multipla.dart',
        builder: (_) => const SegmentedButtonMultipla(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com ícones', en: 'With icons', es: 'Con íconos'),
        description: const Tr(
          pt: 'Segmentos só com ícone, cada um com seu tooltip.',
          en: 'Icon-only segments, each with its own tooltip.',
          es: 'Segmentos solo con ícono, cada uno con su tooltip.',
        ),
        sourcePath: '$_kPasta/segmented_button_icones.dart',
        builder: (_) => const SegmentedButtonIcones(),
      ),
    ],
  ),
];
