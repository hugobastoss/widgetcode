import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldFormatadores extends StatelessWidget {
  const TextFormFieldFormatadores({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      // inputFormatters filtram o que pode ser digitado, mesmo colando
      // um texto ou usando um teclado físico.
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // só dígitos
        LengthLimitingTextInputFormatter(8), // no máximo 8
      ],
      decoration: const InputDecoration(
        labelText: 'CEP',
        hintText: 'Só os 8 números',
        border: OutlineInputBorder(),
      ),
    );
  }
}
