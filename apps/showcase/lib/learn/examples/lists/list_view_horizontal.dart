import 'package:flutter/material.dart';

class ListViewHorizontal extends StatelessWidget {
  const ListViewHorizontal({super.key});

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    // Na horizontal, quem precisa ser definida é a altura da lista.
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, indice) => const SizedBox(width: 12),
        itemBuilder: (context, indice) {
          return Container(
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _cores[indice % _cores.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Card ${indice + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
