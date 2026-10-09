import 'package:flutter/material.dart';

class OutlinedButtonBorda extends StatelessWidget {
  const OutlinedButtonBorda({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        // side controla a borda: cor e espessura.
        side: const BorderSide(color: Colors.deepPurple, width: 2),
        foregroundColor: Colors.deepPurple, // cor do texto
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Ver planos'),
    );
  }
}
