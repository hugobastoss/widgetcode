import 'package:flutter/material.dart';

class GridViewCount extends StatelessWidget {
  const GridViewCount({super.key});

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      // .count: você escolhe quantas colunas a grade tem.
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 8, // espaço entre linhas
        crossAxisSpacing: 8, // espaço entre colunas
        children: [
          for (var i = 0; i < 12; i++)
            Container(
              color: _cores[i % _cores.length],
              alignment: Alignment.center,
              child: Text(
                '${i + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
