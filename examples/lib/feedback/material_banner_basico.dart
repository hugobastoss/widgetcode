import 'package:flutter/material.dart';

class MaterialBannerBasico extends StatefulWidget {
  const MaterialBannerBasico({super.key});

  @override
  State<MaterialBannerBasico> createState() => _MaterialBannerBasicoState();
}

class _MaterialBannerBasicoState extends State<MaterialBannerBasico> {
  bool _visivel = true;

  @override
  Widget build(BuildContext context) {
    if (!_visivel) {
      return TextButton(
        onPressed: () => setState(() => _visivel = true),
        child: const Text('Mostrar o banner de novo'),
      );
    }

    // Diferente da SnackBar, o banner não some sozinho: fica até a pessoa
    // tomar uma ação. Use para avisos importantes. Ele também pode ser
    // mostrado no topo da tela com ScaffoldMessenger.showMaterialBanner.
    return MaterialBanner(
      leading: const Icon(Icons.wifi_off),
      content: const Text('Você está sem internet. Algumas funções não vão funcionar.'),
      actions: [
        TextButton(
          onPressed: () => setState(() => _visivel = false),
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
