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
