import 'package:flutter/material.dart';

class CenterBasico extends StatelessWidget {
  const CenterBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      color: Colors.grey.shade400,
      // Center coloca o filho no meio do espaço que recebe — aqui, os
      // 220 × 120 do Container.
      child: Center(
        child: Container(width: 48, height: 48, color: Colors.indigo),
      ),
    );
  }
}
