import 'package:flutter/material.dart';

class CardCompleto extends StatelessWidget {
  const CardCompleto({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Recorta a imagem nos cantos arredondados do card.
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/paisagem.png',
            height: 120,
            fit: BoxFit.cover,
          ),
          const ListTile(
            title: Text('Chapada Diamantina'),
            subtitle: Text('Bahia · 3 dias'),
          ),
          // OverflowBar põe os botões lado a lado e, se não couberem,
          // um embaixo do outro.
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Salvar')),
              TextButton(onPressed: () {}, child: const Text('Reservar')),
            ],
          ),
        ],
      ),
    );
  }
}
