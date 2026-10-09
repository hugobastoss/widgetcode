# WidgetCode: Widgets for Flutter

Exemplos dos **widgets nativos do Flutter**: 12 seções, 79 widgets e 210
exemplos, cada um num arquivo Dart autocontido. Eles rodam de verdade no
app WidgetCode, e este repositório guarda os exemplos e o índice que a
**IA de código** do desenvolvedor usa para trazer qualquer um deles para o
projeto dele. Licença MIT.

Todos os exemplos, com descrição e link para o arquivo, estão no
**[catálogo](CATALOG.md)**.

## Como funciona

1. **O app WidgetCode é o expositor.** O dev navega por Seções → Widget → Exemplos,
   vê cada exemplo funcionando e abre o código num painel. O app está em
   português, inglês e espanhol, com tema claro e escuro.
2. **O repositório e a skill são a documentação para a IA.**
   [`manifest/widgets.json`](manifest/widgets.json) indexa todos os
   exemplos, e a skill [`widgetcode`](.claude/skills/widgetcode/SKILL.md)
   lê esse índice para achar e trazer o exemplo pedido.
3. **O dev liga os dois.** No painel de código de um exemplo, o botão
   **"Pedir para a IA"** copia um pedido pronto com o ID do exemplo. Basta
   colar na IA:

   > Traga o exemplo "buttons/elevated_button_carregando" do WidgetCode
   > (github.com/hugobastoss/widgetcode) para o meu projeto.

   Para levar vários de uma vez, toque na estrela dos exemplos que quiser.
   Na tela **Favoritos**, o botão **"Pedir todos para a IA"** copia um só
   pedido com todos os IDs.

## Dando à sua IA a referência do repositório

### Com a skill (Claude Code)

Instale a skill pelo terminal, na pasta raiz do seu projeto Flutter.

**Windows (PowerShell)**

```powershell
New-Item -ItemType Directory -Force .claude\skills\widgetcode | Out-Null
Invoke-WebRequest -UseBasicParsing https://raw.githubusercontent.com/hugobastoss/widgetcode/main/.claude/skills/widgetcode/SKILL.md -OutFile .claude\skills\widgetcode\SKILL.md
```

**macOS e Linux**

```bash
mkdir -p .claude/skills/widgetcode
curl -fsSL https://raw.githubusercontent.com/hugobastoss/widgetcode/main/.claude/skills/widgetcode/SKILL.md -o .claude/skills/widgetcode/SKILL.md
```

Para ter a skill em todos os seus projetos, troque `.claude` por
`$HOME\.claude` (Windows) ou `~/.claude` (macOS e Linux) nos comandos.
Rodar os mesmos comandos de novo atualiza a skill. Se preferir, copie à mão
a pasta [`.claude/skills/widgetcode/`](.claude/skills/widgetcode/) para a
pasta `.claude/skills/` do seu projeto.

Depois, no Claude Code, cole o pedido copiado do app ou chame a skill pelo
nome, com o ID do exemplo:

```
/widgetcode buttons/elevated_button_carregando
```

Qualquer pedido que cite o WidgetCode ou um ID de exemplo aciona a skill.
Ela acha o exemplo, copia o arquivo, troca o nome da classe e os textos de
demonstração e configura o que o exemplo precisar, como a imagem no
`pubspec.yaml` ou a permissão de internet do Android.

### Sem a skill (qualquer IA com acesso à internet)

Inclua no pedido:

> Leia https://raw.githubusercontent.com/hugobastoss/widgetcode/main/manifest/widgets.json,
> ache o exemplo `<id>` e traga o arquivo do campo `filePath` para o meu
> projeto, configurando o que estiver em `requires`.

## O manifest

[`manifest/widgets.json`](manifest/widgets.json) é **gerado** a partir do
cadastro das seções, em `examples/lib/src/sections/`. Não edite à mão. O formato é
`sections[] → widgets[] → examples[]`, e cada exemplo tem:

```json
{
  "id": "text_images/image_asset",
  "title": { "pt": "Do app (asset)", "en": "From the app (asset)", "es": "De la app (asset)" },
  "description": { "pt": "…", "en": "…", "es": "…" },
  "filePath": "examples/lib/text_images/image_asset.dart",
  "className": "ImageAsset",
  "requires": [
    { "type": "asset", "path": "assets/images/paisagem.png", "filePath": "examples/assets/images/paisagem.png" }
  ]
}
```

- `id`: o identificador que o dev cita, no formato `<seção>/<arquivo>`.
- `className`: a classe pública do arquivo, que é a que se usa.
- `requires`: aparece só quando o exemplo precisa de algo além do arquivo.
  Pode ser `asset` (uma imagem do app) ou `androidPermission` (por exemplo,
  internet para `Image.network`).

Cada arquivo de exemplo é **autocontido**: só importa
`package:flutter/material.dart`, `cupertino.dart` ou `services.dart`, e
nunca outro arquivo do repositório.

## Seções

| Seção | Widgets |
|---|---|
| Layout | Container, Row, Column, Stack, Expanded, Padding, Center, Align, SizedBox, Wrap, Divider |
| Texto e imagens | Text, RichText, SelectableText, Icon, Image, CircleAvatar, Badge |
| Botões | ElevatedButton, FilledButton, OutlinedButton, TextButton, IconButton, FloatingActionButton, SegmentedButton |
| Formulários | TextField, TextFormField, Form, SearchBar, DropdownMenu, Autocomplete |
| Seleção | Checkbox, Radio, Switch, Slider, RangeSlider, FilterChip, ChoiceChip |
| Listas e rolagem | ListView, GridView, ListTile, SingleChildScrollView, PageView, CustomScrollView, RefreshIndicator, DataTable |
| Navegação | AppBar, NavigationBar, NavigationRail, NavigationDrawer, TabBar, BottomAppBar, Navigator |
| Diálogos e avisos | AlertDialog, SnackBar, BottomSheet, Tooltip, MaterialBanner, CircularProgressIndicator, LinearProgressIndicator |
| Cartões e painéis | Card, ExpansionTile, ExpansionPanelList |
| Animações | AnimatedContainer, AnimatedOpacity, AnimatedSwitcher, Hero, TweenAnimationBuilder |
| Gestos | GestureDetector, InkWell, Dismissible, Draggable, InteractiveViewer |
| Estilo iOS | CupertinoButton, CupertinoSwitch, CupertinoNavigationBar, CupertinoAlertDialog, CupertinoPicker, CupertinoSlider |

Os exemplos de cada widget, com descrição e link para o arquivo, estão no
[catálogo](CATALOG.md).

## Estrutura

```
widgetcode/
    CATALOG.md                    todos os exemplos, com links (gerado)
    manifest/widgets.json         índice dos exemplos para a IA (gerado)
    .claude/skills/widgetcode/    skill que traz um exemplo para outro projeto
    examples/                     pacote Dart com os exemplos
        lib/<seção>/              um arquivo por exemplo
        lib/src/sections/         cadastro de cada seção, com textos em pt/en/es
        assets/images/            imagens usadas pelos exemplos
        test/                     testes dos exemplos e geração dos índices
```

## Contribuindo

Veja [CONTRIBUTING.md](CONTRIBUTING.md).
