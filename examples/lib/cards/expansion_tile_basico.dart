import 'package:flutter/material.dart';

class ExpansionTileBasico extends StatelessWidget {
  const ExpansionTileBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // ExpansionTile é uma linha que abre e fecha mostrando os children.
    // Perfeito para perguntas frequentes.
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExpansionTile(
          title: Text('Como troco minha senha?'),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text('Vá em Perfil > Segurança > Trocar senha.'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Qual o prazo de entrega?'),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text('De 2 a 5 dias úteis, conforme a sua região.'),
            ),
          ],
        ),
      ],
    );
  }
}
