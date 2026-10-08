/// Espelho tipado de `manifest/widgets.json` (raiz do repositório) — mantido
/// manualmente em sincronia por agora; o catálogo v1 tem só 9 entradas,
/// pequeno demais pra valer a pena gerar isso automaticamente. Se o
/// catálogo crescer muito, vale trocar por um passo de geração (mesmo
/// padrão de `tool/generate_snippets.dart`).
class HubWidgetEntry {
  const HubWidgetEntry({
    required this.id,
    required this.name,
    required this.category,
    required this.filePath,
    required this.exportedSymbols,
    required this.description,
  });

  final String id;
  final String name;
  final String category;
  final String filePath;
  final List<String> exportedSymbols;
  final String description;
}

const kHubCatalog = <HubWidgetEntry>[
  HubWidgetEntry(
    id: 'primary-button',
    name: 'Primary Button',
    category: 'buttons',
    filePath:
        'packages/flutter_widgets_hub/lib/src/buttons/primary_button.dart',
    exportedSymbols: ['HubPrimaryButton'],
    description:
        'Botão primário de largura cheia com estado de carregamento incorporado.',
  ),
  HubWidgetEntry(
    id: 'confirmation-dialog',
    name: 'Confirmation Dialog',
    category: 'dialogs',
    filePath:
        'packages/flutter_widgets_hub/lib/src/dialogs/confirmation_dialog.dart',
    exportedSymbols: ['HubConfirmationDialog'],
    description:
        'Diálogo de confirmação com ícone centralizado, botão primário e Cancelar.',
  ),
  HubWidgetEntry(
    id: 'primary-fab',
    name: 'Primary FAB + Extended FAB',
    category: 'navigation',
    filePath:
        'packages/flutter_widgets_hub/lib/src/navigation/primary_fab.dart',
    exportedSymbols: ['HubPrimaryFab', 'HubExtendedFab'],
    description:
        'FAB circular principal e a variante com rótulo de texto pra ações secundárias.',
  ),
  HubWidgetEntry(
    id: 'settings-section-label',
    name: 'Settings Section Label',
    category: 'settings',
    filePath:
        'packages/flutter_widgets_hub/lib/src/settings/settings_section_label.dart',
    exportedSymbols: ['HubSettingsSectionLabel', 'HubSectionLabelVariant'],
    description: 'Rótulo de seção em caixa alta, com duas variantes de estilo.',
  ),
  HubWidgetEntry(
    id: 'settings-grouped-card',
    name: 'Settings Grouped Card',
    category: 'settings',
    filePath:
        'packages/flutter_widgets_hub/lib/src/settings/settings_grouped_card.dart',
    exportedSymbols: ['HubSettingsGroupedCard', 'HubGroupedCardVariant'],
    description:
        'Agrupa ListTiles com divisor entre eles, duas variantes de fundo.',
  ),
  HubWidgetEntry(
    id: 'data-list-row',
    name: 'Data List Row',
    category: 'lists',
    filePath: 'packages/flutter_widgets_hub/lib/src/lists/data_list_row.dart',
    exportedSymbols: ['HubDataListRow'],
    description:
        'Linha de lista de dados sem elevação — superfície plana com borda fina.',
  ),
  HubWidgetEntry(
    id: 'appearance-selector',
    name: 'Appearance Selector',
    category: 'selectors',
    filePath:
        'packages/flutter_widgets_hub/lib/src/selectors/appearance_selector.dart',
    exportedSymbols: ['HubAppearanceSelector'],
    description:
        'Seletor claro/escuro/automático com amostra de cor por opção.',
  ),
  HubWidgetEntry(
    id: 'language-selector',
    name: 'Language Selector',
    category: 'selectors',
    filePath:
        'packages/flutter_widgets_hub/lib/src/selectors/language_selector.dart',
    exportedSymbols: ['HubLanguageSelector', 'HubLanguageOption'],
    description: 'Lista de rádio agrupada pra escolher idioma.',
  ),
  HubWidgetEntry(
    id: 'feature-page',
    name: 'Feature Page',
    category: 'misc',
    filePath: 'packages/flutter_widgets_hub/lib/src/misc/feature_page.dart',
    exportedSymbols: ['HubFeaturePage'],
    description:
        'Página centralizada com ícone, título, corpo e botão de ação.',
  ),
];

/// Rótulo de exibição de cada categoria, na ordem em que aparecem na Home.
const kHubCategoryLabels = <String, String>{
  'buttons': 'Botões',
  'dialogs': 'Diálogos',
  'navigation': 'Navegação',
  'settings': 'Configurações',
  'lists': 'Listas',
  'selectors': 'Seletores',
  'misc': 'Outros',
};
