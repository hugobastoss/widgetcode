# Flutter Widgets Hub

Catálogo de widgets Flutter **autônomos** e bem documentados, com um app de
vitrine que renderiza cada um ao vivo — não são capturas de tela, é o
widget real rodando, ao lado do código-fonte real. Licença MIT.

Todo widget usa só `Theme.of(context)` e parâmetros próprios — nenhum deles
depende de um sistema de tokens/tema específico — então copiar **um
arquivo** pra outro projeto funciona de verdade, sem precisar transplantar
nada além dele.

## Pra desenvolvedores

- **Pacote de widgets**: `packages/flutter_widgets_hub/lib/src/` — um
  arquivo por widget (ou família pequena e relacionada), cada um com um
  cabeçalho de documentação (propósito, uso, dependências, última
  verificação).
- **App de vitrine**: `apps/showcase/` — navega Categorias → Widget →
  Detalhe (demo ao vivo, alternância claro/escuro, código-fonte, link pro
  GitHub).
- **Índice machine-readable**: [`manifest/widgets.json`](manifest/widgets.json)
  — um objeto por widget, com caminho do arquivo, símbolos exportados e
  descrição.

Rodando o app de vitrine localmente:

```bash
cd apps/showcase
flutter pub get
flutter run
```

Pegando um widget manualmente: abra o arquivo em
`packages/flutter_widgets_hub/lib/src/<categoria>/<widget>.dart` e cole no
seu projeto — cada arquivo é self-contained, sem imports de outros arquivos
deste pacote.

## Pra agentes de IA

Se você (humano) está pedindo pra uma IA codificadora (Claude Code ou
outra) portar um widget deste repositório pro seu projeto, o prompt que
funciona é:

> Busque https://github.com/hugobastoss/flutterwidgetshub, leia
> `manifest/widgets.json` pra achar o widget certo pelo nome/descrição,
> leia o arquivo-fonte apontado por `filePath`, e porte pro projeto atual —
> adapte ao tema deste projeto em vez de assumir que as classes de token
> opcionais do `flutter_widgets_hub` existem aqui.

Isso funciona com qualquer agente apontado pra URL, sem instalação. Se você
usa Claude Code com frequência, também dá pra instalar
[`.claude/skills/flutter-widgets-hub/SKILL.md`](.claude/skills/flutter-widgets-hub/SKILL.md)
no seu próprio projeto (copie a pasta pra `.claude/skills/` dele) — depois
disso, pedir "use o diálogo de confirmação do flutterwidgetshub" já aciona
o fluxo acima automaticamente, sem repetir a URL.

## Estrutura

```
flutterwidgetshub/
├── manifest/widgets.json          # índice machine-readable
├── packages/flutter_widgets_hub/  # o pacote de widgets
└── apps/showcase/                 # o app de vitrine
```

## Catálogo v1

Botões, diálogos, navegação (FAB), configurações (rótulo de seção, cartão
agrupado), listas, seletores (aparência, idioma) e páginas de destaque —
ver [`manifest/widgets.json`](manifest/widgets.json) pra lista completa com
descrição de cada um.

## Contribuindo

Ver [CONTRIBUTING.md](CONTRIBUTING.md).
