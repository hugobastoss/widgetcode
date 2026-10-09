import 'package:flutter/material.dart';

class RefreshIndicatorBasico extends StatefulWidget {
  const RefreshIndicatorBasico({super.key});

  @override
  State<RefreshIndicatorBasico> createState() => _RefreshIndicatorBasicoState();
}

class _RefreshIndicatorBasicoState extends State<RefreshIndicatorBasico> {
  final _mensagens = ['Mensagem 3', 'Mensagem 2', 'Mensagem 1'];

  // onRefresh precisa devolver um Future: o indicador gira até ele terminar.
  Future<void> _atualizar() async {
    // Simula buscar dados novos num servidor.
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _mensagens.insert(0, 'Mensagem ${_mensagens.length + 1}'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      // Puxe a lista para baixo para atualizar.
      child: RefreshIndicator(
        onRefresh: _atualizar,
        child: ListView.builder(
          // Com poucos itens a lista não rola — e sem rolar, não dá para
          // puxar. AlwaysScrollableScrollPhysics deixa puxar mesmo assim.
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _mensagens.length,
          itemBuilder: (context, indice) {
            return ListTile(
              leading: const Icon(Icons.mail_outline),
              title: Text(_mensagens[indice]),
            );
          },
        ),
      ),
    );
  }
}
