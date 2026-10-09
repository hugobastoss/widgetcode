import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models.dart';

const _kRepoBlobBase =
    'https://github.com/hugobastoss/flutterwidgetshub/blob/main/apps/showcase/';

/// Código-fonte de um exemplo. O texto vem do próprio arquivo do exemplo,
/// empacotado como asset — é o mesmo arquivo que roda na demo.
class CodeScreen extends StatefulWidget {
  const CodeScreen({
    super.key,
    required this.widgetName,
    required this.example,
  });

  final String widgetName;
  final WidgetExample example;

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  late final Future<String> _codigo = rootBundle.loadString(
    widget.example.sourcePath,
  );

  Future<void> _copiar() async {
    final codigo = await _codigo;
    await Clipboard.setData(ClipboardData(text: codigo));
    if (!mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Código copiado.')));
  }

  Future<void> _abrirNoGitHub() async {
    // inAppBrowserView abre por cima do app (Custom Tabs no Android,
    // SFSafariViewController no iOS) — a pessoa volta com o "X".
    final url = Uri.parse('$_kRepoBlobBase${widget.example.sourcePath}');
    await launchUrl(url, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cores = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.example.title),
            Text(
              widget.widgetName,
              style: theme.textTheme.bodySmall?.copyWith(
                color: cores.onSurfaceVariant,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Copiar código',
            icon: const Icon(Icons.copy_outlined),
            onPressed: _copiar,
          ),
          IconButton(
            tooltip: 'Abrir no GitHub',
            icon: const Icon(Icons.open_in_new),
            onPressed: _abrirNoGitHub,
          ),
        ],
      ),
      backgroundColor: cores.surfaceContainerLow,
      body: FutureBuilder<String>(
        future: _codigo,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Não foi possível carregar o código.'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SelectableText(
                snapshot.data!,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  height: 1.5,
                  color: cores.onSurface,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
