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
        title: const Text('Flutter Widgets Hub'),
        actions: [
          _LanguageMenu(controller: localeController),
          _ThemeMenu(controller: themeController),
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
                // Como levar um exemplo para o próprio app (pela IA).
                Card.filled(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  color: theme.colorScheme.secondaryContainer,
                  child: ListTile(
                    leading: const Icon(Icons.smart_toy_outlined),
                    title: Text(textos.helpCardTitle),
                    subtitle: Text(textos.helpCardSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    textColor: theme.colorScheme.onSecondaryContainer,
                    iconColor: theme.colorScheme.onSecondaryContainer,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HelpScreen()),
                    ),
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
                // Só aparece quando há algum exemplo favoritado.
                if (quantosFavoritos > 0) ...[
                  const SizedBox(height: 16),
                  Card.outlined(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: Icon(Icons.star, color: Colors.amber.shade700),
                      title: Text(textos.favoritesTitle),
                      subtitle: Text(textos.exampleCount(quantosFavoritos)),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const FavoritesScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
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

/// Botão da AppBar com o ícone do tema atual; abre as três opções, com um ✓
/// na escolhida.
class _ThemeMenu extends StatelessWidget {
  const _ThemeMenu({required this.controller});

  final ThemeModeController controller;

  static const _icones = {
    ThemeMode.light: Icons.light_mode_outlined,
    ThemeMode.dark: Icons.dark_mode_outlined,
    ThemeMode.system: Icons.brightness_auto_outlined,
  };

  @override
  Widget build(BuildContext context) {
    final textos = AppLocalizations.of(context);
    final rotulos = {
      ThemeMode.light: textos.themeLight,
      ThemeMode.dark: textos.themeDark,
      ThemeMode.system: textos.themeSystem,
    };

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: controller,
      builder: (context, atual, _) => PopupMenuButton<ThemeMode>(
        tooltip: textos.themeTooltip,
        icon: Icon(_icones[atual]),
        initialValue: atual,
        onSelected: controller.select,
        itemBuilder: (context) => [
          for (final rotulo in rotulos.entries)
            CheckedPopupMenuItem(
              value: rotulo.key,
              checked: rotulo.key == atual,
              child: Text(rotulo.value),
            ),
        ],
      ),
    );
  }
}

/// Botão da AppBar para escolher o idioma. Os nomes dos idiomas ficam no
/// próprio idioma, como é costume, para quem não lê o idioma atual.
class _LanguageMenu extends StatelessWidget {
  const _LanguageMenu({required this.controller});

  final LocaleController controller;

  // O PopupMenuButton trata o valor null como "fechou sem escolher", então
  // "seguir o sistema" vira um código próprio.
  static const _seguirSistema = 'system';
  static const _nomes = {'pt': 'Português', 'en': 'English', 'es': 'Español'};

  @override
  Widget build(BuildContext context) {
    final textos = AppLocalizations.of(context);

    return ValueListenableBuilder<Locale?>(
      valueListenable: controller,
      builder: (context, atual, _) {
        final codigoAtual = atual?.languageCode ?? _seguirSistema;
        return PopupMenuButton<String>(
          tooltip: textos.languageTooltip,
          icon: const Icon(Icons.translate),
          initialValue: codigoAtual,
          onSelected: (codigo) => controller.select(
            codigo == _seguirSistema ? null : Locale(codigo),
          ),
          itemBuilder: (context) => [
            for (final idioma in LocaleController.supportedLocales)
              CheckedPopupMenuItem(
                value: idioma.languageCode,
                checked: idioma.languageCode == codigoAtual,
                child: Text(_nomes[idioma.languageCode]!),
              ),
            const PopupMenuDivider(),
            CheckedPopupMenuItem(
              value: _seguirSistema,
              checked: codigoAtual == _seguirSistema,
              child: Text(textos.languageSystem),
            ),
          ],
        );
      },
    );
  }
}

void _avisar(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(mensagem)));
}
