import 'package:flutter/material.dart';

class AlertDialogResultado extends StatefulWidget {
  const AlertDialogResultado({super.key});

  @override
  State<AlertDialogResultado> createState() => _AlertDialogResultadoState();
}

class _AlertDialogResultadoState extends State<AlertDialogResultado> {
  String _resposta = 'Nenhuma resposta ainda.';

  Future<void> _perguntar() async {
    // showDialog devolve um Future com o valor passado no pop. Com await,
    // o código espera a pessoa responder.
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sair da conta?'),
        content: const Text('Você vai precisar entrar de novo depois.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sair'),
          ),
        ],
      ),
    );

    // A tela pode ter fechado enquanto o diálogo estava aberto.
    if (!mounted) return;
    setState(() {
      // null = fechou tocando fora do diálogo ou no "voltar".
      _resposta = switch (confirmou) {
        true => 'Confirmou: sair.',
        false => 'Cancelou.',
        null => 'Fechou sem responder.',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        FilledButton.tonal(onPressed: _perguntar, child: const Text('Sair da conta')),
        Text(_resposta),
      ],
    );
  }
}
