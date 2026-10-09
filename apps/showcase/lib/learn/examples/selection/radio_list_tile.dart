import 'package:flutter/material.dart';

enum Tema { claro, escuro, sistema }

class RadioListTileExemplo extends StatefulWidget {
  const RadioListTileExemplo({super.key});

  @override
  State<RadioListTileExemplo> createState() => _RadioListTileExemploState();
}

class _RadioListTileExemploState extends State<RadioListTileExemplo> {
  Tema _tema = Tema.sistema;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<Tema>(
      groupValue: _tema,
      onChanged: (valor) => setState(() => _tema = valor!),
      // RadioListTile: o Radio numa linha inteira tocável, com título e
      // subtítulo.
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(value: Tema.claro, title: Text('Claro')),
          RadioListTile(value: Tema.escuro, title: Text('Escuro')),
          RadioListTile(
            value: Tema.sistema,
            title: Text('Padrão do sistema'),
            subtitle: Text('Segue a configuração do celular'),
          ),
        ],
      ),
    );
  }
}
