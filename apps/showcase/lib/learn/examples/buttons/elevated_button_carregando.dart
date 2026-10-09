import 'package:flutter/material.dart';

// StatefulWidget porque o botão precisa lembrar se está carregando.
class ElevatedButtonCarregando extends StatefulWidget {
  const ElevatedButtonCarregando({super.key});

  @override
  State<ElevatedButtonCarregando> createState() =>
      _ElevatedButtonCarregandoState();
}

class _ElevatedButtonCarregandoState extends State<ElevatedButtonCarregando> {
  bool _salvando = false;

  Future<void> _salvar() async {
    setState(() => _salvando = true);

    // Simula uma operação demorada, como enviar dados para um servidor.
    await Future<void>.delayed(const Duration(seconds: 2));

    // A tela pode ter sido fechada durante a espera.
    if (!mounted) return;
    setState(() => _salvando = false);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: null desabilita o botão — assim ninguém toca duas vezes
      // enquanto a primeira operação ainda está rodando.
      onPressed: _salvando ? null : _salvar,
      child: _salvando
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Text('Salvar'),
    );
  }
}
