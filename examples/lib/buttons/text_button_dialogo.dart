import 'package:flutter/material.dart';

class TextButtonDialogo extends StatelessWidget {
  const TextButtonDialogo({super.key});

  void _abrirDialogo(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Descartar rascunho?'),
        content: const Text('As alterações não salvas serão perdidas.'),
        // TextButton é o botão padrão das ações de um diálogo.
        actions: [
          TextButton(
            // Navigator.pop fecha o diálogo.
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Descartar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _abrirDialogo(context),
      child: const Text('Abrir diálogo'),
    );
  }
}
