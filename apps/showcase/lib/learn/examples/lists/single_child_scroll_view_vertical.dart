import 'package:flutter/material.dart';

class SingleChildScrollViewVertical extends StatelessWidget {
  const SingleChildScrollViewVertical({super.key});

  static const _cores = [Colors.indigo, Colors.teal, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // Estes 8 blocos não cabem em 200 de altura. Sem o
      // SingleChildScrollView, a Column mostraria o erro de overflow (as
      // faixas amarelas e pretas). Com ele, o conteúdo rola.
      child: SingleChildScrollView(
        child: Column(
          spacing: 8,
          children: [
            for (var i = 0; i < 8; i++)
              Container(
                height: 48,
                width: double.infinity,
                color: _cores[i % _cores.length],
                alignment: Alignment.center,
                child: Text(
                  'Bloco ${i + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
