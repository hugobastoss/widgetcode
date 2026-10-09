import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import 'system_padding.dart';

const _kRepositorio = 'https://github.com/hugobastoss/flutterwidgetshub';

/// Explica como levar um exemplo do app para o projeto do dev: pela IA de
/// código, que recebe a referência do repositório (a skill ou o endereço) e
/// o pedido copiado no painel de código — ou à mão, copiando o código.
class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textos = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(textos.helpTitle)),
      body: ListView(
        padding: withSystemPadding(
          context,
          const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
        children: [
          Text(
            textos.helpIntro,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          _Passo(
            numero: '1',
            titulo: textos.helpStep1Title,
            texto: textos.helpStep1Body,
          ),
          _Passo(
            numero: '2',
            titulo: textos.helpStep2Title,
            texto: textos.helpStep2Body,
          ),
          _Passo(
            numero: '3',
            titulo: textos.helpStep3Title,
            texto: textos.helpStep3Body,
          ),
          const Divider(height: 32),
          _Passo(
            icone: Icons.content_copy_outlined,
            titulo: textos.helpManualTitle,
            texto: textos.helpManualBody,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              onPressed: () => launchUrl(
                Uri.parse(_kRepositorio),
                mode: LaunchMode.inAppBrowserView,
              ),
              icon: const Icon(Icons.open_in_new),
              label: Text(textos.helpOpenRepo),
            ),
          ),
        ],
      ),
    );
  }
}

class _Passo extends StatelessWidget {
  const _Passo({
    this.numero,
    this.icone,
    required this.titulo,
    required this.texto,
  });

  final String? numero;
  final IconData? icone;
  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cores = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: cores.primaryContainer,
            foregroundColor: cores.onPrimaryContainer,
            child: numero != null
                ? Text(
                    numero!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                : Icon(icone, size: 18),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(titulo, style: theme.textTheme.titleMedium),
                Text(
                  texto,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: cores.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
