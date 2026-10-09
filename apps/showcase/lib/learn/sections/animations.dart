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
    description: 'Um Container que anima sozinho quando seus valores mudam.',
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
        title: 'Tamanho, cor e cantos',
        description: 'Mude os valores com setState e veja a transição.',
        sourcePath: '$_kPasta/animated_container_basico.dart',
        builder: (_) => const AnimatedContainerBasico(),
      ),
      WidgetExample(
        title: 'Curvas',
        description: 'A mesma animação com curvas diferentes.',
        sourcePath: '$_kPasta/animated_container_curvas.dart',
        builder: (_) => const AnimatedContainerCurvas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'AnimatedOpacity',
    description: 'Faz um widget aparecer e sumir suavemente.',
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
        title: 'Aparecer e sumir',
        description: 'opacity de 1 para 0 com uma duração.',
        sourcePath: '$_kPasta/animated_opacity_basico.dart',
        builder: (_) => const AnimatedOpacityBasico(),
      ),
      WidgetExample(
        title: 'Sumir de verdade',
        description: 'Invisível ainda ocupa espaço: onEnd remove depois do fade.',
        sourcePath: '$_kPasta/animated_opacity_espaco.dart',
        builder: (_) => const AnimatedOpacityEspaco(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'AnimatedSwitcher',
    description: 'Anima a troca de um widget por outro.',
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
        title: 'Contador',
        description: 'Cada número novo entra com fade. A key faz a mágica.',
        sourcePath: '$_kPasta/animated_switcher_contador.dart',
        builder: (_) => const AnimatedSwitcherContador(),
      ),
      WidgetExample(
        title: 'Transição personalizada',
        description: 'transitionBuilder com ScaleTransition no ícone.',
        sourcePath: '$_kPasta/animated_switcher_transicao.dart',
        builder: (_) => const AnimatedSwitcherTransicao(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Hero',
    description: 'Um elemento que "voa" de uma tela para a outra.',
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
        title: 'Foto que abre',
        description: 'A mesma tag nas duas telas. Toque na foto.',
        sourcePath: '$_kPasta/hero_imagem.dart',
        builder: (_) => const HeroImagem(),
        usesHero: true,
      ),
      WidgetExample(
        title: 'Avatar e nome',
        description: 'Dois Heroes, e o Material que protege o texto no voo.',
        sourcePath: '$_kPasta/hero_perfil.dart',
        builder: (_) => const HeroPerfil(),
        usesHero: true,
      ),
    ],
  ),
  WidgetDoc(
    name: 'TweenAnimationBuilder',
    description: 'Anima qualquer valor — número, cor, tamanho — sem controller.',
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
        title: 'Número que conta',
        description: 'O saldo sobe contando até o valor novo.',
        sourcePath: '$_kPasta/tween_numero.dart',
        builder: (_) => const TweenNumero(),
      ),
      WidgetExample(
        title: 'Cor',
        description: 'ColorTween: o coração muda de cor suavemente.',
        sourcePath: '$_kPasta/tween_cor.dart',
        builder: (_) => const TweenCor(),
      ),
    ],
  ),
];
