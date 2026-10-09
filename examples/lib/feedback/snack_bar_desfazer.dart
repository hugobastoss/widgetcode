import 'package:flutter/material.dart';

class SnackBarDesfazer extends StatefulWidget {
  const SnackBarDesfazer({super.key});

  @override
  State<SnackBarDesfazer> createState() => _SnackBarDesfazerState();
}

class _SnackBarDesfazerState extends State<SnackBarDesfazer> {
  bool _arquivado = false;

  void _arquivar() {
    setState(() => _arquivado = true);

    ScaffoldMessenger.of(context)
      // Tira a SnackBar anterior, se houver, antes de mostrar a nova.
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Conversa arquivada.'),
          // A ação aparece como um botão dentro da SnackBar.
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () => setState(() => _arquivado = false),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Text(_arquivado ? 'Conversa arquivada.' : 'Conversa na caixa de entrada.'),
        FilledButton.tonal(
          onPressed: _arquivado ? null : _arquivar,
          child: const Text('Arquivar'),
        ),
      ],
    );
  }
}
