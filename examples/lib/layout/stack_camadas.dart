import 'package:flutter/material.dart';

class StackCamadas extends StatelessWidget {
  const StackCamadas({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // O primeiro filho fica no fundo; cada filho seguinte fica por cima.
        Container(width: 150, height: 150, color: Colors.indigo),
        Container(width: 100, height: 100, color: Colors.teal),
        Container(width: 50, height: 50, color: Colors.deepOrange),
      ],
    );
  }
}
