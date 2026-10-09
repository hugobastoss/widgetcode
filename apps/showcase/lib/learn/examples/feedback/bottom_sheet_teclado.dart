import 'package:flutter/material.dart';

class BottomSheetTeclado extends StatelessWidget {
  const BottomSheetTeclado({super.key});

  void _abrir(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        // O teclado cobriria o campo. viewInsets.bottom é a altura do
        // teclado aberto: com esse padding, o painel sobe junto com ele.
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              const TextField(
                autofocus: true, // já abre o teclado
                decoration: InputDecoration(
                  labelText: 'Nova tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => _abrir(context),
      child: const Text('Nova tarefa'),
    );
  }
}
