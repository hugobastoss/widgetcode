import 'package:flutter/material.dart';

class CheckboxListTileExemplo extends StatefulWidget {
  const CheckboxListTileExemplo({super.key});

  @override
  State<CheckboxListTileExemplo> createState() =>
      _CheckboxListTileExemploState();
}

class _CheckboxListTileExemploState extends State<CheckboxListTileExemplo> {
  final _tarefas = {'Comprar pão': true, 'Pagar a conta de luz': false, 'Ligar para a Ana': false};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final tarefa in _tarefas.keys)
          // CheckboxListTile junta checkbox + texto numa linha que é toda
          // tocável, bem mais fácil de acertar com o dedo.
          CheckboxListTile(
            title: Text(tarefa),
            value: _tarefas[tarefa],
            onChanged: (valor) => setState(() => _tarefas[tarefa] = valor ?? false),
            // Checkbox à esquerda, como numa lista de tarefas.
            controlAffinity: ListTileControlAffinity.leading,
          ),
      ],
    );
  }
}
