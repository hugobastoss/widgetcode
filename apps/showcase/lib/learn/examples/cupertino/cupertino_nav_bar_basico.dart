import 'package:flutter/cupertino.dart';

class CupertinoNavBarBasico extends StatelessWidget {
  const CupertinoNavBarBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Uma "tela" de 240 de altura, só para caber nesta página. No iOS, o
    // CupertinoPageScaffold faz o papel do Scaffold do Material.
    return SizedBox(
      height: 240,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // Só porque esta tela está dentro de outra: sem isto, apareceria
          // um "‹ Voltar" no canto esquerdo.
          automaticallyImplyLeading: false,
          middle: const Text('Ajustes'), // o título, no meio
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: const Icon(CupertinoIcons.add),
          ),
        ),
        child: const Center(child: Text('Conteúdo da tela')),
      ),
    );
  }
}
