import 'package:flutter/widgets.dart';

/// Um texto do catálogo (seções, widgets, exemplos) em português, inglês e
/// espanhol. Fica direto no cadastro de cada seção, com as três versões lado
/// a lado, e o compilador acusa se faltar alguma.
class Tr {
  const Tr({required this.pt, required this.en, required this.es});

  final String pt;
  final String en;
  final String es;

  /// O texto no idioma em uso no app.
  String of(BuildContext context) {
    return switch (Localizations.localeOf(context).languageCode) {
      'en' => en,
      'es' => es,
      _ => pt,
    };
  }
}
