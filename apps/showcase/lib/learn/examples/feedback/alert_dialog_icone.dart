import 'package:flutter/material.dart';

class AlertDialogIcone extends StatelessWidget {
  const AlertDialogIcone({super.key});

  void _abrir(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        // icon aparece em cima do título, centralizado.
        icon: const Icon(Icons.delete_outline),
        title: const Text('Excluir 3 fotos?'),
        content: const Text('Elas vão para a lixeira por 30 dias.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          // A ação perigosa em destaque, com a cor de erro do tema.
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: cores.error,
              foregroundColor: cores.onError,
            ),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => _abrir(context),
      child: const Text('Excluir fotos'),
    );
  }
}
