import 'package:flutter/material.dart';

import '../models.dart';
import 'code_screen.dart';

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
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        children: [
          Text(
            doc.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Exemplos (${doc.examples.length})',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          for (final (i, exemplo) in doc.examples.indexed) ...[
            if (i > 0) const SizedBox(height: 12),
            _ExampleCard(
              number: i + 1,
              example: exemplo,
              onShowCode: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      CodeScreen(widgetName: doc.name, example: exemplo),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({
    required this.number,
    required this.example,
    required this.onShowCode,
  });

  final int number;
  final WidgetExample example;
  final VoidCallback onShowCode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cores = theme.colorScheme;

    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$number · ${example.title}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  example.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cores.onSurfaceVariant,
                  ),
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
                onPressed: onShowCode,
                icon: const Icon(Icons.code),
                label: const Text('Código'),
              ),
            ),
          ),
        ],
      ),
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
        // A demo é interativa. HeroMode desligado pelo mesmo motivo da tela
        // da seção: vários FABs com a hero tag padrão.
        child: HeroMode(
          enabled: false,
          child: Builder(builder: example.builder),
        ),
      ),
    );
  }
}
