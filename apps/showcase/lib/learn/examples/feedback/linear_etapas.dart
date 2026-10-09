import 'package:flutter/material.dart';

class LinearEtapas extends StatefulWidget {
  const LinearEtapas({super.key});

  @override
  State<LinearEtapas> createState() => _LinearEtapasState();
}

class _LinearEtapasState extends State<LinearEtapas> {
  int _etapa = 1;
  static const _total = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 12,
      children: [
        Text('Etapa $_etapa de $_total'),
        LinearProgressIndicator(
          value: _etapa / _total,
          minHeight: 8, // espessura da barra
          borderRadius: BorderRadius.circular(4),
        ),
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _etapa == 1 ? null : () => setState(() => _etapa--),
                child: const Text('Voltar'),
              ),
            ),
            Expanded(
              child: FilledButton(
                onPressed:
                    _etapa == _total ? null : () => setState(() => _etapa++),
                child: const Text('Avançar'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
