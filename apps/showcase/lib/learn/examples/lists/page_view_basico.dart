import 'package:flutter/material.dart';

class PageViewBasico extends StatelessWidget {
  const PageViewBasico({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      // PageView mostra uma página por vez; deslize para os lados para
      // trocar. É a base de carrosséis e telas de boas-vindas.
      child: PageView(
        children: const [
          _Pagina(Colors.indigo, 'Deslize →'),
          _Pagina(Colors.teal, 'Página 2'),
          _Pagina(Colors.deepOrange, 'Página 3'),
        ],
      ),
    );
  }
}

class _Pagina extends StatelessWidget {
  const _Pagina(this.cor, this.texto);

  final Color cor;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
