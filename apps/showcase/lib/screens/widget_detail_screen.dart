import 'package:flutter/material.dart';
import 'package:flutter_widgets_hub/flutter_widgets_hub.dart';
import 'package:url_launcher/url_launcher.dart';

import '../catalog/catalog_data.dart';
import '../catalog/generated_snippets.g.dart';

const _kRepoBlobBase =
    'https://github.com/hugobastoss/flutterwidgetshub/blob/main/';

class WidgetDetailScreen extends StatefulWidget {
  const WidgetDetailScreen({super.key, required this.entry});

  final HubWidgetEntry entry;

  @override
  State<WidgetDetailScreen> createState() => _WidgetDetailScreenState();
}

class _WidgetDetailScreenState extends State<WidgetDetailScreen> {
  Brightness _previewBrightness = Brightness.light;

  // Estado local só das demos interativas — cada uma usa só os campos que
  // precisa, o resto fica no valor padrão sem efeito.
  ThemeMode _demoThemeMode = ThemeMode.system;
  String _demoLanguageCode = 'pt';
  bool _demoLoading = false;

  void _alternarBrilho() {
    setState(() {
      _previewBrightness = _previewBrightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    });
  }

  Future<void> _abrirNoGitHub() async {
    final url = Uri.parse('$_kRepoBlobBase${widget.entry.filePath}');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Widget _buildLiveDemo(BuildContext context) {
    switch (widget.entry.id) {
      case 'primary-button':
        return HubPrimaryButton(
          label: 'Salvar',
          isLoading: _demoLoading,
          onPressed: () {
            setState(() => _demoLoading = true);
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) setState(() => _demoLoading = false);
            });
          },
        );

      case 'confirmation-dialog':
        return HubPrimaryButton(
          label: 'Abrir diálogo',
          onPressed: () => HubConfirmationDialog.show(
            context,
            icon: Icons.delete_outline,
            title: 'Excluir item?',
            description: 'Essa ação não pode ser desfeita.',
            confirmLabel: 'Excluir',
            isDestructive: true,
          ),
        );

      case 'primary-fab':
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            HubPrimaryFab(onPressed: () {}),
            HubExtendedFab(label: 'Adicionar', onPressed: () {}),
          ],
        );

      case 'settings-section-label':
        return const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HubSettingsSectionLabel('Aparência'),
            SizedBox(height: 12),
            HubSettingsSectionLabel(
              'Notificações',
              variant: HubSectionLabelVariant.muted,
            ),
          ],
        );

      case 'settings-grouped-card':
        return const HubSettingsGroupedCard(
          children: [
            ListTile(
              leading: Icon(Icons.notifications_outlined),
              title: Text('Notificações'),
            ),
            ListTile(
              leading: Icon(Icons.language_outlined),
              title: Text('Idioma'),
            ),
          ],
        );

      case 'data-list-row':
        return HubDataListRow(
          leading: const CircleAvatar(child: Icon(Icons.person_outline)),
          title: const Text('Maria Souza'),
          subtitle: const Text('Última compra: hoje'),
          trailing: const Text('R\$ 150,00'),
          onTap: () {},
        );

      case 'appearance-selector':
        return HubAppearanceSelector(
          value: _demoThemeMode,
          onChanged: (modo) => setState(() => _demoThemeMode = modo),
        );

      case 'language-selector':
        return HubLanguageSelector(
          options: const [
            HubLanguageOption(code: 'pt', label: 'Português'),
            HubLanguageOption(code: 'en', label: 'English'),
            HubLanguageOption(code: 'es', label: 'Español'),
          ],
          selectedCode: _demoLanguageCode,
          onChanged: (codigo) => setState(() => _demoLanguageCode = codigo),
        );

      case 'feature-page':
        return HubFeaturePage(
          icon: Icons.lock_outline,
          title: 'Proteja seus dados',
          body: 'Ative o bloqueio por PIN pra abrir o app com mais segurança.',
          primaryLabel: 'Ativar agora',
          onPrimaryPressed: () {},
          secondaryLabel: 'Agora não',
          onSecondaryPressed: () {},
        );

      default:
        return Text('Sem demonstração pra "${widget.entry.id}".');
    }
  }

  @override
  Widget build(BuildContext context) {
    final entry = widget.entry;
    final snippet = kHubGeneratedSnippets[entry.id] ?? '// snippet não gerado';

    return Scaffold(
      appBar: AppBar(
        title: Text(entry.name),
        actions: [
          IconButton(
            tooltip: _previewBrightness == Brightness.light
                ? 'Pré-visualizar no escuro'
                : 'Pré-visualizar no claro',
            icon: Icon(
              _previewBrightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
            onPressed: _alternarBrilho,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(entry.description),
          const SizedBox(height: 16),
          Theme(
            data: ThemeData(brightness: _previewBrightness, useMaterial3: true),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _previewBrightness == Brightness.light
                    ? Colors.white
                    : const Color(0xFF121212),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Center(child: _buildLiveDemo(context)),
            ),
          ),
          const SizedBox(height: 24),
          Text('Código-fonte', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                snippet,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: _abrirNoGitHub,
            icon: const Icon(Icons.open_in_new),
            label: const Text('Ver no GitHub'),
          ),
        ],
      ),
    );
  }
}
