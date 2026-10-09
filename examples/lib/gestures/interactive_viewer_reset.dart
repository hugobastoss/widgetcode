import 'package:flutter/material.dart';

class InteractiveViewerReset extends StatefulWidget {
  const InteractiveViewerReset({super.key});

  @override
  State<InteractiveViewerReset> createState() => _InteractiveViewerResetState();
}

class _InteractiveViewerResetState extends State<InteractiveViewerReset> {
  // Guarda o zoom e a posição atuais, e deixa o código mudá-los.
  final _controle = TransformationController();

  @override
  void dispose() {
    _controle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 240,
            height: 150,
            child: InteractiveViewer(
              transformationController: _controle,
              maxScale: 5,
              child: Image.asset('assets/images/paisagem.png', fit: BoxFit.cover),
            ),
          ),
        ),
        TextButton.icon(
          // Matrix4.identity() = sem zoom e sem deslocamento.
          onPressed: () => _controle.value = Matrix4.identity(),
          icon: const Icon(Icons.zoom_out_map),
          label: const Text('Voltar ao normal'),
        ),
      ],
    );
  }
}
