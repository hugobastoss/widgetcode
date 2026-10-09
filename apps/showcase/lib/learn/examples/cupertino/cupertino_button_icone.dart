import 'package:flutter/cupertino.dart';

class CupertinoButtonIcone extends StatelessWidget {
  const CupertinoButtonIcone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        CupertinoButton(
          onPressed: () {},
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            // CupertinoIcons: os ícones no estilo do iPhone. Flexible deixa
            // o texto quebrar linha se não couber ao lado do ícone.
            children: [
              Icon(CupertinoIcons.share),
              Flexible(child: Text('Compartilhar')),
            ],
          ),
        ),
        // onPressed: null desabilita, igual aos botões do Material.
        const CupertinoButton.filled(onPressed: null, child: Text('Enviar')),
      ],
    );
  }
}
