import 'package:flutter/material.dart';

class TextFieldSenha extends StatefulWidget {
  const TextFieldSenha({super.key});

  @override
  State<TextFieldSenha> createState() => _TextFieldSenhaState();
}

class _TextFieldSenhaState extends State<TextFieldSenha> {
  bool _oculta = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText troca cada letra por um ponto.
      obscureText: _oculta,
      decoration: InputDecoration(
        labelText: 'Senha',
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock_outline),
        // O olho alterna entre mostrar e esconder a senha.
        suffixIcon: IconButton(
          tooltip: _oculta ? 'Mostrar senha' : 'Ocultar senha',
          icon: Icon(
            _oculta ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          onPressed: () => setState(() => _oculta = !_oculta),
        ),
      ),
    );
  }
}
