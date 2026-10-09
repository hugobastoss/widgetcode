import 'package:flutter/material.dart';

class ExpansionPanelBasico extends StatefulWidget {
  const ExpansionPanelBasico({super.key});

  @override
  State<ExpansionPanelBasico> createState() => _ExpansionPanelBasicoState();
}

class _ExpansionPanelBasicoState extends State<ExpansionPanelBasico> {
  // Diferente do ExpansionTile, aqui quem guarda o "aberto ou fechado"
  // de cada painel é você.
  final _abertos = [true, false, false];

  static const _titulos = ['Entrega', 'Pagamento', 'Trocas'];
  static const _textos = [
    'Enviamos para todo o Brasil.',
    'Pix, cartão ou boleto.',
    'Até 7 dias depois de receber.',
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      // Chamado ao tocar na seta: recebe o índice do painel e se ele vai
      // abrir (true) ou fechar (false).
      expansionCallback: (indice, abrir) {
        setState(() => _abertos[indice] = abrir);
      },
      children: [
        for (var i = 0; i < _titulos.length; i++)
          ExpansionPanel(
            isExpanded: _abertos[i],
            // Abre e fecha tocando no cabeçalho todo, não só na seta.
            canTapOnHeader: true,
            headerBuilder: (context, aberto) => ListTile(title: Text(_titulos[i])),
            body: ListTile(subtitle: Text(_textos[i])),
          ),
      ],
    );
  }
}
