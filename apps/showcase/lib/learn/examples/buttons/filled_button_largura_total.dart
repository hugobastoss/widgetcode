import 'package:flutter/material.dart';

class FilledButtonLarguraTotal extends StatelessWidget {
  const FilledButtonLarguraTotal({super.key});

  @override
  Widget build(BuildContext context) {
    // width: double.infinity faz o SizedBox — e o botão dentro dele —
    // ocupar toda a largura disponível. Comum no fim de formulários.
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () {},
        child: const Text('Criar conta'),
      ),
    );
  }
}
