import 'package:flutter/material.dart';

import '../examples/animations/animated_container_basico.dart';
import '../examples/animations/animated_container_curvas.dart';
import '../examples/animations/animated_opacity_basico.dart';
import '../examples/animations/animated_opacity_espaco.dart';
import '../examples/animations/animated_switcher_contador.dart';
import '../examples/animations/animated_switcher_transicao.dart';
import '../examples/animations/hero_imagem.dart';
import '../examples/animations/hero_perfil.dart';
import '../examples/animations/tween_cor.dart';
import '../examples/animations/tween_numero.dart';
import '../models.dart';
import '../tr.dart';

const _kPasta = 'lib/learn/examples/animations';
const _kPaisagem = 'assets/images/paisagem.png';

Widget _caixa(Color cor, double tamanho, double raio) => Container(
  width: tamanho,
  height: tamanho,
  decoration: BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.circular(raio),
  ),
);

final kAnimationsDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'AnimatedContainer',
    description: const Tr(
      pt: 'Um Container que anima sozinho quando seus valores mudam.',
      en: 'A Container that animates on its own when its values change.',
      es: 'Un Container que se anima solo cuando cambian sus valores.',
    ),
    preview: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        _caixa(Colors.indigo, 24, 4),
        const Icon(Icons.arrow_forward, size: 16),
        _caixa(Colors.teal, 44, 22),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Tamanho, cor e cantos',
          en: 'Size, color and corners',
          es: 'Tamaño, color y esquinas',
        ),
        description: const Tr(
          pt: 'Mude os valores com setState e veja a transição.',
          en: 'Change the values with setState and watch the transition.',
          es: 'Cambia los valores con setState y mira la transición.',
        ),
        sourcePath: '$_kPasta/animated_container_basico.dart',
        builder: (_) => const AnimatedContainerBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Curvas', en: 'Curves', es: 'Curvas'),
        description: const Tr(
          pt: 'A mesma animação com curvas diferentes.',
          en: 'The same animation with different curves.',
          es: 'La misma animación con curvas diferentes.',
        ),
        sourcePath: '$_kPasta/animated_container_curvas.dart',
        builder: (_) => const AnimatedContainerCurvas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'AnimatedOpacity',
    description: const Tr(
      pt: 'Faz um widget aparecer e sumir suavemente.',
      en: 'Makes a widget fade in and out smoothly.',
      es: 'Hace que un widget aparezca y desaparezca suavemente.',
    ),
    preview: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        for (final opacidade in const [1.0, 0.6, 0.3, 0.1])
          Opacity(opacity: opacidade, child: _caixa(Colors.indigo, 28, 6)),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Aparecer e sumir',
          en: 'Fade in and out',
          es: 'Aparecer y desaparecer',
        ),
        description: const Tr(
          pt: 'opacity de 1 para 0 com uma duração.',
          en: 'opacity from 1 to 0 over a duration.',
          es: 'opacity de 1 a 0 con una duración.',
        ),
        sourcePath: '$_kPasta/animated_opacity_basico.dart',
        builder: (_) => const AnimatedOpacityBasico(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Sumir de verdade',
          en: 'Really disappear',
          es: 'Desaparecer de verdad',
        ),
        description: const Tr(
          pt: 'Invisível ainda ocupa espaço: onEnd remove depois do fade.',
          en: 'Invisible still takes up space: onEnd removes it after the fade.',
          es: 'Invisible todavía ocupa espacio: onEnd lo quita después del fade.',
        ),
        sourcePath: '$_kPasta/animated_opacity_espaco.dart',
        builder: (_) => const AnimatedOpacityEspaco(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'AnimatedSwitcher',
    description: const Tr(
      pt: 'Anima a troca de um widget por outro.',
      en: 'Animates swapping one widget for another.',
      es: 'Anima el cambio de un widget por otro.',
    ),
    preview: Builder(
      builder: (context) {
        final estilo = Theme.of(context).textTheme.headlineMedium;
        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Opacity(opacity: 0.3, child: Text('1', style: estilo)),
            const Icon(Icons.arrow_forward, size: 18),
            Text('2', style: estilo),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Contador', en: 'Counter', es: 'Contador'),
        description: const Tr(
          pt: 'Cada número novo entra com fade. A key faz a mágica.',
          en: 'Each new number fades in. The key does the magic.',
          es: 'Cada número nuevo entra con fade. La key hace la magia.',
        ),
        sourcePath: '$_kPasta/animated_switcher_contador.dart',
        builder: (_) => const AnimatedSwitcherContador(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Transição personalizada',
          en: 'Custom transition',
          es: 'Transición personalizada',
        ),
        description: const Tr(
          pt: 'transitionBuilder com ScaleTransition no ícone.',
          en: 'transitionBuilder with a ScaleTransition on the icon.',
          es: 'transitionBuilder con ScaleTransition en el ícono.',
        ),
        sourcePath: '$_kPasta/animated_switcher_transicao.dart',
        builder: (_) => const AnimatedSwitcherTransicao(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Hero',
    description: const Tr(
      pt: 'Um elemento que "voa" de uma tela para a outra.',
      en: 'An element that "flies" from one screen to another.',
      es: 'Un elemento que "vuela" de una pantalla a otra.',
    ),
    preview: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(_kPaisagem, width: 32, height: 20, fit: BoxFit.cover),
        ),
        const Icon(Icons.arrow_forward, size: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(_kPaisagem, width: 80, height: 50, fit: BoxFit.cover),
        ),
      ],
    ),
    examples: [
      WidgetExample(
        title: const Tr(pt: 'Foto que abre', en: 'Photo that opens', es: 'Foto que se abre'),
        description: const Tr(
          pt: 'A mesma tag nas duas telas. Toque na foto.',
          en: 'The same tag on both screens. Tap the photo.',
          es: 'La misma tag en las dos pantallas. Toca la foto.',
        ),
        sourcePath: '$_kPasta/hero_imagem.dart',
        builder: (_) => const HeroImagem(),
        usesHero: true,
      ),
      WidgetExample(
        title: const Tr(pt: 'Avatar e nome', en: 'Avatar and name', es: 'Avatar y nombre'),
        description: const Tr(
          pt: 'Dois Heroes, e o Material que protege o texto no voo.',
          en: 'Two Heroes, and the Material that protects the text in flight.',
          es: 'Dos Heroes y el Material que protege el texto durante el vuelo.',
        ),
        sourcePath: '$_kPasta/hero_perfil.dart',
        builder: (_) => const HeroPerfil(),
        usesHero: true,
      ),
    ],
  ),
  WidgetDoc(
    name: 'TweenAnimationBuilder',
    description: const Tr(
      pt: 'Anima qualquer valor — número, cor, tamanho — sem controller.',
      en: 'Animates any value — number, color, size — without a controller.',
      es: 'Anima cualquier valor (número, color, tamaño) sin controller.',
    ),
    preview: Builder(
      builder: (context) => Text(
        '0 → 100',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontFamily: 'monospace',
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Número que conta',
          en: 'Counting number',
          es: 'Número que cuenta',
        ),
        description: const Tr(
          pt: 'O saldo sobe contando até o valor novo.',
          en: 'The balance counts up to the new value.',
          es: 'El saldo sube contando hasta el valor nuevo.',
        ),
        sourcePath: '$_kPasta/tween_numero.dart',
        builder: (_) => const TweenNumero(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Cor', en: 'Color', es: 'Color'),
        description: const Tr(
          pt: 'ColorTween: o coração muda de cor suavemente.',
          en: 'ColorTween: the heart changes color smoothly.',
          es: 'ColorTween: el corazón cambia de color suavemente.',
        ),
        sourcePath: '$_kPasta/tween_cor.dart',
        builder: (_) => const TweenCor(),
      ),
    ],
  ),
];
