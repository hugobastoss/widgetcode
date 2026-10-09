import 'package:flutter/material.dart';

/// Estilo visual de [HubSettingsSectionLabel]: as duas variantes reais
/// encontradas em apps de produção da família que originou este catálogo;
/// nenhuma das duas é "a certa", é uma escolha de cada app.
enum HubSectionLabelVariant {
  /// 14/600, cor primária do tema, mais em destaque.
  bold,

  /// 11/700, cor secundária/muted do tema, com leve espaçamento entre
  /// letras, mais discreto.
  muted,
}

/// ## Propósito
/// Rótulo de seção em caixa alta, usado antes de um grupo de opções (ex:
/// "APARÊNCIA", "NOTIFICAÇÕES") numa tela de Configurações. Duas variantes
/// de estilo via [variant]. Nenhuma é "a certa", é escolha de cada app.
///
/// ## Uso
/// ```dart
/// HubSettingsSectionLabel('Aparência'),
/// const SizedBox(height: 8),
/// HubSettingsGroupedCard(children: [...]),
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme, textTheme).
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubSettingsSectionLabel extends StatelessWidget {
  const HubSettingsSectionLabel(
    this.text, {
    super.key,
    this.variant = HubSectionLabelVariant.bold,
  });

  final String text;
  final HubSectionLabelVariant variant;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final upper = text.toUpperCase();

    return switch (variant) {
      HubSectionLabelVariant.bold => Text(
        upper,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: scheme.primary,
          letterSpacing: 0.3,
        ),
      ),
      HubSectionLabelVariant.muted => Text(
        upper,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: scheme.onSurfaceVariant,
          letterSpacing: 0.4,
        ),
      ),
    };
  }
}
