import 'package:flutter/material.dart';

class TweenNumero extends StatefulWidget {
  const TweenNumero({super.key});

  @override
  State<TweenNumero> createState() => _TweenNumeroState();
}

class _TweenNumeroState extends State<TweenNumero> {
  double _saldo = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        // TweenAnimationBuilder anima QUALQUER valor — aqui, um número.
        // Quando o end muda, ele anima do valor atual até o novo. (O begin
        // só vale na primeira vez.)
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: _saldo),
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          // builder roda a cada quadro, com o valor daquele momento.
          builder: (context, valor, child) => Text(
            // \$ escreve o símbolo $ em vez de começar uma variável.
            'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        FilledButton.tonal(
          onPressed: () => setState(() => _saldo += 250),
          child: const Text(r'Depositar R$ 250'),
        ),
      ],
    );
  }
}
