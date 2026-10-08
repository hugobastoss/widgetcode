// Lê manifest/widgets.json na raiz do repositório e, para cada widget, o
// conteúdo real do arquivo-fonte apontado por `filePath` — gera
// lib/catalog/generated_snippets.g.dart com uma constante Map<String,
// String> (id -> código-fonte completo). Roda no CI antes do build do app
// de vitrine, então um widget editado sem regenerar o snippet quebra o
// build em vez de deixar o painel de código desatualizado.
//
// Uso: dart run tool/generate_snippets.dart  (a partir de apps/showcase/)
import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final repoRoot = Directory(
    scriptDir.parent.parent.parent.path,
  ); // tool/ -> showcase/ -> apps/ -> raiz
  final manifestFile = File('${repoRoot.path}/manifest/widgets.json');

  if (!manifestFile.existsSync()) {
    stderr.writeln('Não encontrei ${manifestFile.path}');
    exitCode = 1;
    return;
  }

  final manifest =
      jsonDecode(await manifestFile.readAsString()) as Map<String, dynamic>;
  final widgets = (manifest['widgets'] as List).cast<Map<String, dynamic>>();

  final buffer = StringBuffer()
    ..writeln('// GERADO AUTOMATICAMENTE — não edite à mão.')
    ..writeln(
      '// Rode `dart run tool/generate_snippets.dart` pra regenerar, depois',
    )
    ..writeln('// de editar qualquer arquivo em packages/flutter_widgets_hub.')
    ..writeln()
    ..writeln('const Map<String, String> kHubGeneratedSnippets = {');

  for (final entry in widgets) {
    final id = entry['id'] as String;
    final filePath = entry['filePath'] as String;
    final sourceFile = File('${repoRoot.path}/$filePath');

    if (!sourceFile.existsSync()) {
      stderr.writeln('Aviso: arquivo não encontrado pra "$id": $filePath');
      continue;
    }

    final codigo = await sourceFile.readAsString();
    buffer.writeln("  '$id': r'''\n$codigo''',");
  }

  buffer.writeln('};');

  final outputFile = File(
    '${scriptDir.parent.path}/lib/catalog/generated_snippets.g.dart',
  );
  await outputFile.writeAsString(buffer.toString());
  stdout.writeln(
    'Gerado: ${outputFile.path} (${widgets.length} widgets processados)',
  );
}
