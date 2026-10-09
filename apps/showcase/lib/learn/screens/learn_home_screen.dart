import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../favorites.dart';
import '../locale_controller.dart';
import '../models.dart';
import '../sections.dart';
import '../theme_mode_controller.dart';
import 'favorites_screen.dart';
import 'help_screen.dart';
import 'section_screen.dart';
import 'settings_screen.dart';
import 'system_padding.dart';

/// Tela inicial: grade com todas as seções.
class LearnHomeScreen extends StatelessWidget {
  const LearnHomeScreen({
    super.key,
    required this.themeController,
    required this.localeController,
  });

  final ThemeModeController themeController;
  final LocaleController localeController;

  void _abrirSecao(BuildContext context, LearnSection secao) {
    if (secao.docs.isEmpty) {
      final textos = AppLocalizations.of(context);
      _avisar(context, textos.sectionUnderConstruction(secao.name.of(context)));
      return;
    }
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => SectionScreen(section: secao)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textos = AppLocalizations.of(context);
    final totalWidgets = kLearnSections.fold<int>(
      0,
      (soma, secao) => soma + secao.plannedWidgets.length,
    );
    // Depender do FavoritesScope reconstrói a tela quando um favorito muda.
    final quantosFavoritos = FavoritesScope.of(context).examples.length;

    return Scaffold(
      appBar: AppBar(
        // Com três ícones, o título não cabe inteiro num celular de 360 de
        // largura: encolhe um pouco em vez de ser cortado com "…".
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text('Flutter Widgets Hub'),
        ),
        actions: [
          // Como levar um exemplo para o próprio app (pela IA).
          IconButton(
            tooltip: textos.helpTitle,
            icon: const Icon(Icons.smart_toy_outlined),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const HelpScreen())),
          ),
          IconButton(
            tooltip: textos.favoritesTitle,
            // O número de favoritos, quando há algum.
            icon: Badge.count(
              count: quantosFavoritos,
              isLabelVisible: quantosFavoritos > 0,
              child: const Icon(Icons.star_outline),
            ),
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const FavoritesScreen())),
          ),
          IconButton(
            tooltip: textos.settingsTitle,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SettingsScreen(
                  themeController: themeController,
                  localeController: localeController,
                ),
              ),
            ),
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
                  textos.homeIntro,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                SearchBar(
                  hintText: textos.searchHint,
                  leading: const Icon(Icons.search),
                  elevation: const WidgetStatePropertyAll(0),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      child: Text(
                        textos.sectionsTitle,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      textos.homeSummary(kLearnSections.length, totalWidgets),
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
            padding: withSystemPadding(
              context,
              const EdgeInsets.fromLTRB(16, 0, 16, 24),
            ),
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
                    section.name.of(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(
                      context,
                    ).widgetCount(section.plannedWidgets.length),
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
