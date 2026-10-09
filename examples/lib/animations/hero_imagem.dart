import 'package:flutter/material.dart';

class HeroImagem extends StatelessWidget {
  const HeroImagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const _TelaDaFoto()),
          ),
          // O Hero com a MESMA tag nas duas telas faz a imagem "voar" de uma
          // para a outra na troca de tela. A tag precisa ser única no app.
          child: Hero(
            tag: 'foto-paisagem',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/paisagem.png',
                width: 120,
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Text('Toque na foto'),
      ],
    );
  }
}

class _TelaDaFoto extends StatelessWidget {
  const _TelaDaFoto();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paisagem')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'foto-paisagem',
            child: Image.asset(
              'assets/images/paisagem.png',
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Morros verdes e um sol de fim de tarde.'),
          ),
        ],
      ),
    );
  }
}
