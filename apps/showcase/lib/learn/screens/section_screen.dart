import 'package:flutter/material.dart';

import '../models.dart';
import 'widget_screen.dart';

/// Lista os widgets de uma seção. Cada cartão desenha o widget real como
/// pré-visualização, mas sem receber toques: o toque vai pro cartão inteiro,
/// que abre a página do widget.
class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key, required this.section});

  final LearnSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final docs = section.docs;

    return Scaffold(
      appBar: AppBar(
        title: Text(section.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${docs.length} widgets',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: docs.length + 1,
        separatorBuilder: (_, i) => SizedBox(height: i == 0 ? 20 : 12),
        itemBuilder: (context, i) {
          if (i == 0) {
            return Text(
              section.intro,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            );
          }
          final doc = docs[i - 1];
          return _WidgetCard(
            doc: doc,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => WidgetScreen(doc: doc)),
            ),
          );
        },
      ),
    );
  }
}

class _WidgetCard extends StatelessWidget {
  const _WidgetCard({required this.doc, required this.onTap});

  final WidgetDoc doc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cores = theme.colorScheme;

    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 88,
              color: cores.surfaceContainer,
              alignment: Alignment.center,
              // HeroMode desligado: vários FABs na mesma tela teriam a mesma
              // hero tag padrão e quebrariam a transição de rota.
              child: WithoutSystemInsets(
                child: HeroMode(
                  enabled: false,
                  child: IgnorePointer(
                    child: ExcludeSemantics(child: doc.preview),
                  ),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: cores.outlineVariant),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          doc.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontFamily: 'monospace',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: cores.onSurfaceVariant,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doc.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: cores.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: cores.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${doc.examples.length} exemplos',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: cores.onSecondaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          doc.examples.map((e) => e.title).join(' · '),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cores.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
