import 'package:flutter/material.dart';

class TextLongo extends StatefulWidget {
  const TextLongo({super.key});

  @override
  State<TextLongo> createState() => _TextLongoState();
}

class _TextLongoState extends State<TextLongo> {
  bool _expandido = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'O Flutter é um kit de desenvolvimento criado pelo Google para '
          'construir apps bonitos para celular, web e desktop a partir de '
          'um único código. Tudo na tela é um widget.',
          // maxLines corta o texto depois de N linhas (null = sem limite).
          maxLines: _expandido ? null : 2,
          // overflow diz o que fazer com o que foi cortado: "..." no fim.
          overflow: _expandido ? null : TextOverflow.ellipsis,
        ),
        TextButton(
          onPressed: () => setState(() => _expandido = !_expandido),
          child: Text(_expandido ? 'Ver menos' : 'Ver mais'),
        ),
      ],
    );
  }
}
