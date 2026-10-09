import 'package:flutter/material.dart';

class HeroPerfil extends StatelessWidget {
  const HeroPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Hero(
        tag: 'avatar-ana',
        child: CircleAvatar(child: Text('AS')),
      ),
      title: const Hero(
        tag: 'nome-ana',
        // Durante o voo, o Hero sai da tela e perde o estilo de texto do
        // Material (o texto aparece sublinhado em amarelo). Um Material
        // transparente em volta do texto resolve.
        child: Material(
          type: MaterialType.transparency,
          child: Text('Ana Souza'),
        ),
      ),
      subtitle: const Text('Toque para abrir o perfil'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const _TelaDoPerfil()),
      ),
    );
  }
}

class _TelaDoPerfil extends StatelessWidget {
  const _TelaDoPerfil();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const Hero(
              tag: 'avatar-ana',
              child: CircleAvatar(
                radius: 56,
                child: Text('AS', style: TextStyle(fontSize: 32)),
              ),
            ),
            Hero(
              tag: 'nome-ana',
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  'Ana Souza',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
