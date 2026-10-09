import 'package:flutter/material.dart';

class IconVariantes extends StatelessWidget {
  const IconVariantes({super.key});

  @override
  Widget build(BuildContext context) {
    // A maioria dos ícones tem quatro versões, escolhidas pelo sufixo do
    // nome. Use a mesma versão no app inteiro.
    return const Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 12,
      children: [
        _Variante(Icons.home, 'padrão'),
        _Variante(Icons.home_outlined, '_outlined'),
        _Variante(Icons.home_rounded, '_rounded'),
        _Variante(Icons.home_sharp, '_sharp'),
      ],
    );
  }
}

class _Variante extends StatelessWidget {
  const _Variante(this.icone, this.rotulo);

  final IconData icone;
  final String rotulo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(icone, size: 32),
        Text(rotulo, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
