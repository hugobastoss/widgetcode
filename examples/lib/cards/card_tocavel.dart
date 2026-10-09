import 'package:flutter/material.dart';

class CardTocavel extends StatelessWidget {
  const CardTocavel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      // Sem o clip, o efeito de toque passaria dos cantos arredondados.
      clipBehavior: Clip.antiAlias,
      // InkWell deixa o card inteiro tocável, com o efeito de onda.
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Card tocado!')),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            spacing: 16,
            children: [
              Icon(Icons.local_shipping_outlined, size: 32),
              Expanded(
                child: Text('Pedido #1042\nChega amanhã'),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
