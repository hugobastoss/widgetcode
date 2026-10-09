import 'package:flutter/material.dart';

class ListViewSimples extends StatelessWidget {
  const ListViewSimples({super.key});

  @override
  Widget build(BuildContext context) {
    // Uma lista dentro de outra área com rolagem (como esta página) precisa
    // de uma altura definida — senão o Flutter mostra o erro "Vertical
    // viewport was given unbounded height". Numa tela comum, a lista vai
    // direto no body do Scaffold e não precisa disso.
    return SizedBox(
      height: 220,
      child: ListView(
        children: const [
          ListTile(leading: Icon(Icons.inbox_outlined), title: Text('Entrada')),
          ListTile(leading: Icon(Icons.star_border), title: Text('Com estrela')),
          ListTile(leading: Icon(Icons.send_outlined), title: Text('Enviados')),
          ListTile(leading: Icon(Icons.drafts_outlined), title: Text('Rascunhos')),
          ListTile(leading: Icon(Icons.archive_outlined), title: Text('Arquivo')),
          ListTile(leading: Icon(Icons.delete_outline), title: Text('Lixeira')),
        ],
      ),
    );
  }
}
