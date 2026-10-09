import 'package:flutter/material.dart';

class TextFormFieldValidacao extends StatelessWidget {
  const TextFormFieldValidacao({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // Valida enquanto a pessoa digita, a partir da primeira letra.
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator devolve a mensagem de erro, ou null se estiver certo.
      validator: (valor) {
        if (valor == null || valor.isEmpty) return 'Campo obrigatório';
        if (!valor.contains('@')) return 'Falta o @ no e-mail';
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'E-mail',
        border: OutlineInputBorder(),
      ),
    );
  }
}
