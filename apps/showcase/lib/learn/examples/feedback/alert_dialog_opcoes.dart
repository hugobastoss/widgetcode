import 'package:flutter/material.dart';

class AlertDialogOpcoes extends StatefulWidget {
  const AlertDialogOpcoes({super.key});

  @override
  State<AlertDialogOpcoes> createState() => _AlertDialogOpcoesState();
}

class _AlertDialogOpcoesState extends State<AlertDialogOpcoes> {
  String _idioma = 'Português';

  static const _idiomas = ['Português', 'English', 'Español'];

  Future<void> _escolher() async {
    // SimpleDialog é o diálogo de "escolha uma opção": cada opção já
    // fecha o diálogo devolvendo o próprio valor.
    final escolhido = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Idioma'),
        children: [
          for (final idioma in _idiomas)
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(idioma),
              child: Text(idioma),
            ),
        ],
      ),
    );

    if (!mounted || escolhido == null) return;
    setState(() => _idioma = escolhido);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Idioma'),
      subtitle: Text(_idioma),
      onTap: _escolher,
    );
  }
}
