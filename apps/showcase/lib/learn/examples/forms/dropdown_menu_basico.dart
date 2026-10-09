import 'package:flutter/material.dart';

class DropdownMenuBasico extends StatefulWidget {
  const DropdownMenuBasico({super.key});

  @override
  State<DropdownMenuBasico> createState() => _DropdownMenuBasicoState();
}

class _DropdownMenuBasicoState extends State<DropdownMenuBasico> {
  String? _tamanho;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        // O tipo entre <> é o tipo do valor de cada opção.
        DropdownMenu<String>(
          label: const Text('Tamanho'),
          // Cada entrada tem um valor (usado no código) e um rótulo (visto
          // na tela).
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 'P', label: 'Pequeno'),
            DropdownMenuEntry(value: 'M', label: 'Médio'),
            DropdownMenuEntry(value: 'G', label: 'Grande'),
          ],
          // Recebe o valor da opção escolhida.
          onSelected: (valor) => setState(() => _tamanho = valor),
        ),
        Text(_tamanho == null ? 'Nada escolhido.' : 'Valor escolhido: $_tamanho'),
      ],
    );
  }
}
