import 'package:flutter/material.dart';

class OutlinedButtonDestrutivo extends StatelessWidget {
  const OutlinedButtonDestrutivo({super.key});

  @override
  Widget build(BuildContext context) {
    // Pegar a cor de erro do tema (em vez de Colors.red) faz o botão se
    // adaptar sozinho ao tema claro e ao escuro.
    final corDeErro = Theme.of(context).colorScheme.error;

    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: corDeErro,
        side: BorderSide(color: corDeErro),
      ),
      icon: const Icon(Icons.delete_outline),
      label: const Text('Excluir conta'),
    );
  }
}
