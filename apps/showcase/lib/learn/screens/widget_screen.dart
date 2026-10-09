import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../favorites.dart';
import '../models.dart';
import 'code_sheet.dart';
import 'system_padding.dart';

/// Página de um widget: quando usar e todos os exemplos empilhados, cada um
/// com a demo ao vivo e o botão que abre o código-fonte.
class WidgetScreen extends StatelessWidget {
  const WidgetScreen({super.key, required this.doc});

  final WidgetDoc doc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(doc.name)),
      body: ListView(
        padding: withSystemPadding(
          context,
          const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
        children: [
          Text(
            doc.description.of(context),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            AppLocalizations.of(context).examplesHeader(doc.examples.length),
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          for (final (i, exemplo) in doc.examples.indexed) ...[
            if (i > 0) const SizedBox(height: 12),
            ExampleCard(
              heading: '${i + 1} · ${exemplo.title.of(context)}',
              widgetName: doc.name,
              example: exemplo,
            ),
          ],
        ],
      ),
    );
  }
}

/// Um exemplo: título, descrição, demo ao vivo, estrela de favorito e o
/// botão que abre o código. Usado na página do widget e nos Favoritos.
class ExampleCard extends StatelessWidget {
  const ExampleCard({
    super.key,
    required this.heading,
    required this.widgetName,
    required this.example,
  });

  /// A linha de título — "1 · Básico" na página do widget,
  /// "ElevatedButton · Básico" nos Favoritos.
  final String heading;
  final String widgetName;
  final WidgetExample example;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cores = theme.colorScheme;
    final textos = AppLocalizations.of(context);
    final favoritos = FavoritesScope.of(context);
    final favorito = favoritos.contains(example.id);

    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 4, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heading,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          example.description.of(context),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: cores.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  tooltip: favorito
                      ? textos.favoriteRemove
                      : textos.favoriteAdd,
                  isSelected: favorito,
                  icon: const Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star, color: Colors.amber.shade700),
                  onPressed: () => favoritos.toggle(example.id),
                ),
              ],
            ),
          ),
          ExampleDemo(example: example),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => CodeSheet.show(
                  context,
                  widgetName: widgetName,
                  example: example,
                ),
                icon: const Icon(Icons.code),
                label: Text(textos.codeButton),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Zera os espaços que o sistema reserva (barra de status, barra de gestos,
/// teclado) para o filho. Telas em miniatura dentro de um cartão — um
/// Scaffold com AppBar, uma NavigationBar — senão reservariam esses espaços
/// como se ocupassem a tela inteira.
class WithoutSystemInsets extends StatelessWidget {
  const WithoutSystemInsets({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .removePadding(
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
          )
          .removeViewInsets(removeBottom: true)
          .removeViewPadding(
            removeTop: true,
            removeBottom: true,
            removeLeft: true,
            removeRight: true,
          ),
      child: child,
    );
  }
}

/// A área onde a demo de um exemplo roda. Pública porque os testes
/// renderizam cada exemplo nela, com as mesmas restrições de tamanho da
/// página de verdade — um exemplo que estoura aqui estoura no aparelho.
class ExampleDemo extends StatelessWidget {
  const ExampleDemo({super.key, required this.example});

  final WidgetExample example;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(24),
      constraints: const BoxConstraints(minHeight: 104),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      // Material transparente por cima do fundo colorido: ListTile e InkWell
      // pintam fundo de seleção e efeito de toque no Material mais próximo,
      // e sem este o mais próximo seria o do cartão — escondido pelo fundo.
      // Numa tela de verdade, quem faz esse papel é o Scaffold.
      child: Material(
        type: MaterialType.transparency,
        child: WithoutSystemInsets(
          // A demo é interativa. HeroMode desligado pelo mesmo motivo da
          // tela da seção (vários FABs com a hero tag padrão), exceto nos
          // exemplos que ensinam Hero.
          child: HeroMode(
            enabled: example.usesHero,
            child: Builder(builder: example.builder),
          ),
        ),
      ),
    );
  }
}
