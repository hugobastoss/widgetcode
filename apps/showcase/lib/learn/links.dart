/// Endereços que a tela de configurações abre.
///
/// O ID do app (packageName) vem do app instalado, pelo PackageInfo, e não
/// fica escrito aqui: quando o applicationId do android/app/build.gradle.kts
/// mudar, os links da Play Store mudam junto.
library;

const kDeveloperName = 'HVCB App&Games';

/// Página do app na Play Store (avaliar e compartilhar).
Uri playStoreAppUri(String packageName) =>
    Uri.https('play.google.com', '/store/apps/details', {'id': packageName});

/// Página da conta de desenvolvedor na Play Store (mais aplicativos).
Uri playStoreDeveloperUri() => Uri.https(
  'play.google.com',
  '/store/apps/developer',
  {'id': kDeveloperName},
);

/// Nova issue no repositório, com o corpo já preenchido (suporte).
Uri newIssueUri(String body) => Uri.https(
  'github.com',
  '/hugobastoss/flutterwidgetshub/issues/new',
  {'body': body},
);
