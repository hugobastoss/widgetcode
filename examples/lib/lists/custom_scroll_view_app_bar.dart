import 'package:flutter/material.dart';

class CustomScrollViewAppBar extends StatelessWidget {
  const CustomScrollViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: CustomScrollView(
        slivers: [
          // SliverAppBar encolhe conforme a lista rola. Role para ver.
          SliverAppBar(
            pinned: true, // a barra pequena continua visível no topo
            expandedHeight: 140, // altura quando está toda aberta
            // Os dois abaixo só existem porque este exemplo está dentro de
            // um cartão: sem eles, a barra reservaria espaço para a barra de
            // status do celular e mostraria uma seta de voltar.
            primary: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Viagens'),
              background: Image.asset(
                'assets/images/paisagem.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, indice) {
              return ListTile(
                leading: const Icon(Icons.place_outlined),
                title: Text('Destino ${indice + 1}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
