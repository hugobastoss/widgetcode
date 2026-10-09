import 'package:flutter/material.dart';

import '../models.dart';
import '../sections.dart';
import 'section_screen.dart';

/// Tela inicial: grade com todas as seções.
class LearnHomeScreen extends StatelessWidget {
  const LearnHomeScreen({super.key});

  void _abrirSecao(BuildContext context, LearnSection secao) {
    if (secao.docs.isEmpty) {
      _avisar(context, 'Seção "${secao.name}" em construção.');
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SectionScreen(section: secao)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalWidgets = kLearnSections.fold<int>(
      0,
      (soma, secao) => soma + secao.plannedWidgets.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Widgets Hub'),
        actions: [
          IconButton(
            tooltip: 'Alternar tema claro ou escuro',
            icon: const Icon(Icons.dark_mode_outlined),
            onPressed: () =>
                _avisar(context, 'Troca de tema ainda não implementada.'),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            sliver: SliverList.list(
              children: [
                Text(
                  'Aprenda os widgets nativos do Flutter com exemplos que rodam de verdade.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                const SearchBar(
                  hintText: 'Buscar widget, ex.: ListView',
                  leading: Icon(Icons.search),
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      child: Text('Seções', style: theme.textTheme.titleMedium),
                    ),
                    Text(
                      '${kLearnSections.length} seções · $totalWidgets widgets',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 108,
              ),
              itemCount: kLearnSections.length,
              itemBuilder: (context, i) {
                final secao = kLearnSections[i];
                return _SectionTile(
                  section: secao,
                  onTap: () => _abrirSecao(context, secao),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  const _SectionTile({required this.section, required this.onTap});

  final LearnSection section;
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
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: cores.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(section.icon, size: 20, color: cores.primary),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${section.plannedWidgets.length} widgets',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: cores.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _avisar(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(mensagem)));
}
