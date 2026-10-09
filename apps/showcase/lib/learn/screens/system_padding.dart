import 'package:flutter/widgets.dart';

/// [padding] mais o espaço que o sistema ocupa embaixo e nas laterais (a
/// barra de gestos, o entalhe da câmera em paisagem).
///
/// Um ListView ou CustomScrollView com padding próprio deixa de reservar
/// esse espaço sozinho — e, com o Android desenhando o app atrás da barra de
/// gestos (edge-to-edge), o fim da lista ficaria embaixo dela. Também vale
/// dentro de bottom sheets, que vão até a borda de baixo da tela.
EdgeInsets withSystemPadding(BuildContext context, EdgeInsets padding) {
  return padding + MediaQuery.paddingOf(context).copyWith(top: 0);
}
