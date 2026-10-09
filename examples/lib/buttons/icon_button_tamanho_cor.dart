import 'package:flutter/material.dart';

class IconButtonTamanhoCor extends StatelessWidget {
  const IconButtonTamanhoCor({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      tooltip: 'Curtir',
      iconSize: 36, // o padrão é 24
      color: Colors.pink,
      icon: const Icon(Icons.thumb_up_outlined),
    );
  }
}
