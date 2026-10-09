import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// O tema escolhido (claro, escuro ou seguir o sistema), salvo no aparelho
/// para o app abrir com ele da próxima vez.
class ThemeModeController extends ValueNotifier<ThemeMode> {
  ThemeModeController._(this._prefs, super.value);

  /// Para testes: não salva nada.
  ThemeModeController.inMemory([super.value = ThemeMode.system])
    : _prefs = null;

  static const _chave = 'theme_mode';

  final SharedPreferences? _prefs;

  /// Carrega a escolha salva; na primeira vez, segue o sistema.
  static Future<ThemeModeController> load() async {
    final prefs = await SharedPreferences.getInstance();
    final salvo = prefs.getString(_chave);
    final modo = ThemeMode.values.firstWhere(
      (modo) => modo.name == salvo,
      orElse: () => ThemeMode.system,
    );
    return ThemeModeController._(prefs, modo);
  }

  Future<void> select(ThemeMode modo) async {
    value = modo;
    await _prefs?.setString(_chave, modo.name);
  }
}
