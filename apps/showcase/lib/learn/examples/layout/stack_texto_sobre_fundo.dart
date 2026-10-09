import 'package:flutter/material.dart';

class StackTextoSobreFundo extends StatelessWidget {
  const StackTextoSobreFundo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 140,
      child: Stack(
        // expand: os filhos sem Positioned ocupam o Stack inteiro.
        fit: StackFit.expand,
        children: [
          // O fundo — num app de verdade, seria uma Image.
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.indigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Icon(Icons.landscape, size: 64, color: Colors.white54),
          // Faixa escura embaixo, para o texto ficar legível sobre o fundo.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.black54,
              child: const Text(
                'Praia do Forte',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
