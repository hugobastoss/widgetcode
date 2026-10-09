import 'package:flutter/material.dart';

class ElevatedButtonDesabilitado extends StatefulWidget {
  const ElevatedButtonDesabilitado({super.key});

  @override
  State<ElevatedButtonDesabilitado> createState() =>
      _ElevatedButtonDesabilitadoState();
}

class _ElevatedButtonDesabilitadoState
    extends State<ElevatedButtonDesabilitado> {
  bool _habilitado = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          // Não existe uma propriedade "enabled": com onPressed: null o
          // Flutter desenha o botão desabilitado e ignora os toques.
          onPressed: _habilitado ? () {} : null,
          child: const Text('Continuar'),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: _habilitado,
              onChanged: (valor) => setState(() => _habilitado = valor),
            ),
            const SizedBox(width: 8),
            Text(_habilitado ? 'Habilitado' : 'Desabilitado'),
          ],
        ),
      ],
    );
  }
}
