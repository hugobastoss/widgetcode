import 'package:flutter/material.dart';

class CheckboxBasico extends StatefulWidget {
  const CheckboxBasico({super.key});

  @override
  State<CheckboxBasico> createState() => _CheckboxBasicoState();
}

class _CheckboxBasicoState extends State<CheckboxBasico> {
  bool _aceito = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          // value: marcado ou não. Quem guarda esse valor é você, no State.
          value: _aceito,
          // onChanged recebe o novo valor (bool?) a cada toque.
          onChanged: (valor) => setState(() => _aceito = valor ?? false),
        ),
        // Flexible deixa o texto quebrar linha se não couber ao lado.
        const Flexible(child: Text('Aceito os termos de uso')),
      ],
    );
  }
}
