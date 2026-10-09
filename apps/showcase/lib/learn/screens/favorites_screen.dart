import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/app_localizations.dart';
import '../favorites.dart';
import 'system_padding.dart';
import 'widget_screen.dart';

/// Os exemplos favoritados, funcionando como na página do widget, e um botão
/// que copia um pedido só para a IA trazer todos de uma vez.
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _pedidoCopiado = false;

  Future<void> _pedirTodos(List<String> ids) async {
    final textos = AppLocalizations.of(context);
    final lista = ids.map((id) => '"$id"').join(', ');
    await Clipboard.setData(ClipboardData(text: textos.aiRequestMany(lista)));
    if (!mounted) return;
    setState(() => _pedidoCopiado = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _pedidoCopiado = false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textos = AppLocalizations.of(context);
    final favoritos = FavoritesScope.of(context).examples;

    return Scaffold(
      appBar: AppBar(title: Text(textos.favoritesTitle)),
      body: favoritos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  textos.favoritesEmpty,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            )
          : ListView(
              padding: withSystemPadding(
                context,
                const EdgeInsets.fromLTRB(16, 0, 16, 24),
              ),
              children: [
                FilledButton.tonalIcon(
                  onPressed: () => _pedirTodos([
                    for (final (_, exemplo) in favoritos) exemplo.id,
                  ]),
                  icon: Icon(
                    _pedidoCopiado ? Icons.check : Icons.smart_toy_outlined,
                  ),
                  label: Text(
                    _pedidoCopiado
                        ? textos.aiRequestCopied
                        : textos.askAiAllButton,
                  ),
                ),
                const SizedBox(height: 16),
                for (final (i, (doc, exemplo)) in favoritos.indexed) ...[
                  if (i > 0) const SizedBox(height: 12),
                  ExampleCard(
                    // Fora da página do widget, o título diz de qual widget é.
                    heading: '${doc.name} · ${exemplo.title.of(context)}',
                    widgetName: doc.name,
                    example: exemplo,
                  ),
                ],
              ],
            ),
    );
  }
}
