import 'package:flutter/material.dart';

/// Como [HubSettingsGroupedCard] desenha o fundo do grupo: as duas
/// variantes reais encontradas em apps de produção da família que originou
/// este catálogo; nenhuma das duas é "a certa".
enum HubGroupedCardVariant {
  /// O widget `Card` real do Material.
  card,

  /// Um `Container` com borda fina e cantos arredondados, sem elevação:
  /// visual mais "plano".
  bordered,
}

/// ## Propósito
/// Agrupa linhas de configuração (tipicamente `ListTile`s) num cartão,
/// separando-as com um divisor de 1px entre cada uma, o padrão clássico de
/// tela de Configurações. Passe qualquer lista de widgets em [children];
/// o divisor é inserido automaticamente entre eles, nunca depois do
/// último.
///
/// ## Uso
/// ```dart
/// HubSettingsGroupedCard(
///   children: [
///     ListTile(leading: const Icon(Icons.notifications_outlined), title: const Text('Notificações')),
///     ListTile(leading: const Icon(Icons.language_outlined), title: const Text('Idioma')),
///   ],
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme) e `Card`/`Container`
/// padrão do Material.
///
/// ## Última verificação
/// 2026-10-08, contra flutterwidgetshub main.
class HubSettingsGroupedCard extends StatelessWidget {
  const HubSettingsGroupedCard({
    super.key,
    required this.children,
    this.variant = HubGroupedCardVariant.card,
  });

  final List<Widget> children;
  final HubGroupedCardVariant variant;

  List<Widget> _comDivisores() {
    final itens = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      itens.add(children[i]);
      if (i != children.length - 1) {
        itens.add(const Divider(height: 1));
      }
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    final conteudo = Column(children: _comDivisores());

    if (variant == HubGroupedCardVariant.card) {
      return Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: conteudo,
      );
    }

    final scheme = Theme.of(context).colorScheme;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: conteudo,
    );
  }
}
