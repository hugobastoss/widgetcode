import 'package:flutter/material.dart';

class BottomSheetArrastavel extends StatelessWidget {
  const BottomSheetArrastavel({super.key});

  void _abrir(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      // A alcinha no topo, que mostra que dá para arrastar.
      showDragHandle: true,
      // Sem isto, o painel fica limitado a metade da tela.
      isScrollControlled: true,
      // DraggableScrollableSheet deixa arrastar o painel para cima e para
      // baixo, e rolar a lista quando ele está todo aberto.
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5, // começa com 50% da tela
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, controleDeRolagem) => ListView.builder(
          // A lista precisa usar o controller do painel.
          controller: controleDeRolagem,
          itemCount: 30,
          itemBuilder: (context, indice) =>
              ListTile(title: Text('Comentário ${indice + 1}')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => _abrir(context),
      child: const Text('Ver comentários'),
    );
  }
}
