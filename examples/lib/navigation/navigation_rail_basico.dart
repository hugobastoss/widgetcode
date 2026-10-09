import 'package:flutter/material.dart';

class NavigationRailBasico extends StatefulWidget {
  const NavigationRailBasico({super.key});

  @override
  State<NavigationRailBasico> createState() => _NavigationRailBasicoState();
}

class _NavigationRailBasicoState extends State<NavigationRailBasico> {
  int _aba = 0;

  static const _titulos = ['Início', 'Salvos', 'Ajustes'];

  @override
  Widget build(BuildContext context) {
    // NavigationRail é a barra de navegação na lateral. É a versão da
    // NavigationBar para tablets e telas largas.
    return SizedBox(
      height: 300,
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _aba,
            onDestinationSelected: (indice) => setState(() => _aba = indice),
            // all: mostra o texto de todos os destinos.
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Início'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.bookmark),
                label: Text('Salvos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Ajustes'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          // O conteúdo ocupa o resto da largura.
          Expanded(child: Center(child: Text(_titulos[_aba]))),
        ],
      ),
    );
  }
}
