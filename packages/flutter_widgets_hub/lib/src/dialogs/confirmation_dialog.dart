import 'package:flutter/material.dart';

/// ## Propósito
/// Diálogo de confirmação pra ações destrutivas ou importantes (excluir,
/// sair, descartar alterações). Ícone centralizado, título, descrição,
/// botão primário de largura cheia (vermelho/erro quando [isDestructive] é
/// `true`) e um botão de texto "Cancelar" abaixo dele.
///
/// ## Uso
/// ```dart
/// final confirmou = await HubConfirmationDialog.show(
///   context,
///   icon: Icons.delete_outline,
///   title: 'Excluir item?',
///   description: 'Essa ação não pode ser desfeita.',
///   confirmLabel: 'Excluir',
///   isDestructive: true,
/// );
/// if (confirmou == true) {
///   // ...
/// }
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme, textTheme) e
/// componentes padrão do Material — seguro pra colar em qualquer projeto
/// sem nenhum arquivo extra.
///
/// ## Última verificação
/// 2026-10-08 — contra flutterwidgetshub main.
class HubConfirmationDialog extends StatelessWidget {
  const HubConfirmationDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.confirmLabel,
    this.cancelLabel = 'Cancelar',
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String description;
  final String confirmLabel;
  final String cancelLabel;

  /// `true` pinta o ícone e o botão de confirmação na cor de erro do tema,
  /// em vez da cor primária — use pra ações irreversíveis.
  final bool isDestructive;

  /// Mostra o diálogo e devolve `true` se o usuário confirmou, `false` se
  /// cancelou, ou `null` se fechou de outra forma (ex: botão voltar).
  static Future<bool?> show(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required String confirmLabel,
    String cancelLabel = 'Cancelar',
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => HubConfirmationDialog(
        icon: icon,
        title: title,
        description: description,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final corEnfase = isDestructive ? scheme.error : scheme.primary;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: corEnfase),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: isDestructive
                    ? FilledButton.styleFrom(backgroundColor: scheme.error)
                    : null,
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(confirmLabel),
              ),
            ),
            const SizedBox(height: 4),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelLabel),
            ),
          ],
        ),
      ),
    );
  }
}
