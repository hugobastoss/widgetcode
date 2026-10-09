# Contribuindo

Projeto mantido sozinho (solo). Antes de um PR com exemplo novo, abra uma
issue descrevendo o exemplo, para alinhar o escopo e evitar retrabalho.

## Adicionando um exemplo

Os comandos abaixo rodam a partir de `apps/showcase/`.

1. **Crie o arquivo** em `lib/learn/examples/<seção>/<widget>_<variação>.dart`.
   - Ele precisa ser **autocontido**: só importa
     `package:flutter/material.dart`, `cupertino.dart` ou `services.dart`,
     e nunca outro arquivo do repositório. É isso que deixa a IA (e quem
     copia à mão) levar o arquivo sozinho para outro projeto.
   - Use **uma classe pública de widget**, que é a que se usa, e deixe o
     resto privado (`_`).
   - Escreva comentários em português explicando as linhas importantes.
     Quem lê é o dev no painel de código e a IA que traz o exemplo.
   - Os textos de tela precisam caber num celular de 360 de largura, mesmo
     com fonte grande. Prefira `Flexible`, `Wrap` ou `Column` a uma `Row`
     cheia de textos.
2. **Cadastre o exemplo** em `lib/learn/sections/<seção>.dart`, com título e
   descrição nos três idiomas:

   ```dart
   WidgetExample(
     title: const Tr(pt: 'Carregando', en: 'Loading', es: 'Cargando'),
     description: const Tr(pt: '…', en: '…', es: '…'),
     sourcePath: '$_kPasta/elevated_button_carregando.dart',
     builder: (_) => const ElevatedButtonCarregando(),
   ),
   ```

   Se for um widget novo, crie também o `WidgetDoc`, com a descrição e a
   pré-visualização (`preview`) do cartão da seção.
3. **Pasta ou imagem nova?** Toda pasta de exemplos precisa de uma linha em
   `flutter: assets:` no `pubspec.yaml`, porque pastas de asset não são
   recursivas. Imagens usadas pelos exemplos ficam em `assets/images/`.
4. **Atualize o manifest:**

   ```bash
   flutter test --dart-define=UPDATE_MANIFEST=true test/manifest_test.dart
   ```

5. **Rode `flutter analyze` e `flutter test`.** O teste dos exemplos roda
   cada um numa tela de 360 de largura e confere que o arquivo define a
   classe usada. O teste do manifest falha se ele estiver desatualizado.

## Textos da interface

Os textos fixos da interface ficam em `lib/l10n/app_pt.arb` (o modelo),
`app_en.arb` e `app_es.arb`. `flutter gen-l10n` regenera as classes, e isso
também roda no build.

## CI

O CI roda `flutter analyze`, `flutter test` (que inclui a conferência do
manifest) e `flutter build web` do app. Tudo precisa passar antes do merge.
