import 'package:flutter/material.dart';

class BadgeNumero extends StatelessWidget {
  const BadgeNumero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 32,
      children: [
        // label aceita qualquer widget, normalmente um Text curto.
        const Badge(
          label: Text('3'),
          child: Icon(Icons.mail_outline, size: 32),
        ),
        // Badge.count recebe um número e mostra "99+" acima do máximo.
        Badge.count(
          count: 120,
          maxCount: 99,
          child: const Icon(Icons.chat_bubble_outline, size: 32),
        ),
      ],
    );
  }
}
