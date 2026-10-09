import 'package:flutter/material.dart';

class NavigatorResultado extends StatefulWidget {
  const NavigatorResultado({super.key});

  @override
  State<NavigatorResultado> createState() => _NavigatorResultadoState();
}

class _NavigatorResultadoState extends State<NavigatorResultado> {
  String _cor = 'nenhuma';

  Future<void> _escolher() async {
    // push devolve um Future com o valor que a outra tela mandar no pop.
    final cor = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (context) => const _TelaDeCores()),
    );

    // null = a pessoa voltou sem escolher (seta de voltar).
    if (!mounted || cor == null) return;
    setState(() => _cor = cor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Text('Cor escolhida: $_cor'),
        FilledButton.tonal(onPressed: _escolher, child: const Text('Escolher cor')),
      ],
    );
  }
}

class _TelaDeCores extends StatelessWidget {
  const _TelaDeCores();

  static const _cores = ['Azul', 'Verde', 'Laranja'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escolha uma cor')),
      body: ListView(
        children: [
          for (final cor in _cores)
            ListTile(
              title: Text(cor),
              // pop com um valor: ele chega no await da tela anterior.
              onTap: () => Navigator.of(context).pop(cor),
            ),
        ],
      ),
    );
  }
}
