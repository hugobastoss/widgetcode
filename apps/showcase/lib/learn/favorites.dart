import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models.dart';
import 'sections.dart';

/// Os exemplos favoritados, pelo ID (ex.: buttons/elevated_button_carregando),
/// salvos no aparelho. É a lista de "exemplos que quero trazer para o meu
/// app". Dá para pedir todos de uma vez para a IA.
class FavoritesController extends ChangeNotifier {
  FavoritesController._(this._prefs, this._ids);

  /// Para testes: não salva nada.
  FavoritesController.inMemory([Iterable<String> ids = const []])
    : _prefs = null,
      _ids = {...ids};

  static const _chave = 'favorite_examples';

  final SharedPreferences? _prefs;
  final Set<String> _ids;

  static Future<FavoritesController> load() async {
    final prefs = await SharedPreferences.getInstance();
    return FavoritesController._(prefs, {...?prefs.getStringList(_chave)});
  }

  bool contains(String id) => _ids.contains(id);

  /// Os favoritos que existem no catálogo atual, na ordem do app (um ID
  /// salvo de um exemplo que deixou de existir é ignorado).
  List<(WidgetDoc, WidgetExample)> get examples => [
    for (final secao in kLearnSections)
      for (final doc in secao.docs)
        for (final exemplo in doc.examples)
          if (_ids.contains(exemplo.id)) (doc, exemplo),
  ];

  Future<void> toggle(String id) async {
    if (!_ids.remove(id)) _ids.add(id);
    notifyListeners();
    await _prefs?.setStringList(_chave, _ids.toList());
  }
}

/// Deixa o [FavoritesController] disponível para qualquer tela, e reconstrói
/// quem o usa quando um favorito muda.
class FavoritesScope extends InheritedNotifier<FavoritesController> {
  const FavoritesScope({
    super.key,
    required FavoritesController controller,
    required super.child,
  }) : super(notifier: controller);

  static FavoritesController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<FavoritesScope>()!
        .notifier!;
  }
}
