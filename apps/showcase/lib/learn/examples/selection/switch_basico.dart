import 'package:flutter/material.dart';

class SwitchBasico extends StatefulWidget {
  const SwitchBasico({super.key});

  @override
  State<SwitchBasico> createState() => _SwitchBasicoState();
}

class _SwitchBasicoState extends State<SwitchBasico> {
  bool _ligado = true;

  @override
  Widget build(BuildContext context) {
    // Switch é para ligar e desligar algo que vale na hora, sem precisar
    // de um botão "Salvar". Para escolhas num formulário, use Checkbox.
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        const Icon(Icons.wifi),
        Switch(
          value: _ligado,
          onChanged: (valor) => setState(() => _ligado = valor),
        ),
        Text(_ligado ? 'Ligado' : 'Desligado'),
      ],
    );
  }
}
