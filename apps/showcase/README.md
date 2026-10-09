# WidgetCode: o app

O app de vitrine do [WidgetCode](../../README.md): cada exemplo dos widgets
nativos do Flutter roda ao vivo, com o código-fonte real atrás do botão
"Código".

```bash
flutter pub get
flutter run
flutter test
```

Depois de adicionar ou mudar um exemplo, atualize o
[`manifest/widgets.json`](../../manifest/widgets.json):

```bash
flutter test --dart-define=UPDATE_MANIFEST=true test/manifest_test.dart
```

O ícone do app sai das imagens em [`assets/icon/`](assets/icon/). Depois de
trocar alguma delas, gere os ícones do Android e da web de novo com:

```bash
dart run flutter_launcher_icons
```

Para a Play Store, use `assets/icon/app_icon.png` (512 × 512, PNG com alfa).
