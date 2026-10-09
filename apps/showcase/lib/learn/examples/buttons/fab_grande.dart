import 'package:flutter/material.dart';

class FabGrande extends StatelessWidget {
  const FabGrande({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      tooltip: 'Gravar áudio',
      child: const Icon(Icons.mic_none),
    );
  }
}
