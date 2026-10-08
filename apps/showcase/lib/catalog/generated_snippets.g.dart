// GERADO AUTOMATICAMENTE — não edite à mão.
// Rode `dart run tool/generate_snippets.dart` pra regenerar, depois
// de editar qualquer arquivo em packages/flutter_widgets_hub.

const Map<String, String> kHubGeneratedSnippets = {
  'primary-button': r'''
import 'package:flutter/material.dart';

/// ## Propósito
/// Botão primário de largura cheia, com um estado de carregamento
/// incorporado — enquanto [isLoading] é `true`, o rótulo some e um
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
/// atual) e parâmetros próprios — seguro pra colar em qualquer projeto sem
/// nenhum arquivo extra.
///
/// ## Última verificação
/// 2026-10-08 — contra flutterwidgetshub main.
class HubPrimaryButton extends StatelessWidget {
  const HubPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.pillShaped = false,
  });

  /// Texto do botão — some enquanto [isLoading] for `true`.
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
''',
  'confirmation-dialog': r'''
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
''',
  'primary-fab': r'''
import 'package:flutter/material.dart';

/// ## Propósito
/// O FAB "principal" de criação de uma tela — um só por app, circular,
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
/// Nenhuma. Usa só `Theme.of(context)` (cor/forma padrão do FAB) — seguro
/// pra colar em qualquer projeto sem nenhum arquivo extra.
///
/// ## Última verificação
/// 2026-10-08 — contra flutterwidgetshub main.
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
/// já aberto — ex: "adicionar item" dentro do detalhe de uma lista — onde
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
/// 2026-10-08 — contra flutterwidgetshub main.
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
''',
  'settings-section-label': r'''
import 'package:flutter/material.dart';

/// Estilo visual de [HubSettingsSectionLabel] — as duas variantes reais
/// encontradas em apps de produção da família que originou este catálogo;
/// nenhuma das duas é "a certa", é uma escolha de cada app.
enum HubSectionLabelVariant {
  /// 14/600, cor primária do tema — mais em destaque.
  bold,

  /// 11/700, cor secundária/muted do tema, com leve espaçamento entre
  /// letras — mais discreto.
  muted,
}

/// ## Propósito
/// Rótulo de seção em caixa alta, usado antes de um grupo de opções (ex:
/// "APARÊNCIA", "NOTIFICAÇÕES") numa tela de Configurações. Duas variantes
/// de estilo via [variant] — nenhuma é "a certa", é escolha de cada app.
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
/// 2026-10-08 — contra flutterwidgetshub main.
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
''',
  'settings-grouped-card': r'''
import 'package:flutter/material.dart';

/// Como [HubSettingsGroupedCard] desenha o fundo do grupo — as duas
/// variantes reais encontradas em apps de produção da família que originou
/// este catálogo; nenhuma das duas é "a certa".
enum HubGroupedCardVariant {
  /// O widget `Card` real do Material.
  card,

  /// Um `Container` com borda fina e cantos arredondados, sem elevação —
  /// visual mais "plano".
  bordered,
}

/// ## Propósito
/// Agrupa linhas de configuração (tipicamente `ListTile`s) num cartão,
/// separando-as com um divisor de 1px entre cada uma — o padrão clássico de
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
/// 2026-10-08 — contra flutterwidgetshub main.
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
''',
  'data-list-row': r'''
import 'package:flutter/material.dart';

/// ## Propósito
/// Linha de lista de dados (vendas, contatos, pedidos — qualquer coisa
/// repetida e rolável). Deliberadamente **não** é o widget `Card` — sem
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
/// 2026-10-08 — contra flutterwidgetshub main.
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
''',
  'appearance-selector': r'''
import 'package:flutter/material.dart';

/// ## Propósito
/// Seletor de aparência claro/escuro/automático — 3 cartões lado a lado,
/// cada um com uma amostra de cor e um rótulo, destacando o selecionado
/// com borda e fundo da cor primária do tema.
///
/// ## Uso
/// ```dart
/// HubAppearanceSelector(
///   value: _modoAtual,
///   onChanged: (modo) => setState(() => _modoAtual = modo),
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme) e `ThemeMode`, um enum
/// do próprio Flutter.
///
/// ## Última verificação
/// 2026-10-08 — contra flutterwidgetshub main.
class HubAppearanceSelector extends StatelessWidget {
  const HubAppearanceSelector({
    super.key,
    required this.value,
    required this.onChanged,
    this.lightLabel = 'Claro',
    this.darkLabel = 'Escuro',
    this.systemLabel = 'Automático',
  });

  final ThemeMode value;
  final ValueChanged<ThemeMode> onChanged;
  final String lightLabel;
  final String darkLabel;
  final String systemLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Opcao(
            label: lightLabel,
            swatch: Colors.white,
            selected: value == ThemeMode.light,
            onTap: () => onChanged(ThemeMode.light),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Opcao(
            label: darkLabel,
            swatch: const Color(0xFF1A1A1A),
            selected: value == ThemeMode.dark,
            onTap: () => onChanged(ThemeMode.dark),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Opcao(
            label: systemLabel,
            swatch: null,
            selected: value == ThemeMode.system,
            onTap: () => onChanged(ThemeMode.system),
          ),
        ),
      ],
    );
  }
}

class _Opcao extends StatelessWidget {
  const _Opcao({
    required this.label,
    required this.swatch,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final Color? swatch;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? scheme.primaryContainer
              : scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? scheme.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 44,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: scheme.outlineVariant),
                color: swatch,
                gradient: swatch == null
                    ? const LinearGradient(
                        colors: [Colors.white, Color(0xFF1A1A1A)],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: selected
                    ? scheme.onPrimaryContainer
                    : scheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''',
  'language-selector': r'''
import 'package:flutter/material.dart';

/// Um idioma selecionável em [HubLanguageSelector] — [label] deve estar
/// escrito no próprio idioma que representa (convenção padrão de seletor
/// de idioma: "English", "Español", não traduzido pro idioma atual).
class HubLanguageOption {
  const HubLanguageOption({required this.code, required this.label});

  final String code;
  final String label;
}

/// ## Propósito
/// Lista de rádio agrupada pra escolher um idioma — um [HubLanguageOption]
/// por linha, com um ícone de check no selecionado.
///
/// ## Uso
/// ```dart
/// HubLanguageSelector(
///   options: const [
///     HubLanguageOption(code: 'pt', label: 'Português'),
///     HubLanguageOption(code: 'en', label: 'English'),
///     HubLanguageOption(code: 'es', label: 'Español'),
///   ],
///   selectedCode: _idiomaAtual,
///   onChanged: (codigo) => setState(() => _idiomaAtual = codigo),
/// )
/// ```
///
/// ## Dependências de token de design
/// Nenhuma. Usa só `Theme.of(context)` (colorScheme).
///
/// ## Última verificação
/// 2026-10-08 — contra flutterwidgetshub main.
class HubLanguageSelector extends StatelessWidget {
  const HubLanguageSelector({
    super.key,
    required this.options,
    required this.selectedCode,
    required this.onChanged,
  });

  final List<HubLanguageOption> options;
  final String selectedCode;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < options.length; i++) ...[
            ListTile(
              title: Text(options[i].label),
              trailing: Icon(
                options[i].code == selectedCode
                    ? Icons.check_circle
                    : Icons.circle_outlined,
                color: options[i].code == selectedCode
                    ? scheme.primary
                    : scheme.outline,
              ),
              onTap: () => onChanged(options[i].code),
            ),
            if (i != options.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}
''',
  'feature-page': r'''
import 'package:flutter/material.dart';

/// ## Propósito
/// Página centralizada com ícone, título, corpo de texto e um botão de
/// ação de largura cheia — generalização da página de onboarding, mas
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
/// 2026-10-08 — contra flutterwidgetshub main.
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
''',
};
