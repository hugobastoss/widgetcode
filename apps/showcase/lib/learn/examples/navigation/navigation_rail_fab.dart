import 'package:flutter/material.dart';

class NavigationRailFab extends StatefulWidget {
  const NavigationRailFab({super.key});

  @override
  State<NavigationRailFab> createState() => _NavigationRailFabState();
}

class _NavigationRailFabState extends State<NavigationRailFab> {
  int _aba = 0;

  static const _titulos = ['E-mails', 'Agenda', 'Contatos'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Row(
        children: [
          NavigationRail(
            selectedIndex: _aba,
            onDestinationSelected: (indice) => setState(() => _aba = indice),
            // selected: só o destino escolhido mostra o texto.
            labelType: NavigationRailLabelType.selected,
            // leading: o que vem antes dos destinos (costuma ser um FAB).
            leading: FloatingActionButton.small(
              tooltip: 'Novo',
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            // -1 = destinos no topo, 0 = no meio, 1 = embaixo.
            groupAlignment: 0,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.mail_outline),
                label: Text('E-mails'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.event_outlined),
                label: Text('Agenda'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_outline),
                label: Text('Contatos'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(child: Center(child: Text(_titulos[_aba]))),
        ],
      ),
    );
  }
}
