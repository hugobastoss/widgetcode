import 'package:flutter/material.dart';

class SizedBoxTamanho extends StatelessWidget {
  const SizedBoxTamanho({super.key});

  @override
  Widget build(BuildContext context) {
    // SizedBox força um tamanho exato no filho — aqui, num botão que
    // normalmente teria só o tamanho do texto.
    return SizedBox(
      width: 200,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('200 × 56'),
      ),
    );
  }
}
