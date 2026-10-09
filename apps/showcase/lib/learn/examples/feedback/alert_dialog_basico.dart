import 'package:flutter/material.dart';

class AlertDialogBasico extends StatelessWidget {
  const AlertDialogBasico({super.key});

  void _abrir(BuildContext context) {
    // showDialog abre o diálogo por cima da tela e escurece o fundo.
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Atualização disponível'),
        content: const Text('Uma nova versão do app está pronta para instalar.'),
        actions: [
          TextButton(
            // Navigator.pop fecha o diálogo.
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => _abrir(context),
      child: const Text('Abrir diálogo'),
    );
  }
}
