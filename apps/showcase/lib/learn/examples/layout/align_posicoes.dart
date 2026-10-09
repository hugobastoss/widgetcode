import 'package:flutter/material.dart';

class AlignPosicoes extends StatefulWidget {
  const AlignPosicoes({super.key});

  @override
  State<AlignPosicoes> createState() => _AlignPosicoesState();
}

class _AlignPosicoesState extends State<AlignPosicoes> {
  Alignment _alinhamento = Alignment.bottomRight;

  // As 9 posições prontas da classe Alignment.
  static const _opcoes = {
    'topLeft': Alignment.topLeft,
    'topCenter': Alignment.topCenter,
    'topRight': Alignment.topRight,
    'centerLeft': Alignment.centerLeft,
    'center': Alignment.center,
    'centerRight': Alignment.centerRight,
    'bottomLeft': Alignment.bottomLeft,
    'bottomCenter': Alignment.bottomCenter,
    'bottomRight': Alignment.bottomRight,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 220,
          height: 120,
          color: Colors.grey.shade400,
          // Align posiciona o filho dentro do espaço que recebe.
          child: Align(
            alignment: _alinhamento,
            child: Container(width: 40, height: 40, color: Colors.indigo),
          ),
        ),
        const SizedBox(height: 12),
        DropdownButton<Alignment>(
          value: _alinhamento,
          items: [
            for (final opcao in _opcoes.entries)
              DropdownMenuItem(value: opcao.value, child: Text(opcao.key)),
          ],
          onChanged: (valor) {
            if (valor != null) setState(() => _alinhamento = valor);
          },
        ),
      ],
    );
  }
}
