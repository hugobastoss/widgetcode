import 'package:flutter/material.dart';

import '../catalog/catalog_data.dart';
import 'widget_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    final widgets = kHubCatalog.where((w) => w.category == category).toList();

    return Scaffold(
      appBar: AppBar(title: Text(kHubCategoryLabels[category] ?? category)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: widgets.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final entry = widgets[i];
          return Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              title: Text(entry.name),
              subtitle: Text(entry.description),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => WidgetDetailScreen(entry: entry),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
