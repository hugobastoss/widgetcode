import 'package:flutter/material.dart';

class CenterFatores extends StatelessWidget {
  const CenterFatores({super.key});

  @override
  Widget build(BuildContext context) {
    // O fundo cinza mostra o tamanho do Center.
    return Container(
      color: Colors.grey.shade400,
      // Sem widthFactor/heightFactor, o Center ocupa todo o espaço que
      // puder. Com eles, fica do tamanho do filho vezes o fator:
      // 60 × 2 = 120 de largura e 60 × 1.5 = 90 de altura.
      child: Center(
        widthFactor: 2,
        heightFactor: 1.5,
        child: Container(width: 60, height: 60, color: Colors.indigo),
      ),
    );
  }
}
