import 'package:flutter/material.dart';

class TweenCor extends StatefulWidget {
  const TweenCor({super.key});

  @override
  State<TweenCor> createState() => _TweenCorState();
}

class _TweenCorState extends State<TweenCor> {
  bool _curtido = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: _curtido ? 'Descurtir' : 'Curtir',
      iconSize: 64,
      onPressed: () => setState(() => _curtido = !_curtido),
      icon: TweenAnimationBuilder<Color?>(
        // ColorTween anima entre cores. Só com end, ele parte da cor atual.
        tween: ColorTween(end: _curtido ? Colors.pink : Colors.grey),
        duration: const Duration(milliseconds: 400),
        builder: (context, cor, child) => Icon(Icons.favorite, color: cor),
      ),
    );
  }
}
