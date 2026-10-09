import 'package:flutter/material.dart';

class FormSalvar extends StatefulWidget {
  const FormSalvar({super.key});

  @override
  State<FormSalvar> createState() => _FormSalvarState();
}

class _FormSalvarState extends State<FormSalvar> {
  final _chaveDoForm = GlobalKey<FormState>();
  String _cidade = '';
  String _estado = '';
  String? _salvo;

  void _salvar() {
    final form = _chaveDoForm.currentState!;
    if (!form.validate()) return;
    // save() chama o onSaved de cada campo, que guarda o valor digitado.
    form.save();
    setState(() => _salvo = '$_cidade / $_estado');
  }

  void _restaurar() {
    // reset() volta todos os campos ao initialValue e apaga os erros.
    _chaveDoForm.currentState!.reset();
    setState(() => _salvo = null);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _chaveDoForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          TextFormField(
            initialValue: 'Recife', // valor que já vem preenchido
            decoration: const InputDecoration(
              labelText: 'Cidade',
              border: OutlineInputBorder(),
            ),
            validator: (valor) =>
                (valor == null || valor.trim().isEmpty) ? 'Digite a cidade' : null,
            onSaved: (valor) => _cidade = valor!.trim(),
          ),
          TextFormField(
            initialValue: 'PE',
            decoration: const InputDecoration(
              labelText: 'Estado (sigla)',
              border: OutlineInputBorder(),
            ),
            validator: (valor) =>
                (valor == null || valor.trim().length != 2) ? 'Use 2 letras' : null,
            onSaved: (valor) => _estado = valor!.trim().toUpperCase(),
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _restaurar,
                  child: const Text('Restaurar'),
                ),
              ),
              Expanded(
                child: FilledButton(
                  onPressed: _salvar,
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
          if (_salvo != null)
            Text('Salvo: $_salvo', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
