import 'package:flutter/cupertino.dart';

class CupertinoSwitchBasico extends StatefulWidget {
  const CupertinoSwitchBasico({super.key});

  @override
  State<CupertinoSwitchBasico> createState() => _CupertinoSwitchBasicoState();
}

class _CupertinoSwitchBasicoState extends State<CupertinoSwitchBasico> {
  bool _ligado = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        CupertinoSwitch(
          value: _ligado,
          onChanged: (valor) => setState(() => _ligado = valor),
          // A cor quando ligado. Sem isto, é o verde do iOS.
          activeTrackColor: CupertinoColors.systemIndigo,
        ),
        Text(_ligado ? 'Ligado' : 'Desligado'),
      ],
    );
  }
}
