import 'package:flutter/material.dart';

class FormValidar extends StatefulWidget {
  const FormValidar({super.key});

  @override
  State<FormValidar> createState() => _FormValidarState();
}

class _FormValidarState extends State<FormValidar> {
  // A chave dá acesso ao estado do Form: validar, salvar e limpar.
  final _chaveDoForm = GlobalKey<FormState>();

  void _enviar() {
    // validate() roda o validator de todos os campos e mostra os erros.
    // Devolve true só se todos estiverem certos.
    if (_chaveDoForm.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro enviado!')),
      );
    }
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
            decoration: const InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(),
            ),
            validator: (valor) =>
                (valor == null || valor.trim().isEmpty) ? 'Digite seu nome' : null,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(),
            ),
            validator: (valor) => (valor == null || !valor.contains('@'))
                ? 'Digite um e-mail válido'
                : null,
          ),
          FilledButton(onPressed: _enviar, child: const Text('Enviar')),
        ],
      ),
    );
  }
}
