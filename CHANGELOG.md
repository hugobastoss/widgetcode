# Changelog

## Não lançado

O projeto virou uma vitrine dos widgets nativos do Flutter ligada à IA de
código do desenvolvedor, e foi renomeado para **WidgetCode: Widgets for
Flutter** (repositório `widgetcode`, skill `widgetcode`, app Android
`com.hvcb.appgames.widgetcode`).

- App de vitrine refeito: 12 seções, 79 widgets e 210 exemplos rodando ao
  vivo, com o código de cada um num painel arrastável.
- App em português, inglês e espanhol, com tema claro, escuro ou seguindo o
  sistema. As duas escolhas ficam salvas.
- `manifest/widgets.json` passou a indexar os 210 exemplos (ID, textos em
  três idiomas, arquivo, classe e requisitos), gerado e conferido por teste.
- Skill reescrita para trazer os exemplos.
- Botão "Pedir para a IA" e tela "Como usar" no app.
- Favoritos: a estrela guarda um exemplo numa lista salva, e a tela
  Favoritos pede todos para a IA de uma vez.
- Tela de Configurações, aberta pela engrenagem da tela inicial: tema,
  idioma, como usar, suporte (issues do GitHub), compartilhar, avaliar, mais
  aplicativos e sobre. Termos de uso e política de privacidade ainda em
  breve.
- Plataforma Android adicionada ao app.
- Ícone do app: adaptativo no Android, com versão monocromática para os
  ícones temáticos, também na versão web e no diálogo "Sobre".
- O pacote `packages/flutter_widgets_hub` ficou inativo (componentes de
  design de outros apps).

## 0.1.0 (2026-10-08)

Primeira versão pública.

- 9 widgets autônomos: `HubPrimaryButton`, `HubConfirmationDialog`,
  `HubPrimaryFab`/`HubExtendedFab`, `HubSettingsSectionLabel`,
  `HubSettingsGroupedCard`, `HubDataListRow`, `HubAppearanceSelector`,
  `HubLanguageSelector`, `HubFeaturePage`.
- App de vitrine com renderização ao vivo, alternância claro/escuro, e
  painel de código-fonte gerado a partir dos arquivos reais.
- `manifest/widgets.json`: índice machine-readable pra agentes de IA.
- Skill instalável do Claude Code em `.claude/skills/flutter-widgets-hub/`.
