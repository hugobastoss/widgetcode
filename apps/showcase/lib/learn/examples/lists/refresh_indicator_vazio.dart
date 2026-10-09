import 'package:flutter/material.dart';

class RefreshIndicatorVazio extends StatefulWidget {
  const RefreshIndicatorVazio({super.key});

  @override
  State<RefreshIndicatorVazio> createState() => _RefreshIndicatorVazioState();
}

class _RefreshIndicatorVazioState extends State<RefreshIndicatorVazio> {
  List<String> _pedidos = [];

  Future<void> _atualizar() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    setState(() => _pedidos = ['Pedido #1042', 'Pedido #1043']);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: RefreshIndicator(
        onRefresh: _atualizar,
        // O RefreshIndicator precisa de algo que role como filho. Para a
        // tela vazia, um ListView com a mensagem dentro — e não um Center
        // sozinho, que não deixaria puxar.
        child: _pedidos.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 64),
                  Icon(Icons.inbox_outlined, size: 40),
                  SizedBox(height: 8),
                  Text(
                    'Nenhum pedido. Puxe para atualizar.',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  for (final pedido in _pedidos)
                    ListTile(
                      leading: const Icon(Icons.receipt_long_outlined),
                      title: Text(pedido),
                    ),
                ],
              ),
      ),
    );
  }
}
