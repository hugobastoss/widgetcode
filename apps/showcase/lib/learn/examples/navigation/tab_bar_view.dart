import 'package:flutter/material.dart';

class TabBarComView extends StatelessWidget {
  const TabBarComView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // DefaultTabController liga a TabBar à TabBarView: tocar numa aba
      // troca o conteúdo, e deslizar o conteúdo troca a aba.
      child: DefaultTabController(
        // length: quantas abas. Precisa bater com tabs e children.
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Conversas'),
            // A TabBar costuma ficar no bottom da AppBar.
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Status'),
                Tab(text: 'Ligações'),
              ],
            ),
          ),
          // Um filho para cada aba, na mesma ordem.
          body: const TabBarView(
            children: [
              Center(child: Text('Lista de chats')),
              Center(child: Text('Atualizações de status')),
              Center(child: Text('Histórico de ligações')),
            ],
          ),
        ),
      ),
    );
  }
}
