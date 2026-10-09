import 'package:flutter/material.dart';

class SizedBoxEspaco extends StatelessWidget {
  const SizedBoxEspaco({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 120, height: 40, color: Colors.indigo),
        // Sem filho, o SizedBox vira só um espaço vazio, o jeito mais
        // comum de separar dois widgets.
        const SizedBox(height: 32),
        Container(width: 120, height: 40, color: Colors.teal),
      ],
    );
  }
}
