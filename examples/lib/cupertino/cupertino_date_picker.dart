import 'package:flutter/cupertino.dart';

class CupertinoDatePickerExemplo extends StatefulWidget {
  const CupertinoDatePickerExemplo({super.key});

  @override
  State<CupertinoDatePickerExemplo> createState() =>
      _CupertinoDatePickerExemploState();
}

class _CupertinoDatePickerExemploState
    extends State<CupertinoDatePickerExemplo> {
  DateTime _alarme = DateTime(2026, 1, 1, 7, 30);

  String _doisDigitos(int numero) => numero.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        SizedBox(
          height: 180,
          child: CupertinoDatePicker(
            // time: só hora e minuto. Também existem date e dateAndTime.
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            // Só é lido na primeira vez; depois, quem manda é o dedo.
            initialDateTime: _alarme,
            onDateTimeChanged: (novo) => setState(() => _alarme = novo),
          ),
        ),
        Text('Alarme: ${_doisDigitos(_alarme.hour)}:${_doisDigitos(_alarme.minute)}'),
      ],
    );
  }
}
