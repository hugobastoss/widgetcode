import 'package:flutter/widgets.dart';

import 'tr.dart';

/// Uma seção da tela inicial (ex.: Botões).
class LearnSection {
  const LearnSection({
    required this.id,
    required this.name,
    required this.icon,
    required this.plannedWidgets,
    required this.intro,
    this.docs = const [],
  });

  /// Igual ao nome da pasta dos exemplos da seção (ex.: buttons). Aparece no
  /// manifest/widgets.json.
  final String id;
  final Tr name;
  final IconData icon;

  /// Widgets nativos planejados pra seção. A contagem da tela inicial sai
  /// daqui, mesmo antes de a seção ter conteúdo.
  final List<String> plannedWidgets;

  /// Texto curto no topo da tela da seção.
  final Tr intro;

  /// Widgets com página pronta. Vazio = seção ainda em construção.
  final List<WidgetDoc> docs;
}

/// Página de um widget nativo: quando usar e a lista de exemplos.
class WidgetDoc {
  const WidgetDoc({
    required this.name,
    required this.description,
    required this.preview,
    required this.examples,
  });

  /// O nome da classe do Flutter (ex.: ElevatedButton). Não se traduz.
  final String name;
  final Tr description;

  /// O widget real, desenhado no cartão da tela da seção.
  final Widget preview;

  final List<WidgetExample> examples;
}

/// Um exemplo = um arquivo Dart autocontido. A demo roda o widget desse
/// arquivo e a tela de código mostra o próprio arquivo, então os dois nunca
/// divergem.
class WidgetExample {
  const WidgetExample({
    required this.title,
    required this.description,
    required this.sourcePath,
    required this.builder,
    this.usesHero = false,
  });

  final Tr title;
  final Tr description;

  /// Caminho do arquivo, relativo a `apps/showcase/`. É também o asset que
  /// o painel de código carrega (ver `flutter: assets:` no pubspec.yaml).
  final String sourcePath;

  /// Identificador do exemplo, tirado do caminho: `<seção>/<arquivo>` (ex.:
  /// buttons/elevated_button_carregando). É o que o dev cita para a IA e a
  /// chave do exemplo no manifest/widgets.json.
  String get id => sourcePath
      .replaceFirst('lib/learn/examples/', '')
      .replaceFirst(RegExp(r'\.dart$'), '');

  final WidgetBuilder builder;

  /// A área da demo desliga as animações Hero (vários FABs na mesma página
  /// teriam a mesma hero tag). Exemplos que ensinam Hero religam com isto
  /// e precisam usar tags únicas no app.
  final bool usesHero;
}
