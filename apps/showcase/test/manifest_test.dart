// Gera manifest/widgets.json (o índice que a IA e a skill
// widgetcode leem para achar e trazer um exemplo) a partir do
// cadastro de seções do app, e falha se o arquivo estiver desatualizado.
//
// Depois de adicionar ou mudar um exemplo, atualize o manifest com:
//
//   flutter test --dart-define=UPDATE_MANIFEST=true test/manifest_test.dart
//
// (a partir de apps/showcase/).
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widgets_hub_showcase/learn/models.dart';
import 'package:flutter_widgets_hub_showcase/learn/sections.dart';
import 'package:flutter_widgets_hub_showcase/learn/tr.dart';

const _atualizar = bool.fromEnvironment('UPDATE_MANIFEST');
const _caminhoDoManifest = '../../manifest/widgets.json';
const _pastaDoApp = 'apps/showcase';
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
      {'type': 'asset', 'path': imagem, 'filePath': '$_pastaDoApp/$imagem'},
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
    'filePath': '$_pastaDoApp/${exemplo.sourcePath}',
    'className': _classePublica(codigo, exemplo.sourcePath),
    if (requisitos.isNotEmpty) 'requires': requisitos,
  };
}

String _gerarManifest() {
  final widgets = kLearnSections.expand((secao) => secao.docs).toList();
  final manifest = {
    'schemaVersion': 2,
    'generatedBy':
        'apps/showcase/test/manifest_test.dart (não edite à mão; veja o '
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

void main() {
  test('manifest/widgets.json está em sincronia com os exemplos do app', () {
    final gerado = _gerarManifest();
    final arquivo = File(_caminhoDoManifest);

    if (_atualizar) {
      arquivo.writeAsStringSync(gerado);
      return;
    }

    expect(arquivo.existsSync(), isTrue, reason: 'Falta $_caminhoDoManifest.');
    // O Git no Windows pode trocar \n por \r\n na cópia de trabalho.
    final atual = arquivo.readAsStringSync().replaceAll('\r\n', '\n');
    expect(
      atual == gerado,
      isTrue,
      reason:
          'manifest/widgets.json está desatualizado. Rode a partir de '
          'apps/showcase:\n'
          '  flutter test --dart-define=UPDATE_MANIFEST=true '
          'test/manifest_test.dart',
    );
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
