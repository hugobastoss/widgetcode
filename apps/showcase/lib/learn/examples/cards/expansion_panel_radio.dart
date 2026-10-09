import 'package:flutter/material.dart';

class ExpansionPanelRadioExemplo extends StatelessWidget {
  const ExpansionPanelRadioExemplo({super.key});

  static const _planos = {
    'Básico': 'Até 5 projetos e suporte por e-mail.',
    'Pro': 'Projetos ilimitados e suporte por chat.',
    'Empresa': 'Tudo do Pro, mais gerente de conta.',
  };

  @override
  Widget build(BuildContext context) {
    // .radio: só um painel aberto por vez: abrir um fecha o outro. O
    // próprio widget controla isso, sem precisar de setState.
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 'Pro',
      children: [
        for (final plano in _planos.entries)
          ExpansionPanelRadio(
            // value identifica cada painel.
            value: plano.key,
            canTapOnHeader: true,
            headerBuilder: (context, aberto) => ListTile(title: Text(plano.key)),
            body: ListTile(subtitle: Text(plano.value)),
          ),
      ],
    );
  }
}
