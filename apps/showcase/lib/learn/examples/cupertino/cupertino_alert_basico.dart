import 'package:flutter/cupertino.dart';

class CupertinoAlertBasico extends StatelessWidget {
  const CupertinoAlertBasico({super.key});

  void _mostrar(BuildContext context) {
    // showCupertinoDialog é o showDialog do estilo iOS.
    showCupertinoDialog<void>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Permitir notificações?'),
        content: const Text('Você vai receber avisos sobre os seus pedidos.'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Agora não'),
          ),
          CupertinoDialogAction(
            // isDefaultAction: a ação recomendada, em negrito.
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Permitir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.tinted(
      onPressed: () => _mostrar(context),
      child: const Text('Mostrar alerta'),
    );
  }
}
