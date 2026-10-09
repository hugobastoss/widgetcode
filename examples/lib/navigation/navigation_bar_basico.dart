import 'package:flutter/material.dart';

class NavigationBarBasico extends StatefulWidget {
  const NavigationBarBasico({super.key});

  @override
  State<NavigationBarBasico> createState() => _NavigationBarBasicoState();
}

class _NavigationBarBasicoState extends State<NavigationBarBasico> {
  int _aba = 0;

  static const _titulos = ['Início', 'Buscar', 'Perfil'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        // O body troca conforme a aba escolhida.
        body: Center(child: Text('Tela: ${_titulos[_aba]}')),
        // A barra de abas embaixo: o jeito mais comum de navegar num app.
        bottomNavigationBar: NavigationBar(
          selectedIndex: _aba,
          onDestinationSelected: (indice) => setState(() => _aba = indice),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              // selectedIcon: o ícone quando a aba está escolhida.
              selectedIcon: Icon(Icons.home),
              label: 'Início',
            ),
            NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
