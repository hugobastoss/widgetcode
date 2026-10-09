import 'package:flutter/material.dart';

class ExpandedBasico extends StatelessWidget {
  const ExpandedBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 56, height: 56, color: Colors.indigo),
        // Expanded fica com todo o espaço que sobrou na Row.
        Expanded(
          child: Container(
            height: 56,
            color: Colors.teal,
            alignment: Alignment.center,
            child: const Text(
              'Expanded',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(width: 56, height: 56, color: Colors.indigo),
      ],
    );
  }
}
