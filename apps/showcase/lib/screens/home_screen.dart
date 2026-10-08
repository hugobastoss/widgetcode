import 'package:flutter/material.dart';

import '../catalog/catalog_data.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = kHubCatalog.map((w) => w.category).toSet().toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widgets Hub')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categorias.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final categoria = categorias[i];
          final quantidade = kHubCatalog
              .where((w) => w.category == categoria)
              .length;
          return Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              title: Text(kHubCategoryLabels[categoria] ?? categoria),
              subtitle: Text('$quantidade widget(s)'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CategoryScreen(category: categoria),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
