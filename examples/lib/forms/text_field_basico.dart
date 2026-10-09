import 'package:flutter/material.dart';

class TextFieldBasico extends StatelessWidget {
  const TextFieldBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // labelText fica dentro do campo e sobe quando a pessoa toca nele.
      decoration: InputDecoration(labelText: 'Nome'),
    );
  }
}
