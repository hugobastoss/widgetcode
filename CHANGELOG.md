# Changelog

## Não lançado

O projeto virou uma vitrine dos widgets nativos do Flutter ligada à IA de
código do desenvolvedor.

- App de vitrine refeito: 12 seções, 79 widgets e 210 exemplos rodando ao
  vivo, com o código de cada um num painel arrastável.
- App em português, inglês e espanhol, com tema claro, escuro ou seguindo o
  sistema. As duas escolhas ficam salvas.
- `manifest/widgets.json` passou a indexar os 210 exemplos (ID, textos em
  três idiomas, arquivo, classe e requisitos), gerado e conferido por teste.
- Skill `flutter-widgets-hub` reescrita para trazer os exemplos.
- Botão "Pedir para a IA" e tela "Como usar" no app.
- Plataforma Android adicionada ao app.
- O pacote `packages/flutter_widgets_hub` ficou inativo (componentes de
  design de outros apps).

## 0.1.0 — 2026-10-08

Primeira versão pública.

- 9 widgets autônomos: `HubPrimaryButton`, `HubConfirmationDialog`,
  `HubPrimaryFab`/`HubExtendedFab`, `HubSettingsSectionLabel`,
  `HubSettingsGroupedCard`, `HubDataListRow`, `HubAppearanceSelector`,
  `HubLanguageSelector`, `HubFeaturePage`.
- App de vitrine com renderização ao vivo, alternância claro/escuro, e
  painel de código-fonte gerado a partir dos arquivos reais.
- `manifest/widgets.json` — índice machine-readable pra agentes de IA.
- Skill instalável do Claude Code em `.claude/skills/flutter-widgets-hub/`.
