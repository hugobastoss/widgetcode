import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../links.dart';
import '../locale_controller.dart';
import '../theme_mode_controller.dart';
import 'help_screen.dart';
import 'system_padding.dart';

const _kRepositorio = 'https://github.com/hugobastoss/widgetcode';

/// Configurações: tema, idioma, ajuda, compartilhar e avaliar, e o sobre.
/// Aberta pelo ícone de engrenagem da AppBar da tela inicial.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.themeController,
    required this.localeController,
  });

  final ThemeModeController themeController;
  final LocaleController localeController;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Versão e ID do app instalado, lidos uma vez ao abrir a tela.
  late final Future<PackageInfo> _info = PackageInfo.fromPlatform();

  Future<void> _abrir(Uri link) async {
    final aviso = ScaffoldMessenger.of(context);
    final falhou = AppLocalizations.of(context).openLinkFailed;
    bool abriu;
    try {
      // externalApplication: links da Play Store abrem no app da loja, e o
      // do GitHub no navegador, onde a pessoa já está logada.
      abriu = await launchUrl(link, mode: LaunchMode.externalApplication);
    } on PlatformException {
      abriu = false;
    }
    if (!abriu) {
      aviso
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(falhou)));
    }
  }

  Future<void> _compartilhar() async {
    final textos = AppLocalizations.of(context);
    final info = await _info;
    await SharePlus.instance.share(
      ShareParams(
        text: textos.shareMessage(playStoreAppUri(info.packageName).toString()),
      ),
    );
  }

  Future<void> _avaliar() async {
    final info = await _info;
    await _abrir(playStoreAppUri(info.packageName));
  }

  Future<void> _falarComSuporte() async {
    final textos = AppLocalizations.of(context);
    final info = await _info;
    await _abrir(
      newIssueUri(
        textos.supportIssueBody('${info.version} (${info.buildNumber})'),
      ),
    );
  }

  Future<void> _sobre() async {
    final textos = AppLocalizations.of(context);
    final cores = Theme.of(context).colorScheme;
    final info = await _info;
    if (!mounted) return;
    // AboutDialog do próprio Material: nome, versão, ícone e o botão
    // "Ver licenças", que lista as licenças dos pacotes usados no app.
    showAboutDialog(
      context: context,
      applicationName: 'WidgetCode: Widgets for Flutter',
      applicationVersion: '${info.version} (${info.buildNumber})',
      applicationIcon: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: cores.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.widgets_outlined, color: cores.primary),
      ),
      applicationLegalese: '© 2026 $kDeveloperName\n${textos.aboutLicense}',
      children: [
        const SizedBox(height: 16),
        Text(textos.aboutDescription),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () => launchUrl(
              Uri.parse(_kRepositorio),
              mode: LaunchMode.inAppBrowserView,
            ),
            icon: const Icon(Icons.open_in_new),
            label: Text(textos.helpOpenRepo),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textos = AppLocalizations.of(context);
    const abreFora = Icon(Icons.open_in_new, size: 20);

    return Scaffold(
      appBar: AppBar(title: Text(textos.settingsTitle)),
      body: ListView(
        padding: withSystemPadding(
          context,
          const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
        children: [
          _Rotulo(textos.settingsAppearance),
          _SeletorDeTema(controller: widget.themeController),
          _Rotulo(textos.settingsLanguage),
          _SeletorDeIdioma(controller: widget.localeController),
          _Rotulo(textos.settingsHelp),
          _Grupo(
            children: [
              ListTile(
                leading: const Icon(Icons.help_outline),
                title: Text(textos.helpTitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const HelpScreen())),
              ),
              ListTile(
                leading: const Icon(Icons.support_agent),
                title: Text(textos.contactSupport),
                subtitle: Text(textos.contactSupportSubtitle),
                trailing: abreFora,
                onTap: _falarComSuporte,
              ),
            ],
          ),
          _Rotulo(textos.settingsGeneral),
          _Grupo(
            children: [
              ListTile(
                leading: const Icon(Icons.share_outlined),
                title: Text(textos.shareApp),
                onTap: _compartilhar,
              ),
              ListTile(
                leading: const Icon(Icons.star_outline),
                title: Text(textos.rateApp),
                subtitle: Text(textos.rateAppSubtitle),
                trailing: abreFora,
                onTap: _avaliar,
              ),
              ListTile(
                leading: const Icon(Icons.apps),
                title: Text(textos.moreApps),
                subtitle: Text(textos.moreAppsSubtitle(kDeveloperName)),
                trailing: abreFora,
                onTap: () => _abrir(playStoreDeveloperUri()),
              ),
            ],
          ),
          _Rotulo(textos.settingsAbout),
          _Grupo(
            children: [
              // Desativados até os textos ficarem prontos.
              ListTile(
                enabled: false,
                leading: const Icon(Icons.description_outlined),
                title: Text(textos.termsOfUse),
                subtitle: Text(textos.comingSoon),
              ),
              ListTile(
                enabled: false,
                leading: const Icon(Icons.privacy_tip_outlined),
                title: Text(textos.privacyPolicy),
                subtitle: Text(textos.comingSoon),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(textos.aboutApp),
                trailing: const Icon(Icons.chevron_right),
                onTap: _sobre,
              ),
            ],
          ),
          const SizedBox(height: 24),
          FutureBuilder(
            future: _info,
            builder: (context, info) => Text(
              info.hasData
                  ? textos.versionLabel(
                      '${info.data!.version} (${info.data!.buildNumber})',
                    )
                  : '',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Título de um grupo de opções, em maiúsculas e na cor primária.
class _Rotulo extends StatelessWidget {
  const _Rotulo(this.texto);

  final String texto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 24, 4, 8),
      child: Text(
        texto.toUpperCase(),
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

/// Opções agrupadas num cartão, separadas por divisores.
class _Grupo extends StatelessWidget {
  const _Grupo({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) const Divider(height: 1),
            children[i],
          ],
        ],
      ),
    );
  }
}

/// Três amostras lado a lado (claro, escuro e automático), com a escolhida
/// em destaque.
class _SeletorDeTema extends StatelessWidget {
  const _SeletorDeTema({required this.controller});

  final ThemeModeController controller;

  @override
  Widget build(BuildContext context) {
    final textos = AppLocalizations.of(context);
    final opcoes = [
      (ThemeMode.light, textos.themeLight, const Color(0xFFFFFFFF)),
      (ThemeMode.dark, textos.themeDark, const Color(0xFF1A1A1A)),
      (ThemeMode.system, textos.themeSystem, null),
    ];

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: controller,
      // IntrinsicHeight + stretch: as três ficam da mesma altura mesmo quando
      // um rótulo quebra em duas linhas.
      builder: (context, atual, _) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            for (final (modo, rotulo, amostra) in opcoes)
              Expanded(
                child: _OpcaoDeTema(
                  rotulo: rotulo,
                  amostra: amostra,
                  selecionada: modo == atual,
                  onTap: () => controller.select(modo),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _OpcaoDeTema extends StatelessWidget {
  const _OpcaoDeTema({
    required this.rotulo,
    required this.amostra,
    required this.selecionada,
    required this.onTap,
  });

  final String rotulo;

  /// A cor da amostra; null mostra metade clara, metade escura (automático).
  final Color? amostra;
  final bool selecionada;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Semantics(
      selected: selecionada,
      inMutuallyExclusiveGroup: true,
      child: Material(
        color: selecionada
            ? cores.primaryContainer
            : cores.surfaceContainerHighest,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: selecionada ? cores.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            child: Column(
              spacing: 8,
              children: [
                Container(
                  width: 44,
                  height: 28,
                  decoration: BoxDecoration(
                    color: amostra,
                    gradient: amostra == null
                        ? const LinearGradient(
                            colors: [Color(0xFFFFFFFF), Color(0xFF1A1A1A)],
                            stops: [0.5, 0.5],
                          )
                        : null,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: cores.outlineVariant),
                  ),
                ),
                Text(
                  rotulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selecionada
                        ? cores.onPrimaryContainer
                        : cores.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Os idiomas do app, com um ✓ no que está em uso. Os nomes ficam no
/// próprio idioma, como é costume, para quem não lê o idioma atual.
///
/// Sem escolha salva, o app segue o idioma do celular, e o ✓ fica nesse
/// idioma. Tocar num idioma fixa o app nele.
class _SeletorDeIdioma extends StatelessWidget {
  const _SeletorDeIdioma({required this.controller});

  final LocaleController controller;

  static const _nomes = {'pt': 'Português', 'en': 'English', 'es': 'Español'};

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;
    // O idioma em uso de fato (o escolhido ou o do sistema). Quando a
    // escolha muda, o MaterialApp troca o idioma e esta tela se reconstrói.
    final emUso = Localizations.localeOf(context).languageCode;

    return _Grupo(
      children: [
        for (final idioma in LocaleController.supportedLocales)
          ListTile(
            title: Text(_nomes[idioma.languageCode]!),
            selected: idioma.languageCode == emUso,
            trailing: idioma.languageCode == emUso
                ? Icon(Icons.check, color: cores.primary)
                : null,
            onTap: () => controller.select(idioma),
          ),
      ],
    );
  }
}
