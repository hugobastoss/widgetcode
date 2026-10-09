import 'package:flutter/material.dart';

class MaterialBannerAcoes extends StatefulWidget {
  const MaterialBannerAcoes({super.key});

  @override
  State<MaterialBannerAcoes> createState() => _MaterialBannerAcoesState();
}

class _MaterialBannerAcoesState extends State<MaterialBannerAcoes> {
  String? _resposta;

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    if (_resposta != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_resposta!),
          TextButton(
            onPressed: () => setState(() => _resposta = null),
            child: const Text('Mostrar o banner de novo'),
          ),
        ],
      );
    }

    return MaterialBanner(
      backgroundColor: cores.secondaryContainer,
      leading: Icon(Icons.backup_outlined, color: cores.onSecondaryContainer),
      content: Text(
        'Faça backup das suas fotos para não perdê-las se trocar de celular.',
        style: TextStyle(color: cores.onSecondaryContainer),
      ),
      // Com mais de uma ação, o banner as coloca embaixo do texto.
      actions: [
        TextButton(
          onPressed: () => setState(() => _resposta = 'Lembraremos depois.'),
          child: const Text('Agora não'),
        ),
        TextButton(
          onPressed: () => setState(() => _resposta = 'Backup ativado!'),
          child: const Text('Ativar backup'),
        ),
      ],
    );
  }
}
