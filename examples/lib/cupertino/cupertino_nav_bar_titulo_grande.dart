import 'package:flutter/cupertino.dart';

class CupertinoNavBarTituloGrande extends StatelessWidget {
  const CupertinoNavBarTituloGrande({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            // O título grande do iOS: role a lista e ele encolhe, indo para
            // o meio da barra.
            const CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              largeTitle: Text('Contatos'),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, indice) =>
                  CupertinoListTile(title: Text('Contato ${indice + 1}')),
            ),
          ],
        ),
      ),
    );
  }
}
