import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// O idioma escolhido no app, salvo no aparelho. null = seguir o idioma do
/// sistema.
class LocaleController extends ValueNotifier<Locale?> {
  LocaleController._(this._prefs, super.value);

  /// Sem salvar nada — para testes.
  LocaleController.inMemory([super.value]) : _prefs = null;

  /// Os idiomas do app, na ordem do menu.
  static const supportedLocales = [Locale('pt'), Locale('en'), Locale('es')];

  /// Usado quando o sistema está num idioma que o app não tem.
  static const fallbackLocale = Locale('en');

  static const _chave = 'locale';
  static const _seguirSistema = 'system';

  final SharedPreferences? _prefs;

  /// Carrega a escolha salva; na primeira vez, segue o sistema.
  static Future<LocaleController> load() async {
    final prefs = await SharedPreferences.getInstance();
    final salvo = prefs.getString(_chave);
    final idioma = supportedLocales
        .where((idioma) => idioma.languageCode == salvo)
        .firstOrNull;
    return LocaleController._(prefs, idioma);
  }

  Future<void> select(Locale? idioma) async {
    value = idioma;
    await _prefs?.setString(_chave, idioma?.languageCode ?? _seguirSistema);
  }

  /// Escolhe, entre os idiomas do app, o que combina com os do sistema.
  static Locale resolve(List<Locale>? doSistema) {
    for (final idioma in doSistema ?? const <Locale>[]) {
      for (final suportado in supportedLocales) {
        if (suportado.languageCode == idioma.languageCode) return suportado;
      }
    }
    return fallbackLocale;
  }
}
