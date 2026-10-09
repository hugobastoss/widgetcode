# Flutter Widgets Hub

Vitrine dos **widgets nativos do Flutter**: um app com 12 seções, 79 widgets
e 210 exemplos rodando de verdade, cada um com o código-fonte real. O
repositório é organizado para a **IA de código** do desenvolvedor trazer
qualquer um desses exemplos para o projeto dele. Licença MIT.

## Como funciona

1. **O app é o expositor.** O dev navega por Seções → Widget → Exemplos,
   vê cada exemplo funcionando e abre o código num painel. O app está em
   português, inglês e espanhol, com tema claro e escuro.
2. **O repositório e a skill são a documentação para a IA.**
   [`manifest/widgets.json`](manifest/widgets.json) indexa todos os
   exemplos, e a skill [`flutter-widgets-hub`](.claude/skills/flutter-widgets-hub/SKILL.md)
   lê esse índice para achar e trazer o exemplo pedido.
3. **O dev liga os dois.** No painel de código de um exemplo, o botão
   **"Pedir para a IA"** copia um pedido pronto com o ID do exemplo. Basta
   colar na IA:

   > Traga o exemplo "buttons/elevated_button_carregando" do Flutter
   > Widgets Hub (github.com/hugobastoss/flutterwidgetshub) para o meu
   > projeto.

## Dando à sua IA a referência do repositório

**Com a skill (Claude Code).** Copie a pasta
[`.claude/skills/flutter-widgets-hub/`](.claude/skills/flutter-widgets-hub/)
para a pasta `.claude/skills/` do seu projeto. A partir daí, qualquer pedido
que cite o Flutter Widgets Hub ou um ID de exemplo aciona a skill. Ela acha o
exemplo, copia o arquivo, troca o nome da classe e os textos de
demonstração e configura o que o exemplo precisar, como a imagem no
`pubspec.yaml` ou a permissão de internet do Android.

**Sem a skill (qualquer IA com acesso à internet).** Inclua no pedido:

> Leia https://raw.githubusercontent.com/hugobastoss/flutterwidgetshub/main/manifest/widgets.json,
> ache o exemplo `<id>` e traga o arquivo do campo `filePath` para o meu
> projeto, configurando o que estiver em `requires`.

## O manifest

[`manifest/widgets.json`](manifest/widgets.json) é **gerado** a partir do
cadastro de seções do app. Não edite à mão. O formato é
`sections[] → widgets[] → examples[]`, e cada exemplo tem:

```json
{
  "id": "text_images/image_asset",
  "title": { "pt": "Do app (asset)", "en": "From the app (asset)", "es": "De la app (asset)" },
  "description": { "pt": "…", "en": "…", "es": "…" },
  "filePath": "apps/showcase/lib/learn/examples/text_images/image_asset.dart",
  "className": "ImageAsset",
  "requires": [
    { "type": "asset", "path": "assets/images/paisagem.png", "filePath": "apps/showcase/assets/images/paisagem.png" }
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

Os exemplos de cada widget, com descrição, estão no manifest.

## Rodando o app

```bash
cd apps/showcase
flutter pub get
flutter run
```

Para gerar o APK: `flutter build apk --release`.

## Estrutura

```
flutterwidgetshub/
├── manifest/widgets.json                # índice dos exemplos para a IA (gerado)
├── .claude/skills/flutter-widgets-hub/  # skill que traz um exemplo para outro projeto
├── apps/showcase/                       # o app de vitrine
│   ├── lib/learn/examples/<seção>/      # um arquivo por exemplo
│   ├── lib/learn/sections/              # cadastro de cada seção, com textos em pt/en/es
│   ├── lib/l10n/                        # textos da interface (ARB)
│   └── test/                            # testes, incluindo o que gera e confere o manifest
└── packages/flutter_widgets_hub/        # inativo (veja abaixo)
```

## Pacote `packages/flutter_widgets_hub` (inativo)

Reúne componentes de design de outros apps do autor. O pacote continua no
repositório, mas **não faz parte da vitrine, do manifest nem da skill** e
não recebe manutenção aqui.

## Contribuindo

Veja [CONTRIBUTING.md](CONTRIBUTING.md).
