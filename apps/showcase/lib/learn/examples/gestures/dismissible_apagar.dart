import 'package:flutter/material.dart';

class DismissibleApagar extends StatefulWidget {
  const DismissibleApagar({super.key});

  @override
  State<DismissibleApagar> createState() => _DismissibleApagarState();
}

class _DismissibleApagarState extends State<DismissibleApagar> {
  static const _todos = [
    'Promoção de inverno',
    'Sua fatura chegou',
    'Novo acesso à conta',
  ];
  final _emails = [..._todos];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final email in _emails)
          Dismissible(
            // A key identifica cada item: precisa ser única e não mudar.
            // Nunca use o índice da lista.
            key: ValueKey(email),
            // O que aparece embaixo do item enquanto ele é arrastado.
            background: Container(
              color: Colors.red.shade700,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.delete_outline, color: Colors.white),
            ),
            // Depois de arrastado até o fim, o item TEM que sair da lista —
            // senão o Flutter avisa com um erro.
            onDismissed: (direcao) {
              setState(() => _emails.remove(email));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('"$email" apagado.')),
              );
            },
            child: ListTile(
              leading: const Icon(Icons.mail_outline),
              title: Text(email),
            ),
          ),
        if (_emails.isEmpty)
          TextButton(
            onPressed: () => setState(() => _emails.addAll(_todos)),
            child: const Text('Restaurar e-mails'),
          ),
      ],
    );
  }
}
