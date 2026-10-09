import 'package:flutter/material.dart';

class SwitchListTileExemplo extends StatefulWidget {
  const SwitchListTileExemplo({super.key});

  @override
  State<SwitchListTileExemplo> createState() => _SwitchListTileExemploState();
}

class _SwitchListTileExemploState extends State<SwitchListTileExemplo> {
  bool _notificacoes = true;
  bool _modoAviao = false;

  @override
  Widget build(BuildContext context) {
    // SwitchListTile é o formato clássico de telas de Configurações.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SwitchListTile(
          title: const Text('Notificações'),
          subtitle: const Text('Avisos de pedidos e promoções'),
          value: _notificacoes,
          onChanged: (valor) => setState(() => _notificacoes = valor),
        ),
        SwitchListTile(
          title: const Text('Modo avião'),
          secondary: const Icon(Icons.airplanemode_active), // ícone à esquerda
          value: _modoAviao,
          onChanged: (valor) => setState(() => _modoAviao = valor),
        ),
      ],
    );
  }
}
