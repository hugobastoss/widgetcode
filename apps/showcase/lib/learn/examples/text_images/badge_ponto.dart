import 'package:flutter/material.dart';

class BadgePonto extends StatelessWidget {
  const BadgePonto({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem label, o Badge é só um ponto: "tem novidade aqui".
    return const Badge(
      child: Icon(Icons.notifications_outlined, size: 32),
    );
  }
}
