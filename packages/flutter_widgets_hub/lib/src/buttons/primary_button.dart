import 'package:flutter/material.dart';

/// ## Propósito
/// Botão primário de largura cheia, com um estado de carregamento
/// incorporado: enquanto [isLoading] é `true`, o rótulo some e um
/// indicador circular pequeno aparece no lugar, sem mudar o tamanho do
/// botão nem desmontar o `onPressed` (ele só vira `null` durante o
/// carregamento, impedindo toques duplicados).
///
/// ## Uso
/// ```dart
/// HubPrimaryButton(
///   label: 'Salvar',
///   isLoading: _salvando,
///   onPressed: _salvando ? null : _salvar,
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (estilo de `FilledButton` do tema
/// atual) e parâmetros próprios, seguro pra colar em qualquer projeto sem
/// nenhum arquivo extra.
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubPrimaryButton extends StatelessWidget {
  const HubPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.pillShaped = false,
  });

  /// Texto do botão. Some enquanto [isLoading] for `true`.
  final String label;

  /// Chamado ao tocar. Passe `null` pra desabilitar o botão (ex: durante
  /// validação ou enquanto [isLoading] já é `true`).
  final VoidCallback? onPressed;

  /// Troca o rótulo por um indicador de progresso pequeno, sem mudar a
  /// altura do botão.
  final bool isLoading;

  /// `true` deixa as bordas totalmente arredondadas (estilo "pill") em vez
  /// do raio padrão do tema.
  final bool pillShaped;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: pillShaped
            ? FilledButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 14),
              )
            : FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: scheme.onPrimary,
                ),
              )
            : Text(label),
      ),
    );
  }
}
