import 'package:flutter/material.dart';

class SelectableTextArea extends StatelessWidget {
  const SelectableTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    // SelectionArea torna selecionáveis TODOS os textos dentro dele: dá
    // para arrastar a seleção de um Text para o outro.
    return const SelectionArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Endereço de entrega',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Rua das Flores, 123'),
          Text('Centro, São Paulo, SP'),
          Text('CEP 01000-000'),
        ],
      ),
    );
  }
}
