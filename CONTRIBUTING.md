# Contribuindo

Projeto mantido sozinho (solo), escopo deliberadamente pequeno. Antes de um
PR com widget novo, abra uma issue descrevendo o widget pra alinhar escopo
— evita retrabalho.

Todo widget novo precisa:

1. Ser **autônomo** — só `Theme.of(context)` e parâmetros próprios, sem
   depender de um sistema de tokens específico nem importar outro arquivo
   de `packages/flutter_widgets_hub/lib/src/`.
2. Ter o cabeçalho de documentação completo (Propósito, Uso, Dependências
   de token de design, Última verificação) — ver qualquer arquivo existente
   em `lib/src/` como exemplo.
3. Ganhar uma entrada em [`manifest/widgets.json`](manifest/widgets.json).
4. Ser adicionado em [`apps/showcase/lib/catalog/catalog_data.dart`](apps/showcase/lib/catalog/catalog_data.dart)
   e ter uma demonstração ao vivo em
   [`apps/showcase/lib/screens/widget_detail_screen.dart`](apps/showcase/lib/screens/widget_detail_screen.dart)
   — sem isso, o PR não entra: é o que garante que nada no catálogo público
   fica sem renderização real.
5. Ter pelo menos um smoke test (claro e escuro) em
   `packages/flutter_widgets_hub/test/`.

O CI (`flutter analyze` + `flutter test` + `flutter build web` do app de
vitrine) precisa passar antes do merge.
