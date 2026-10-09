import 'package:flutter/material.dart';

/// ## Propósito
/// Linha de lista de dados (vendas, contatos, pedidos: qualquer coisa
/// repetida e rolável). Deliberadamente **não** é o widget `Card`: sem
/// elevação, uma superfície plana com borda fina, pra parecer mais densa e
/// tabular do que uma linha de configuração (ver [HubSettingsGroupedCard]
/// pra esse outro caso).
///
/// ## Uso
/// ```dart
/// HubDataListRow(
///   leading: const CircleAvatar(child: Icon(Icons.person_outline)),
///   title: const Text('Maria Souza'),
///   subtitle: const Text('Última compra: hoje'),
///   trailing: const Text('R\$ 150,00'),
///   onTap: () => abrirDetalhe(),
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme).
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubDataListRow extends StatelessWidget {
  const HubDataListRow({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: scheme.outlineVariant),
          ),
          child: Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 12)],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [title, if (subtitle != null) subtitle!],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 12), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
