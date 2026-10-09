import 'package:flutter/material.dart';

class TextFieldController extends StatefulWidget {
  const TextFieldController({super.key});

  @override
  State<TextFieldController> createState() => _TextFieldControllerState();
}

class _TextFieldControllerState extends State<TextFieldController> {
  // O controller guarda o texto do campo: dá para ler, mudar e limpar.
  final _controle = TextEditingController();

  @override
  void dispose() {
    // Como todo controller, precisa ser liberado no dispose.
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texto = _controle.text;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        TextField(
          controller: _controle,
          // onChanged roda a cada letra digitada; aqui só redesenha a tela.
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            labelText: 'Seu apelido',
            border: const OutlineInputBorder(),
            suffixIcon: texto.isEmpty
                ? null
                : IconButton(
                    tooltip: 'Limpar',
                    icon: const Icon(Icons.clear),
                    onPressed: () => setState(() => _controle.clear()),
                  ),
          ),
        ),
        Text(
          texto.isEmpty ? 'Digite algo acima.' : 'Olá, $texto!',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
