import 'package:flutter/material.dart';

class NavigationDrawerBasico extends StatefulWidget {
  const NavigationDrawerBasico({super.key});

  @override
  State<NavigationDrawerBasico> createState() => _NavigationDrawerBasicoState();
}

class _NavigationDrawerBasicoState extends State<NavigationDrawerBasico> {
  // A chave dá acesso ao estado do Scaffold: abrir e fechar o menu.
  final _chaveDoScaffold = GlobalKey<ScaffoldState>();
  int _pasta = 0;

  static const _pastas = ['Entrada', 'Enviados', 'Lixeira'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Scaffold(
        key: _chaveDoScaffold,
        // Com um drawer no Scaffold, a AppBar mostra o ☰ sozinha.
        appBar: AppBar(title: Text(_pastas[_pasta])),
        drawer: NavigationDrawer(
          selectedIndex: _pasta,
          onDestinationSelected: (indice) {
            setState(() => _pasta = indice);
            _chaveDoScaffold.currentState!.closeDrawer();
          },
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text('E-mail'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.inbox_outlined),
              label: Text('Entrada'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.send_outlined),
              label: Text('Enviados'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.delete_outline),
              label: Text('Lixeira'),
            ),
          ],
        ),
        body: const Center(child: Text('Toque no ☰ ou deslize da borda.')),
      ),
    );
  }
}
