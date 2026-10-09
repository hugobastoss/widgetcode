import 'package:flutter/material.dart';

class AppBarBasico extends StatelessWidget {
  const AppBarBasico({super.key});

  @override
  Widget build(BuildContext context) {
    // Uma "tela" de 240 de altura, só para caber nesta página. Num app, o
    // Scaffold ocupa a tela inteira e não precisa do SizedBox.
    return SizedBox(
      height: 240,
      child: Scaffold(
        // A AppBar é a barra do topo da tela.
        appBar: AppBar(
          title: const Text('Mensagens'),
          // Só porque esta tela está dentro de outra: sem isto, a AppBar
          // mostraria uma seta de voltar para a página anterior.
          automaticallyImplyLeading: false,
        ),
        body: const Center(child: Text('Conteúdo da tela')),
      ),
    );
  }
}
