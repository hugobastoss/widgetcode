import 'package:flutter/cupertino.dart';

class CupertinoActionSheetExemplo extends StatelessWidget {
  const CupertinoActionSheetExemplo({super.key});

  void _mostrar(BuildContext context) {
    // showCupertinoModalPopup sobe um painel de baixo, no estilo iOS.
    showCupertinoModalPopup<void>(
      context: context,
      // CupertinoActionSheet: a lista de opções que sobe de baixo no
      // iPhone (o equivalente ao BottomSheet do Material).
      builder: (context) => CupertinoActionSheet(
        title: const Text('Foto de perfil'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tirar foto'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Escolher da galeria'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Remover foto'),
          ),
        ],
        // O Cancelar fica separado, embaixo das outras opções.
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.tinted(
      onPressed: () => _mostrar(context),
      child: const Text('Trocar foto'),
    );
  }
}
