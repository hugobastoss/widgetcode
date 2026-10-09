import 'package:flutter/material.dart';

class NavigationDrawerCodigo extends StatelessWidget {
  const NavigationDrawerCodigo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Scaffold(
        // endDrawer: o menu que abre do lado direito.
        endDrawer: const NavigationDrawer(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text('Filtros'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.sell_outlined),
              label: Text('Promoções'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.new_releases_outlined),
              label: Text('Novidades'),
            ),
          ],
        ),
        body: Center(
          // Scaffold.of(context) procura o Scaffold ACIMA do context. O
          // context do build() está fora deste Scaffold, então daria erro. O
          // Builder cria um context novo, já dentro dele.
          child: Builder(
            builder: (context) => FilledButton.tonal(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              child: const Text('Abrir filtros'),
            ),
          ),
        ),
      ),
    );
  }
}
