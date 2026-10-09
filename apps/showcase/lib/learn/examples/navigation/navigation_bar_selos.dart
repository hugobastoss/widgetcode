import 'package:flutter/material.dart';

class NavigationBarSelos extends StatefulWidget {
  const NavigationBarSelos({super.key});

  @override
  State<NavigationBarSelos> createState() => _NavigationBarSelosState();
}

class _NavigationBarSelosState extends State<NavigationBarSelos> {
  int _aba = 0;

  static const _titulos = ['Chat', 'Avisos', 'Conta'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        body: Center(child: Text('Tela: ${_titulos[_aba]}')),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _aba,
          onDestinationSelected: (indice) => setState(() => _aba = indice),
          // Só a aba escolhida mostra o texto.
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              // Um Badge no ícone mostra que há novidades na aba.
              icon: Badge.count(
                count: 3,
                child: const Icon(Icons.chat_bubble_outline),
              ),
              label: 'Chat',
            ),
            const NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_outlined)),
              label: 'Avisos',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Conta',
            ),
          ],
        ),
      ),
    );
  }
}
