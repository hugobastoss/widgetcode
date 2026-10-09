import 'package:flutter/material.dart';

class NavigatorPushPop extends StatelessWidget {
  const NavigatorPushPop({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        // O Navigator guarda uma pilha de telas. push coloca uma tela nova
        // por cima da atual.
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const _TelaDeDetalhes()),
        );
      },
      child: const Text('Abrir detalhes'),
    );
  }
}

class _TelaDeDetalhes extends StatelessWidget {
  const _TelaDeDetalhes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A AppBar mostra a seta de voltar sozinha, porque há uma tela
      // embaixo desta na pilha.
      appBar: AppBar(title: const Text('Detalhes')),
      body: Center(
        child: FilledButton(
          // pop tira esta tela da pilha e volta para a anterior.
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Voltar'),
        ),
      ),
    );
  }
}
