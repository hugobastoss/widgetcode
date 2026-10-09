import 'package:flutter/cupertino.dart';

class CupertinoButtonEstilos extends StatelessWidget {
  const CupertinoButtonEstilos({super.key});

  @override
  Widget build(BuildContext context) {
    // Os widgets Cupertino ficam em package:flutter/cupertino.dart e imitam
    // os componentes nativos do iPhone.
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        // O padrão: só o texto colorido, sem fundo.
        CupertinoButton(onPressed: () {}, child: const Text('Cancelar')),
        // .tinted: fundo suave na cor principal.
        CupertinoButton.tinted(onPressed: () {}, child: const Text('Editar')),
        // .filled: fundo cheio, para a ação principal.
        CupertinoButton.filled(onPressed: () {}, child: const Text('Continuar')),
      ],
    );
  }
}
