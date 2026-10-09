import 'package:flutter/material.dart';

class GestureDetectorToques extends StatefulWidget {
  const GestureDetectorToques({super.key});

  @override
  State<GestureDetectorToques> createState() => _GestureDetectorToquesState();
}

class _GestureDetectorToquesState extends State<GestureDetectorToques> {
  String _gesto = 'Toque na caixa';

  @override
  Widget build(BuildContext context) {
    // GestureDetector detecta gestos em qualquer widget, mas não desenha
    // nenhum efeito visual (para isso, veja o InkWell).
    return GestureDetector(
      onTap: () => setState(() => _gesto = 'Toque'),
      // Com onDoubleTap, o onTap espera um instante para ter certeza de que
      // não é um toque duplo.
      onDoubleTap: () => setState(() => _gesto = 'Toque duplo'),
      onLongPress: () => setState(() => _gesto = 'Toque longo'),
      child: Container(
        width: 200,
        height: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          _gesto,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
