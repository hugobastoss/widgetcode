import 'package:flutter/material.dart';

/// ## Propósito
/// O FAB "principal" de criação de uma tela: um só por app, circular,
/// sempre no centro inferior. Pensado pra ser a única ação de criação de
/// destaque de uma aba (ex: "nova venda", "novo item"), não pra ações
/// secundárias dentro de um fluxo já aberto (ver [HubExtendedFab] abaixo
/// pra esse caso).
///
/// ## Uso
/// ```dart
/// Scaffold(
///   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
///   floatingActionButton: HubPrimaryFab(onPressed: _abrirCriacao),
///   // ...
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (cor/forma padrão do FAB), seguro
/// pra colar em qualquer projeto sem nenhum arquivo extra.
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubPrimaryFab extends StatelessWidget {
  const HubPrimaryFab({
    super.key,
    required this.onPressed,
    this.icon = Icons.add,
    this.tooltip,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: tooltip,
        child: Icon(icon),
      ),
    );
  }
}

/// ## Propósito
/// Variante **deliberada**, não um substituto do [HubPrimaryFab]: um FAB
/// com rótulo de texto, alinhado à direita (`endFloat`) em vez de
/// centralizado. Use pra uma ação secundária/contextual dentro de um fluxo
/// já aberto (ex: "adicionar item" dentro do detalhe de uma lista), onde
/// o rótulo ajuda a diferenciar essa ação da ação de criação principal da
/// aba (que continua sendo um [HubPrimaryFab] centralizado em outra tela).
///
/// ## Uso
/// ```dart
/// Scaffold(
///   floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
///   floatingActionButton: HubExtendedFab(label: 'Adicionar', onPressed: _adicionar),
///   // ...
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma.
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubExtendedFab extends StatelessWidget {
  const HubExtendedFab({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.add,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
