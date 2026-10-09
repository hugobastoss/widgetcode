import 'package:flutter/material.dart';

class InkWellBasico extends StatelessWidget {
  const InkWellBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // InkWell é um GestureDetector com o efeito de "onda" do Material.
    // Ele precisa de um Material acima para desenhar a onda. O Scaffold e
    // o Card já são um Material.
    return InkWell(
      onTap: () {},
      // A onda respeita estes cantos arredondados.
      borderRadius: BorderRadius.circular(12),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [Icon(Icons.history), Text('Ver histórico')],
        ),
      ),
    );
  }
}
