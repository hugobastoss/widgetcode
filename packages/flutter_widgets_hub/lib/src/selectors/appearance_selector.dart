import 'package:flutter/material.dart';

/// ## Propósito
/// Seletor de aparência claro/escuro/automático: 3 cartões lado a lado,
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
/// 2026-10-08, contra flutterwidgetshub main.
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
