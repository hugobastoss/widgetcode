import 'package:flutter/widgets.dart';

/// Um texto do conteúdo (seções, widgets, exemplos) nos três idiomas do
/// app. Fica direto no cadastro de cada seção, com as três versões lado a
/// lado — e o compilador acusa se faltar alguma.
///
/// Os textos fixos da interface (menus, botões) ficam nos arquivos .arb de
/// lib/l10n.
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
