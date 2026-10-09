import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../models.dart';

const _kRepoBlobBase =
    'https://github.com/hugobastoss/flutterwidgetshub/blob/main/apps/showcase/';

/// Código-fonte de um exemplo, num painel que sobe de baixo por cima da
/// página do widget: começa na metade da tela e pode ser arrastado até
/// quase a tela toda. O texto vem do próprio arquivo do exemplo, empacotado
/// como asset — é o mesmo arquivo que roda na demo.
class CodeSheet extends StatefulWidget {
  const CodeSheet({
    super.key,
    required this.widgetName,
    required this.example,
  });

  final String widgetName;
  final WidgetExample example;

  static Future<void> show(
    BuildContext context, {
    required String widgetName,
    required WidgetExample example,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      // Sem isto, o painel ficaria limitado a metade da tela.
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => CodeSheet(widgetName: widgetName, example: example),
    );
  }

  @override
  State<CodeSheet> createState() => _CodeSheetState();
}

class _CodeSheetState extends State<CodeSheet> {
  late final Future<String> _codigo = rootBundle.loadString(
    widget.example.sourcePath,
  );

  // Uma SnackBar apareceria atrás do painel; a confirmação de "copiado" é o
  // próprio botão, que vira um ✓ por alguns segundos.
  _Copiado? _copiado;

  Future<void> _copiar(_Copiado oQue, String texto) async {
    await Clipboard.setData(ClipboardData(text: texto));
    if (!mounted) return;
    setState(() => _copiado = oQue);
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted || _copiado != oQue) return;
    setState(() => _copiado = null);
  }

  Future<void> _copiarCodigo() async =>
      _copiar(_Copiado.codigo, await _codigo);

  /// O pedido pronto para colar na IA de código: leva o ID do exemplo e o
  /// endereço do repositório (que a skill flutter-widgets-hub entende).
  Future<void> _copiarPedido() => _copiar(
    _Copiado.pedido,
    AppLocalizations.of(context).aiRequest(widget.example.id),
  );

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
    final textos = AppLocalizations.of(context);
    // Os arquivos de exemplo são escritos em português; em outro idioma, o
    // painel avisa antes do código.
    final comentariosEmOutroIdioma =
        Localizations.localeOf(context).languageCode != 'pt';

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 1,
      // Tudo dentro do painel é uma única rolagem ligada a ele: arrastar em
      // qualquer ponto primeiro abre o painel e depois rola o código.
      builder: (context, rolagem) => FutureBuilder<String>(
        future: _codigo,
        builder: (context, snapshot) => CustomScrollView(
          controller: rolagem,
          slivers: [
            SliverAppBar(
              pinned: true,
              primary: false,
              automaticallyImplyLeading: false,
              backgroundColor: cores.surfaceContainerLow,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.example.title.of(context)),
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
                  tooltip: _copiado == _Copiado.codigo
                      ? textos.codeCopied
                      : textos.copyCodeTooltip,
                  icon: Icon(
                    _copiado == _Copiado.codigo
                        ? Icons.check
                        : Icons.copy_outlined,
                  ),
                  onPressed: _copiarCodigo,
                ),
                IconButton(
                  tooltip: textos.openOnGitHubTooltip,
                  icon: const Icon(Icons.open_in_new),
                  onPressed: _abrirNoGitHub,
                ),
              ],
            ),
            // O ID do exemplo e o pedido pronto para a IA de código.
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: SelectableText(
                        widget.example.id,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                          color: cores.onSurfaceVariant,
                        ),
                      ),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: _copiarPedido,
                      icon: Icon(
                        _copiado == _Copiado.pedido
                            ? Icons.check
                            : Icons.smart_toy_outlined,
                      ),
                      label: Text(
                        _copiado == _Copiado.pedido
                            ? textos.aiRequestCopied
                            : textos.askAiButton,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (comentariosEmOutroIdioma)
              SliverToBoxAdapter(
                child: Container(
                  color: cores.secondaryContainer,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    spacing: 12,
                    children: [
                      Icon(
                        Icons.translate,
                        size: 18,
                        color: cores.onSecondaryContainer,
                      ),
                      Expanded(
                        child: Text(
                          textos.codeCommentsNote,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: cores.onSecondaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (snapshot.hasError)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text(textos.codeLoadError)),
              )
            else if (!snapshot.hasData)
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()),
              )
            else
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
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
              ),
          ],
        ),
      ),
    );
  }
}

/// Qual botão do painel acabou de copiar algo (e mostra o ✓).
enum _Copiado { codigo, pedido }
