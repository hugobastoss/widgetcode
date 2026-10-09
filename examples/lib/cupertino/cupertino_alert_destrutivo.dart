import 'package:flutter/cupertino.dart';

class CupertinoAlertDestrutivo extends StatelessWidget {
  const CupertinoAlertDestrutivo({super.key});

  void _mostrar(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Apagar conversa?'),
        content: const Text('Esta ação não pode ser desfeita.'),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            // isDestructiveAction: a ação perigosa aparece em vermelho.
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.tinted(
      onPressed: () => _mostrar(context),
      child: const Text('Apagar conversa'),
    );
  }
}
