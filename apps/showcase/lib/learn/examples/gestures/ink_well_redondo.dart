import 'package:flutter/material.dart';

class InkWellRedondo extends StatelessWidget {
  const InkWellRedondo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // customBorder dá o formato da onda (aqui, um círculo).
      customBorder: const CircleBorder(),
      // A cor da onda.
      splashColor: Colors.pink.withValues(alpha: 0.3),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Icon(Icons.favorite, color: Colors.pink, size: 40),
      ),
    );
  }
}
