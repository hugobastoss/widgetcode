import 'package:flutter/material.dart';

class DividerPersonalizado extends StatelessWidget {
  const DividerPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Divider personalizado'),
        Divider(
          thickness: 3, // espessura da linha
          indent: 24, // recuo no começo
          endIndent: 24, // recuo no fim
          color: Colors.indigo,
        ),
        SizedBox(height: 16),
        // VerticalDivider precisa de uma altura definida (aqui, a do
        // SizedBox em volta da Row).
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_outlined),
              // width é o espaço total ocupado; a linha fica no meio dele.
              VerticalDivider(width: 32, thickness: 1),
              Icon(Icons.videocam_outlined),
              VerticalDivider(width: 32, thickness: 1),
              Icon(Icons.music_note_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
