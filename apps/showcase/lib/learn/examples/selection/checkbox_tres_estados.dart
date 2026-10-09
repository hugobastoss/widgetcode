import 'package:flutter/material.dart';

class CheckboxTresEstados extends StatefulWidget {
  const CheckboxTresEstados({super.key});

  @override
  State<CheckboxTresEstados> createState() => _CheckboxTresEstadosState();
}

class _CheckboxTresEstadosState extends State<CheckboxTresEstados> {
  final _itens = {'Arroz': true, 'Feijão': false, 'Café': false};

  // O "Selecionar tudo" tem três estados: true (todos), false (nenhum) e
  // null (alguns), que aparece como um tracinho.
  bool? get _todos {
    if (_itens.values.every((marcado) => marcado)) return true;
    if (_itens.values.every((marcado) => !marcado)) return false;
    return null;
  }

  void _marcarTodos(bool? valor) {
    // Tocar no tracinho marca todos.
    final marcar = _todos != true;
    setState(() => _itens.updateAll((item, _) => marcar));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxListTile(
          title: const Text('Selecionar tudo'),
          // tristate libera o valor null (o terceiro estado).
          tristate: true,
          value: _todos,
          onChanged: _marcarTodos,
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(height: 1),
        for (final item in _itens.keys)
          CheckboxListTile(
            title: Text(item),
            value: _itens[item],
            onChanged: (valor) => setState(() => _itens[item] = valor ?? false),
            controlAffinity: ListTileControlAffinity.leading,
            // Recuo para mostrar que são "filhos" do Selecionar tudo.
            contentPadding: const EdgeInsets.only(left: 32),
          ),
      ],
    );
  }
}
