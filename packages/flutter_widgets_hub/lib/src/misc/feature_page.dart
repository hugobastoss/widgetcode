import 'package:flutter/material.dart';

/// ## Propósito
/// Página centralizada com ícone, título, corpo de texto e um botão de
/// ação de largura cheia: generalização da página de onboarding, mas
/// igualmente útil pra estado vazio, tela de erro ou um cartão de
/// "ative o recurso X". Inclui um botão secundário opcional de texto
/// ([secondaryLabel]) abaixo do principal, pra ações como "pular"/"agora
/// não".
///
/// ## Uso
/// ```dart
/// HubFeaturePage(
///   icon: Icons.lock_outline,
///   title: 'Proteja seus dados',
///   body: 'Ative o bloqueio por PIN pra abrir o app com mais segurança.',
///   primaryLabel: 'Ativar agora',
///   onPrimaryPressed: _ativarBloqueio,
///   secondaryLabel: 'Agora não',
///   onSecondaryPressed: _pular,
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme, textTheme).
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubFeaturePage extends StatelessWidget {
  const HubFeaturePage({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
  });

  final IconData icon;
  final String title;
  final String body;
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 72, color: scheme.primary),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onPrimaryPressed,
              child: Text(primaryLabel),
            ),
          ),
          if (secondaryLabel != null) ...[
            const SizedBox(height: 4),
            TextButton(
              onPressed: onSecondaryPressed,
              child: Text(secondaryLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
