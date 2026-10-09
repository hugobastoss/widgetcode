// Gera, a partir do cadastro das seções, os dois índices dos exemplos e
// falha se algum estiver desatualizado:
//
// - manifest/widgets.json, que a IA e a skill widgetcode leem para achar e
//   trazer um exemplo;
// - CATALOG.md, a lista navegável para quem procura um exemplo no GitHub.
//
// Depois de adicionar ou mudar um exemplo, atualize os dois com:
//
//   flutter test --dart-define=UPDATE_MANIFEST=true test/manifest_test.dart
//
// (a partir de examples/).
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:widgetcode_examples/widgetcode_examples.dart';

const _atualizar = bool.fromEnvironment('UPDATE_MANIFEST');
const _caminhoDoManifest = '../manifest/widgets.json';
const _caminhoDoCatalogo = '../CATALOG.md';
const _pasta = 'examples';
const _repositorio = 'https://github.com/hugobastoss/widgetcode';

Map<String, String> _traducoes(Tr texto) => {
  'pt': texto.pt,
  'en': texto.en,
  'es': texto.es,
};

/// A classe pública que o arquivo do exemplo define (a que o dev usa).
String _classePublica(String codigo, String caminho) {
  final achada = RegExp(
    r'^class ([A-Z]\w*) extends (?:StatelessWidget|StatefulWidget)',
    multiLine: true,
  ).firstMatch(codigo);
  if (achada == null) {
    throw StateError('$caminho não define uma classe pública de widget.');
  }
  return achada.group(1)!;
}

/// O que o exemplo precisa além do próprio arquivo para funcionar noutro
/// projeto, lido do código: imagens do app e acesso à internet.
List<Map<String, String>> _requisitos(String codigo) {
  final imagens = RegExp(
    r"'(assets/[^']+)'",
  ).allMatches(codigo).map((achado) => achado.group(1)!).toSet();
  final usaInternet =
      codigo.contains('Image.network') || codigo.contains('NetworkImage(');
  return [
    for (final imagem in imagens)
      {'type': 'asset', 'path': imagem, 'filePath': '$_pasta/$imagem'},
    if (usaInternet)
      {'type': 'androidPermission', 'name': 'android.permission.INTERNET'},
  ];
}

Map<String, Object> _exemplo(WidgetExample exemplo) {
  final codigo = File(exemplo.sourcePath).readAsStringSync();
  final requisitos = _requisitos(codigo);
  return {
    'id': exemplo.id,
    'title': _traducoes(exemplo.title),
    'description': _traducoes(exemplo.description),
    'filePath': '$_pasta/${exemplo.sourcePath}',
    'className': _classePublica(codigo, exemplo.sourcePath),
    if (requisitos.isNotEmpty) 'requires': requisitos,
  };
}

String _gerarManifest() {
  final widgets = kLearnSections.expand((secao) => secao.docs).toList();
  final manifest = {
    'schemaVersion': 2,
    'generatedBy':
        'examples/test/manifest_test.dart (não edite à mão; veja o '
        'comando de atualização no topo desse arquivo).',
    'repository': _repositorio,
    'rawBaseUrl':
        'https://raw.githubusercontent.com/hugobastoss/widgetcode/main/',
    'totals': {
      'sections': kLearnSections.length,
      'widgets': widgets.length,
      'examples': widgets.expand((doc) => doc.examples).length,
    },
    'sections': [
      for (final secao in kLearnSections)
        {
          'id': secao.id,
          'name': _traducoes(secao.name),
          'widgets': [
            for (final doc in secao.docs)
              {
                'name': doc.name,
                'description': _traducoes(doc.description),
                'examples': [
                  for (final exemplo in doc.examples) _exemplo(exemplo),
                ],
              },
          ],
        },
    ],
  };
  return '${const JsonEncoder.withIndent('  ').convert(manifest)}\n';
}

/// Uma célula de tabela do Markdown: a barra vertical cortaria a coluna.
String _celula(String texto) => texto.replaceAll('|', r'\|');

String _gerarCatalogo() {
  final widgets = kLearnSections.expand((secao) => secao.docs).toList();
  final exemplos = widgets.expand((doc) => doc.examples).length;
  final saida = StringBuffer()
    ..writeln('# Catálogo de exemplos')
    ..writeln()
    ..writeln(
      'As ${kLearnSections.length} seções, ${widgets.length} widgets e '
      '$exemplos exemplos do WidgetCode. Para trazer um exemplo para o seu '
      'projeto, cite o ID dele para a sua IA de código (veja o '
      '[README](README.md)).',
    )
    ..writeln()
    ..writeln(
      'Gerado por `examples/test/manifest_test.dart`, junto com o '
      '`manifest/widgets.json`. Não edite à mão.',
    );
  for (final secao in kLearnSections) {
    saida
      ..writeln()
      ..writeln('## ${secao.name.pt}')
      ..writeln()
      ..writeln(secao.intro.pt)
      ..writeln()
      ..writeln('| Widget | Exemplo | ID |')
      ..writeln('|---|---|---|');
    for (final doc in secao.docs) {
      for (final exemplo in doc.examples) {
        saida.writeln(
          '| ${doc.name} '
          '| ${_celula(exemplo.title.pt)}: ${_celula(exemplo.description.pt)} '
          '| [`${exemplo.id}`]($_pasta/${exemplo.sourcePath}) |',
        );
      }
    }
  }
  return saida.toString();
}

/// Confere (ou, com UPDATE_MANIFEST, regrava) um arquivo gerado.
void _conferir(String caminho, String gerado) {
  final arquivo = File(caminho);
  if (_atualizar) {
    arquivo.writeAsStringSync(gerado);
    return;
  }
  expect(arquivo.existsSync(), isTrue, reason: 'Falta $caminho.');
  // O Git no Windows pode trocar \n por \r\n na cópia de trabalho.
  final atual = arquivo.readAsStringSync().replaceAll('\r\n', '\n');
  expect(
    atual == gerado,
    isTrue,
    reason:
        '$caminho está desatualizado. Rode a partir de examples/:\n'
        '  flutter test --dart-define=UPDATE_MANIFEST=true '
        'test/manifest_test.dart',
  );
}

void main() {
  test('manifest/widgets.json está em sincronia com o cadastro', () {
    _conferir(_caminhoDoManifest, _gerarManifest());
  });

  test('CATALOG.md está em sincronia com o cadastro', () {
    _conferir(_caminhoDoCatalogo, _gerarCatalogo());
  });

  test('os IDs dos exemplos são únicos e seguem a pasta da seção', () {
    final ids = <String>{};
    for (final secao in kLearnSections) {
      for (final exemplo in secao.docs.expand((doc) => doc.examples)) {
        expect(
          ids.add(exemplo.id),
          isTrue,
          reason: 'ID repetido: ${exemplo.id}',
        );
        expect(
          exemplo.id.startsWith('${secao.id}/'),
          isTrue,
          reason: '${exemplo.id} não está na pasta da seção ${secao.id}',
        );
      }
    }
  });
}
