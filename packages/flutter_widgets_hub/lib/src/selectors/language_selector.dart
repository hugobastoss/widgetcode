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
