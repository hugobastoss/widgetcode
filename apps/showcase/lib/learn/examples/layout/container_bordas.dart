import 'package:flutter/material.dart';

class ContainerBordas extends StatelessWidget {
  const ContainerBordas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 90,
      alignment: Alignment.center,
      // Borda e cantos arredondados ficam na decoration. A cor de fundo vai
      // junto: o Container não aceita color e decoration ao mesmo tempo.
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.shade800, width: 2),
      ),
      child: Text(
        'Cantos arredondados',
        style: TextStyle(color: Colors.amber.shade900),
      ),
    );
  }
}
