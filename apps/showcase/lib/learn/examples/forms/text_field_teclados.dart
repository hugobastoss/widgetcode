import 'package:flutter/material.dart';

class TextFieldTeclados extends StatelessWidget {
  const TextFieldTeclados({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        TextField(
          // keyboardType escolhe o teclado: este tem @ e .com à mão.
          keyboardType: TextInputType.emailAddress,
          // textInputAction muda a tecla de ação: "próximo" pula para o
          // campo de baixo.
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          keyboardType: TextInputType.number, // só números
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Idade',
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          keyboardType: TextInputType.phone, // teclado de telefone
          textInputAction: TextInputAction.done, // "concluído" fecha o teclado
          decoration: InputDecoration(
            labelText: 'Telefone',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
