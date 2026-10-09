import 'package:flutter/material.dart';

enum Entrega { retirar, padrao, expressa }

class RadioGrupo extends StatefulWidget {
  const RadioGrupo({super.key});

  @override
  State<RadioGrupo> createState() => _RadioGrupoState();
}

class _RadioGrupoState extends State<RadioGrupo> {
  Entrega _entrega = Entrega.padrao;

  @override
  Widget build(BuildContext context) {
    // Desde o Flutter 3.32, quem guarda a opção escolhida e avisa a
    // mudança é o RadioGroup, não mais cada Radio. Todos os Radio dentro
    // dele fazem parte do mesmo grupo.
    return RadioGroup<Entrega>(
      groupValue: _entrega,
      onChanged: (valor) => setState(() => _entrega = valor!),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Forma de entrega'),
          // Cada Radio só precisa saber o próprio valor.
          Row(children: [Radio(value: Entrega.retirar), Text('Retirar')]),
          Row(children: [Radio(value: Entrega.padrao), Text('Padrão')]),
          Row(children: [Radio(value: Entrega.expressa), Text('Expressa')]),
        ],
      ),
    );
  }
}
