import 'package:flutter/material.dart';

class BottomSheetBasico extends StatelessWidget {
  const BottomSheetBasico({super.key});

  void _abrir(BuildContext context) {
    // showModalBottomSheet sobe um painel de baixo para cima. Tocar fora
    // dele ou arrastar para baixo fecha.
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => Column(
        // min: o painel fica só da altura do conteúdo.
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.share_outlined),
            title: const Text('Compartilhar'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.link),
            title: const Text('Copiar link'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline),
            title: const Text('Excluir'),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => _abrir(context),
      child: const Text('Mais opções'),
    );
  }
}
