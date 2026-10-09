import 'package:flutter/widgets.dart';

/// Uma seção da tela inicial (ex.: Botões).
class LearnSection {
  const LearnSection({
    required this.name,
    required this.icon,
    required this.plannedWidgets,
    this.intro = '',
    this.docs = const [],
  });

  final String name;
  final IconData icon;

  /// Widgets nativos planejados pra seção — a contagem da tela inicial sai
  /// daqui, mesmo antes de a seção ter conteúdo.
  final List<String> plannedWidgets;

  /// Texto curto no topo da tela da seção.
  final String intro;

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

  final String name;
  final String description;

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
  });

  final String title;
  final String description;

  /// Caminho do arquivo, relativo a `apps/showcase/`. É também o asset que
  /// a tela de código carrega (ver `flutter: assets:` no pubspec.yaml).
  final String sourcePath;

  final WidgetBuilder builder;
}
