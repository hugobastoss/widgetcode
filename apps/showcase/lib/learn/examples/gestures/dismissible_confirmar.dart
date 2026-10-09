import 'package:flutter/material.dart';

class DismissibleConfirmar extends StatefulWidget {
  const DismissibleConfirmar({super.key});

  @override
  State<DismissibleConfirmar> createState() => _DismissibleConfirmarState();
}

class _DismissibleConfirmarState extends State<DismissibleConfirmar> {
  final _tarefas = ['Estudar Flutter', 'Ir à academia', 'Ler um livro'];

  Future<bool?> _perguntar(String tarefa) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir "$tarefa"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final tarefa in _tarefas)
          Dismissible(
            key: ValueKey(tarefa),
            // Só da direita para a esquerda.
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red.shade700,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.delete_outline, color: Colors.white),
            ),
            // Pergunta antes de apagar. Devolver false (ou fechar o
            // diálogo) cancela, e o item volta para o lugar.
            confirmDismiss: (direcao) => _perguntar(tarefa),
            onDismissed: (direcao) => setState(() => _tarefas.remove(tarefa)),
            child: ListTile(
              leading: const Icon(Icons.task_alt),
              title: Text(tarefa),
            ),
          ),
        if (_tarefas.isEmpty) const Text('Nenhuma tarefa.'),
      ],
    );
  }
}
