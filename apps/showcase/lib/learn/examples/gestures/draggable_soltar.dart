import 'package:flutter/material.dart';

class DraggableSoltar extends StatefulWidget {
  const DraggableSoltar({super.key});

  @override
  State<DraggableSoltar> createState() => _DraggableSoltarState();
}

class _DraggableSoltarState extends State<DraggableSoltar> {
  Color? _corDoAlvo;

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  Widget _quadrado(Color cor, double tamanho) => Container(
    width: tamanho,
    height: tamanho,
    decoration: BoxDecoration(
      color: cor,
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          spacing: 8,
          children: [
            for (final cor in _cores)
              // O tipo entre <> é o tipo do dado que vai junto no arrasto.
              Draggable<Color>(
                data: cor,
                // Só começa a arrastar se o dedo for para o lado — assim
                // não briga com a rolagem vertical da página.
                affinity: Axis.horizontal,
                feedback: _quadrado(cor, 56), // o que segue o dedo
                // O que fica no lugar enquanto arrasta.
                childWhenDragging: _quadrado(cor.withValues(alpha: 0.3), 40),
                child: _quadrado(cor, 40),
              ),
          ],
        ),
        // DragTarget recebe o que for solto em cima dele.
        DragTarget<Color>(
          onAcceptWithDetails: (detalhes) {
            setState(() => _corDoAlvo = detalhes.data);
          },
          // candidatos: o que está sendo arrastado por cima agora.
          builder: (context, candidatos, rejeitados) => Container(
            width: 120,
            height: 136,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _corDoAlvo,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: candidatos.isNotEmpty ? Colors.green : Colors.grey,
                width: 3,
              ),
            ),
            child: _corDoAlvo == null
                ? const Text('Arraste uma cor para cá', textAlign: TextAlign.center)
                : null,
          ),
        ),
      ],
    );
  }
}
