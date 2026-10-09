import 'package:flutter/material.dart';

class SwitchIcone extends StatefulWidget {
  const SwitchIcone({super.key});

  @override
  State<SwitchIcone> createState() => _SwitchIconeState();
}

class _SwitchIconeState extends State<SwitchIcone> {
  bool _ligado = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _ligado,
      onChanged: (valor) => setState(() => _ligado = valor),
      // thumbIcon desenha um ícone na bolinha. WidgetStateProperty escolhe
      // o valor conforme o estado do Switch: aqui, ligado ou desligado.
      thumbIcon: WidgetStateProperty.resolveWith((estados) {
        if (estados.contains(WidgetState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      }),
    );
  }
}
