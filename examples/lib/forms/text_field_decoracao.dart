import 'package:flutter/material.dart';

class TextFieldDecoracao extends StatelessWidget {
  const TextFieldDecoracao({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      // InputDecoration controla tudo em volta do texto digitado.
      decoration: InputDecoration(
        labelText: 'Valor',
        hintText: '0,00', // aparece com o campo vazio e selecionado
        helperText: 'Valor da transferência', // ajuda embaixo do campo
        prefixText: r'R$ ', // texto fixo antes do que é digitado
        prefixIcon: Icon(Icons.payments_outlined),
        suffixIcon: Icon(Icons.info_outline),
        // A borda em volta de todo o campo. O padrão é só uma linha embaixo.
        border: OutlineInputBorder(),
      ),
    );
  }
}
