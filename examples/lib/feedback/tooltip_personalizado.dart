import 'package:flutter/material.dart';

class TooltipPersonalizado extends StatelessWidget {
  const TooltipPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Seu saldo é atualizado a cada hora.',
      // tap: abre com um toque simples, em vez de tocar e segurar.
      triggerMode: TooltipTriggerMode.tap,
      // Mostra a dica em cima do ícone, não embaixo.
      preferBelow: false,
      // Quanto tempo a dica fica visível depois do toque.
      showDuration: const Duration(seconds: 3),
      decoration: BoxDecoration(
        color: Colors.teal.shade800,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: Colors.white),
      padding: const EdgeInsets.all(12),
      child: const Icon(Icons.info_outline, size: 40),
    );
  }
}
