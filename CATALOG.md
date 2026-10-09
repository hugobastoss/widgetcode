# Catálogo de exemplos

As 12 seções, 79 widgets e 210 exemplos do WidgetCode. Para trazer um exemplo para o seu projeto, cite o ID dele para a sua IA de código (veja o [README](README.md)).

Gerado por `examples/test/manifest_test.dart`, junto com o `manifest/widgets.json`. Não edite à mão.

## Layout

Widgets de layout organizam os outros na tela: lado a lado, empilhados, sobrepostos ou com espaço entre eles.

| Widget | Exemplo | ID |
|---|---|---|
| Container | Básico: Tamanho, cor e um texto centralizado com alignment. | [`layout/container_basico`](examples/lib/layout/container_basico.dart) |
| Container | Bordas e cantos: decoration com BoxDecoration: borda e cantos arredondados. | [`layout/container_bordas`](examples/lib/layout/container_bordas.dart) |
| Container | Sombra e gradiente: BoxDecoration também desenha gradientes e sombras. | [`layout/container_sombra_gradiente`](examples/lib/layout/container_sombra_gradiente.dart) |
| Container | Margem e padding: margin é o espaço por fora; padding, por dentro. | [`layout/container_margem_padding`](examples/lib/layout/container_margem_padding.dart) |
| Row | Básico: Três caixas lado a lado. | [`layout/row_basico`](examples/lib/layout/row_basico.dart) |
| Row | Alinhamento principal: mainAxisAlignment distribui na horizontal. Toque nas opções. | [`layout/row_alinhamento`](examples/lib/layout/row_alinhamento.dart) |
| Row | Alinhamento cruzado: crossAxisAlignment alinha na vertical. Toque nas opções. | [`layout/row_alinhamento_cruzado`](examples/lib/layout/row_alinhamento_cruzado.dart) |
| Row | Espaçamento: spacing põe o mesmo espaço entre todos os filhos. | [`layout/row_espacamento`](examples/lib/layout/row_espacamento.dart) |
| Column | Básico: Três caixas empilhadas. | [`layout/column_basico`](examples/lib/layout/column_basico.dart) |
| Column | Alinhamento principal: mainAxisAlignment distribui na vertical. Toque nas opções. | [`layout/column_alinhamento`](examples/lib/layout/column_alinhamento.dart) |
| Column | Tamanho (mainAxisSize): max ocupa toda a altura; min, só o necessário. | [`layout/column_tamanho`](examples/lib/layout/column_tamanho.dart) |
| Stack | Camadas: O primeiro filho fica no fundo; os seguintes, por cima. | [`layout/stack_camadas`](examples/lib/layout/stack_camadas.dart) |
| Stack | Positioned: Prende um filho a uma distância das bordas, como um selo de status. | [`layout/stack_positioned`](examples/lib/layout/stack_positioned.dart) |
| Stack | Texto sobre fundo: Uma faixa de texto por cima de uma imagem. | [`layout/stack_texto_sobre_fundo`](examples/lib/layout/stack_texto_sobre_fundo.dart) |
| Expanded | Ocupar o resto: O filho com Expanded fica com todo o espaço livre. | [`layout/expanded_basico`](examples/lib/layout/expanded_basico.dart) |
| Expanded | Proporções com flex: flex divide o espaço em partes: 1, 2 e 1. | [`layout/expanded_flex`](examples/lib/layout/expanded_flex.dart) |
| Expanded | Dentro de uma Column: Cabeçalho e rodapé fixos, conteúdo ocupando o meio. | [`layout/expanded_column`](examples/lib/layout/expanded_column.dart) |
| Expanded | Expanded × Flexible: Expanded obriga a ocupar o espaço; Flexible só permite. | [`layout/expanded_flexible`](examples/lib/layout/expanded_flexible.dart) |
| Padding | Com e sem padding: O mesmo texto, encostado e com 16 de espaço. | [`layout/padding_basico`](examples/lib/layout/padding_basico.dart) |
| Padding | Tipos de EdgeInsets: all, symmetric e only: espaço igual, por eixo ou por lado. | [`layout/padding_edge_insets`](examples/lib/layout/padding_edge_insets.dart) |
| Center | Básico: Coloca o filho no meio do espaço. | [`layout/center_basico`](examples/lib/layout/center_basico.dart) |
| Center | widthFactor e heightFactor: O Center fica do tamanho do filho vezes o fator. | [`layout/center_fatores`](examples/lib/layout/center_fatores.dart) |
| Align | Posições prontas: As 9 posições de Alignment. Escolha na lista. | [`layout/align_posicoes`](examples/lib/layout/align_posicoes.dart) |
| Align | Coordenadas: Alignment(x, y) de -1 a 1. Arraste os controles. | [`layout/align_coordenadas`](examples/lib/layout/align_coordenadas.dart) |
| SizedBox | Tamanho fixo: Força um tamanho exato no filho. | [`layout/sizedbox_tamanho`](examples/lib/layout/sizedbox_tamanho.dart) |
| SizedBox | Espaço entre widgets: Sem filho, vira um espaço vazio. | [`layout/sizedbox_espaco`](examples/lib/layout/sizedbox_espaco.dart) |
| Wrap | Quebra de linha: Os itens que não cabem vão para a linha de baixo. | [`layout/wrap_basico`](examples/lib/layout/wrap_basico.dart) |
| Wrap | Centralizado: alignment centraliza os itens em cada linha. | [`layout/wrap_centralizado`](examples/lib/layout/wrap_centralizado.dart) |
| Divider | Entre itens: Separa os itens de uma lista. | [`layout/divider_entre_itens`](examples/lib/layout/divider_entre_itens.dart) |
| Divider | Personalizado e vertical: Espessura, recuo, cor e o VerticalDivider. | [`layout/divider_personalizado`](examples/lib/layout/divider_personalizado.dart) |

## Texto e imagens

Widgets que mostram conteúdo: textos, ícones, imagens e avatares.

| Widget | Exemplo | ID |
|---|---|---|
| Text | Básico: Só o texto, com o estilo padrão do tema. | [`text_images/text_basico`](examples/lib/text_images/text_basico.dart) |
| Text | Estilo: TextStyle: tamanho, peso, cor, itálico, sublinhado. | [`text_images/text_estilo`](examples/lib/text_images/text_estilo.dart) |
| Text | Estilos do tema: Os tamanhos prontos do textTheme, em vez de números soltos. | [`text_images/text_tema`](examples/lib/text_images/text_tema.dart) |
| Text | Texto longo: maxLines e overflow cortam com "...". Toque em Ver mais. | [`text_images/text_longo`](examples/lib/text_images/text_longo.dart) |
| RichText | Básico: Uma árvore de TextSpan, cada pedaço com seu estilo. | [`text_images/rich_text_basico`](examples/lib/text_images/rich_text_basico.dart) |
| RichText | Text.rich: O atalho recomendado, que já herda o estilo do app. | [`text_images/rich_text_text_rich`](examples/lib/text_images/rich_text_text_rich.dart) |
| RichText | Ícone no texto: WidgetSpan coloca um widget no meio da frase. | [`text_images/rich_text_icone`](examples/lib/text_images/rich_text_icone.dart) |
| SelectableText | Básico: Toque e segure para selecionar e copiar. | [`text_images/selectable_text_basico`](examples/lib/text_images/selectable_text_basico.dart) |
| SelectableText | SelectionArea: Deixa vários textos selecionáveis de uma vez. | [`text_images/selectable_text_area`](examples/lib/text_images/selectable_text_area.dart) |
| Icon | Básico: Ícones da classe Icons, no tamanho padrão. | [`text_images/icon_basico`](examples/lib/text_images/icon_basico.dart) |
| Icon | Tamanho e cor: size e color mudam o tamanho e a cor. | [`text_images/icon_tamanho_cor`](examples/lib/text_images/icon_tamanho_cor.dart) |
| Icon | Variantes: O mesmo ícone em padrão, outlined, rounded e sharp. | [`text_images/icon_variantes`](examples/lib/text_images/icon_variantes.dart) |
| Image | Do app (asset): Image.asset com um arquivo declarado no pubspec.yaml. | [`text_images/image_asset`](examples/lib/text_images/image_asset.dart) |
| Image | Da internet: Image.network, com telas de carregando e de erro. | [`text_images/image_network`](examples/lib/text_images/image_network.dart) |
| Image | Ajuste (fit): BoxFit decide como a imagem cabe na caixa. Toque nas opções. | [`text_images/image_fit`](examples/lib/text_images/image_fit.dart) |
| Image | Cantos arredondados: ClipRRect recorta a imagem com cantos redondos. | [`text_images/image_cantos`](examples/lib/text_images/image_cantos.dart) |
| CircleAvatar | Iniciais e ícone: Um Text ou Icon como child. | [`text_images/circle_avatar_iniciais`](examples/lib/text_images/circle_avatar_iniciais.dart) |
| CircleAvatar | Com imagem: backgroundImage recorta a imagem em círculo. | [`text_images/circle_avatar_imagem`](examples/lib/text_images/circle_avatar_imagem.dart) |
| CircleAvatar | Tamanhos e cores: radius, backgroundColor e foregroundColor. | [`text_images/circle_avatar_tamanhos`](examples/lib/text_images/circle_avatar_tamanhos.dart) |
| Badge | Ponto: Sem label: só um ponto indicando novidade. | [`text_images/badge_ponto`](examples/lib/text_images/badge_ponto.dart) |
| Badge | Com número: label com um texto, ou Badge.count com limite de 99+. | [`text_images/badge_numero`](examples/lib/text_images/badge_numero.dart) |
| Badge | Contador: isLabelVisible esconde o selo quando a contagem é zero. | [`text_images/badge_contador`](examples/lib/text_images/badge_contador.dart) |

## Botões

Botões disparam uma ação quando tocados. Escolha o tipo pela importância da ação na tela.

| Widget | Exemplo | ID |
|---|---|---|
| ElevatedButton | Básico: O mínimo: um texto e a função chamada no toque. | [`buttons/elevated_button_basico`](examples/lib/buttons/elevated_button_basico.dart) |
| ElevatedButton | Com ícone: O construtor .icon põe um ícone antes do texto. | [`buttons/elevated_button_com_icone`](examples/lib/buttons/elevated_button_com_icone.dart) |
| ElevatedButton | Carregando: Troca o texto por um indicador enquanto a ação roda e bloqueia novos toques. | [`buttons/elevated_button_carregando`](examples/lib/buttons/elevated_button_carregando.dart) |
| ElevatedButton | Desabilitado: Com onPressed: null o botão fica desabilitado. Use a chave para alternar. | [`buttons/elevated_button_desabilitado`](examples/lib/buttons/elevated_button_desabilitado.dart) |
| ElevatedButton | Cores personalizadas: styleFrom muda cor, sombra, espaçamento e formato. | [`buttons/elevated_button_cores`](examples/lib/buttons/elevated_button_cores.dart) |
| FilledButton | Básico: A ação principal da tela, na cor primária do tema. | [`buttons/filled_button_basico`](examples/lib/buttons/filled_button_basico.dart) |
| FilledButton | Tonal: A versão .tonal, mais suave, junto da padrão para comparar. | [`buttons/filled_button_tonal`](examples/lib/buttons/filled_button_tonal.dart) |
| FilledButton | Com ícone: O construtor .icon com ícone e texto. | [`buttons/filled_button_com_icone`](examples/lib/buttons/filled_button_com_icone.dart) |
| FilledButton | Largura total: Dentro de um SizedBox com largura infinita, ocupa a linha toda. | [`buttons/filled_button_largura_total`](examples/lib/buttons/filled_button_largura_total.dart) |
| OutlinedButton | Básico: Só a borda, sem preenchimento. | [`buttons/outlined_button_basico`](examples/lib/buttons/outlined_button_basico.dart) |
| OutlinedButton | Com ícone: O construtor .icon com ícone e texto. | [`buttons/outlined_button_com_icone`](examples/lib/buttons/outlined_button_com_icone.dart) |
| OutlinedButton | Borda personalizada: styleFrom com side muda a cor e a espessura da borda. | [`buttons/outlined_button_borda`](examples/lib/buttons/outlined_button_borda.dart) |
| OutlinedButton | Destrutivo: Usa a cor de erro do tema para sinalizar uma ação perigosa. | [`buttons/outlined_button_destrutivo`](examples/lib/buttons/outlined_button_destrutivo.dart) |
| TextButton | Básico: Só o texto. O fundo aparece ao tocar. | [`buttons/text_button_basico`](examples/lib/buttons/text_button_basico.dart) |
| TextButton | Com ícone: O construtor .icon com ícone e texto. | [`buttons/text_button_com_icone`](examples/lib/buttons/text_button_com_icone.dart) |
| TextButton | Em um diálogo: O uso mais comum: as ações de um AlertDialog. | [`buttons/text_button_dialogo`](examples/lib/buttons/text_button_dialogo.dart) |
| IconButton | Padrão: Um ícone tocável, com tooltip para acessibilidade. | [`buttons/icon_button_padrao`](examples/lib/buttons/icon_button_padrao.dart) |
| IconButton | Variantes de estilo: Padrão, .filled, .filledTonal e .outlined lado a lado. | [`buttons/icon_button_variantes`](examples/lib/buttons/icon_button_variantes.dart) |
| IconButton | Alternável: isSelected alterna entre dois ícones, como em favoritar. | [`buttons/icon_button_alternavel`](examples/lib/buttons/icon_button_alternavel.dart) |
| IconButton | Tamanho e cor: iconSize e color mudam o tamanho e a cor do ícone. | [`buttons/icon_button_tamanho_cor`](examples/lib/buttons/icon_button_tamanho_cor.dart) |
| FloatingActionButton | Padrão: O tamanho normal. Costuma ir no floatingActionButton do Scaffold. | [`buttons/fab_padrao`](examples/lib/buttons/fab_padrao.dart) |
| FloatingActionButton | Pequeno: .small, para telas com pouco espaço. | [`buttons/fab_pequeno`](examples/lib/buttons/fab_pequeno.dart) |
| FloatingActionButton | Grande: .large, para dar mais destaque à ação. | [`buttons/fab_grande`](examples/lib/buttons/fab_grande.dart) |
| FloatingActionButton | Estendido: .extended, com ícone e texto. | [`buttons/fab_estendido`](examples/lib/buttons/fab_estendido.dart) |
| SegmentedButton | Seleção única: Só um segmento marcado por vez. | [`buttons/segmented_button_unica`](examples/lib/buttons/segmented_button_unica.dart) |
| SegmentedButton | Seleção múltipla: multiSelectionEnabled permite marcar vários. | [`buttons/segmented_button_multipla`](examples/lib/buttons/segmented_button_multipla.dart) |
| SegmentedButton | Com ícones: Segmentos só com ícone, cada um com seu tooltip. | [`buttons/segmented_button_icones`](examples/lib/buttons/segmented_button_icones.dart) |

## Formulários

Campos para a pessoa digitar e escolher: a base das telas de login, cadastro e busca.

| Widget | Exemplo | ID |
|---|---|---|
| TextField | Básico: Um campo com rótulo. | [`forms/text_field_basico`](examples/lib/forms/text_field_basico.dart) |
| TextField | Decoração: InputDecoration: dica, ajuda, ícones, prefixo e borda. | [`forms/text_field_decoracao`](examples/lib/forms/text_field_decoracao.dart) |
| TextField | Tipos de teclado: keyboardType e textInputAction para e-mail, número e telefone. | [`forms/text_field_teclados`](examples/lib/forms/text_field_teclados.dart) |
| TextField | Senha: obscureText e um botão para mostrar ou esconder. | [`forms/text_field_senha`](examples/lib/forms/text_field_senha.dart) |
| TextField | Ler o que foi digitado: TextEditingController e onChanged, com botão de limpar. | [`forms/text_field_controller`](examples/lib/forms/text_field_controller.dart) |
| TextField | Várias linhas e limite: minLines, maxLines e maxLength com contador. | [`forms/text_field_linhas`](examples/lib/forms/text_field_linhas.dart) |
| TextFormField | Validação: validator mostra o erro enquanto a pessoa digita. | [`forms/text_form_field_validacao`](examples/lib/forms/text_form_field_validacao.dart) |
| TextFormField | Só números: inputFormatters bloqueiam letras e limitam o tamanho. | [`forms/text_form_field_formatadores`](examples/lib/forms/text_form_field_formatadores.dart) |
| Form | Validar ao enviar: validate() confere todos os campos de uma vez. | [`forms/form_validar`](examples/lib/forms/form_validar.dart) |
| Form | Salvar e restaurar: save() chama os onSaved; reset() volta ao valor inicial. | [`forms/form_salvar`](examples/lib/forms/form_salvar.dart) |
| SearchBar | Filtrando uma lista: onChanged filtra as frutas a cada letra digitada. | [`forms/search_bar_filtro`](examples/lib/forms/search_bar_filtro.dart) |
| SearchBar | Com sugestões: SearchAnchor.bar abre uma tela de busca com sugestões. | [`forms/search_bar_sugestoes`](examples/lib/forms/search_bar_sugestoes.dart) |
| DropdownMenu | Básico: Opções com valor e rótulo, e onSelected. | [`forms/dropdown_menu_basico`](examples/lib/forms/dropdown_menu_basico.dart) |
| DropdownMenu | Com filtro: enableFilter: digite para encontrar a opção. | [`forms/dropdown_menu_filtro`](examples/lib/forms/dropdown_menu_filtro.dart) |
| DropdownMenu | Valor inicial e ícones: initialSelection, leadingIcon e um enum como valor. | [`forms/dropdown_menu_icones`](examples/lib/forms/dropdown_menu_icones.dart) |
| Autocomplete | Básico: Digite o começo de uma capital, como "Be". | [`forms/autocomplete_basico`](examples/lib/forms/autocomplete_basico.dart) |
| Autocomplete | Com objetos: Opções que são objetos, com campo personalizado. | [`forms/autocomplete_objetos`](examples/lib/forms/autocomplete_objetos.dart) |

## Seleção

Controles para marcar, ligar, escolher e ajustar valores com um toque.

| Widget | Exemplo | ID |
|---|---|---|
| Checkbox | Básico: value e onChanged, com o valor guardado no State. | [`selection/checkbox_basico`](examples/lib/selection/checkbox_basico.dart) |
| Checkbox | CheckboxListTile: Checkbox e texto numa linha toda tocável. | [`selection/checkbox_list_tile`](examples/lib/selection/checkbox_list_tile.dart) |
| Checkbox | Selecionar tudo: tristate: marcado, desmarcado ou "alguns" (null). | [`selection/checkbox_tres_estados`](examples/lib/selection/checkbox_tres_estados.dart) |
| Radio | RadioGroup: O jeito atual: o grupo guarda a escolha, cada Radio só o valor. | [`selection/radio_grupo`](examples/lib/selection/radio_grupo.dart) |
| Radio | RadioListTile: Cada opção numa linha tocável, com subtítulo. | [`selection/radio_list_tile`](examples/lib/selection/radio_list_tile.dart) |
| Switch | Básico: Liga e desliga, mostrando o estado ao lado. | [`selection/switch_basico`](examples/lib/selection/switch_basico.dart) |
| Switch | SwitchListTile: O formato clássico das telas de Configurações. | [`selection/switch_list_tile`](examples/lib/selection/switch_list_tile.dart) |
| Switch | Com ícone: thumbIcon muda o ícone da bolinha conforme o estado. | [`selection/switch_icone`](examples/lib/selection/switch_icone.dart) |
| Slider | Contínuo: Qualquer valor de 0 a 1, como um volume. | [`selection/slider_continuo`](examples/lib/selection/slider_continuo.dart) |
| Slider | Divisões e rótulo: divisions faz pular de 1 em 1; label mostra o valor. | [`selection/slider_divisoes`](examples/lib/selection/slider_divisoes.dart) |
| Slider | Cores: activeColor, inactiveColor e thumbColor. | [`selection/slider_cores`](examples/lib/selection/slider_cores.dart) |
| RangeSlider | Faixa de preço: RangeValues, divisões e um rótulo em cada ponta. | [`selection/range_slider_preco`](examples/lib/selection/range_slider_preco.dart) |
| RangeSlider | Ao soltar: onChangeEnd só roda quando a pessoa solta o dedo. | [`selection/range_slider_ao_soltar`](examples/lib/selection/range_slider_ao_soltar.dart) |
| FilterChip | Filtros: Um Set guarda as etiquetas marcadas. | [`selection/filter_chip_filtros`](examples/lib/selection/filter_chip_filtros.dart) |
| FilterChip | Com ícones: avatar com um ícone e sem o ✓ (showCheckmark). | [`selection/filter_chip_icones`](examples/lib/selection/filter_chip_icones.dart) |
| ChoiceChip | Opcional: Tocar na escolhida desmarca: pode ficar sem nenhuma. | [`selection/choice_chip_opcional`](examples/lib/selection/choice_chip_opcional.dart) |
| ChoiceChip | Sempre uma escolhida: Ignorando o bool, nunca fica sem opção. | [`selection/choice_chip_obrigatorio`](examples/lib/selection/choice_chip_obrigatorio.dart) |

## Listas e rolagem

Listas, grades e tudo o que rola na tela. Quase todo app tem pelo menos uma.

| Widget | Exemplo | ID |
|---|---|---|
| ListView | Lista simples: Itens fixos em children. Dentro de outra rolagem, precisa de altura. | [`lists/list_view_simples`](examples/lib/lists/list_view_simples.dart) |
| ListView | ListView.builder: Cria só os itens visíveis: aguenta 1000 contatos. | [`lists/list_view_builder`](examples/lib/lists/list_view_builder.dart) |
| ListView | ListView.separated: Um separador entre cada item. | [`lists/list_view_separated`](examples/lib/lists/list_view_separated.dart) |
| ListView | Horizontal: scrollDirection: Axis.horizontal, com cards lado a lado. | [`lists/list_view_horizontal`](examples/lib/lists/list_view_horizontal.dart) |
| GridView | GridView.count: Um número fixo de colunas. | [`lists/grid_view_count`](examples/lib/lists/grid_view_count.dart) |
| GridView | GridView.builder: Itens sob demanda e proporção com childAspectRatio. | [`lists/grid_view_builder`](examples/lib/lists/grid_view_builder.dart) |
| GridView | Largura máxima: As colunas se ajustam ao tamanho da tela. | [`lists/grid_view_extent`](examples/lib/lists/grid_view_extent.dart) |
| ListTile | Básico: Título e subtítulo. | [`lists/list_tile_basico`](examples/lib/lists/list_tile_basico.dart) |
| ListTile | leading e trailing: Avatar antes e horário depois do texto. | [`lists/list_tile_leading_trailing`](examples/lib/lists/list_tile_leading_trailing.dart) |
| ListTile | Seleção: selected e onTap para escolher uma opção. | [`lists/list_tile_selecao`](examples/lib/lists/list_tile_selecao.dart) |
| ListTile | Três linhas: isThreeLine para subtítulos longos. | [`lists/list_tile_tres_linhas`](examples/lib/lists/list_tile_tres_linhas.dart) |
| SingleChildScrollView | Vertical: Uma Column maior que o espaço, sem overflow. | [`lists/single_child_scroll_view_vertical`](examples/lib/lists/single_child_scroll_view_vertical.dart) |
| SingleChildScrollView | Horizontal: Uma fileira de filtros que rola para o lado. | [`lists/single_child_scroll_view_horizontal`](examples/lib/lists/single_child_scroll_view_horizontal.dart) |
| PageView | Básico: Deslize para trocar de página. | [`lists/page_view_basico`](examples/lib/lists/page_view_basico.dart) |
| PageView | Com indicador: onPageChanged atualiza os pontinhos. | [`lists/page_view_indicador`](examples/lib/lists/page_view_indicador.dart) |
| PageView | Com botões: PageController muda de página pelo código. | [`lists/page_view_botoes`](examples/lib/lists/page_view_botoes.dart) |
| CustomScrollView | Slivers: Cabeçalho, grade e lista numa rolagem só. | [`lists/custom_scroll_view_slivers`](examples/lib/lists/custom_scroll_view_slivers.dart) |
| CustomScrollView | SliverAppBar: Uma barra com imagem que encolhe ao rolar. | [`lists/custom_scroll_view_app_bar`](examples/lib/lists/custom_scroll_view_app_bar.dart) |
| RefreshIndicator | Puxe para atualizar: Puxe a lista para baixo: chega uma mensagem nova. | [`lists/refresh_indicator_basico`](examples/lib/lists/refresh_indicator_basico.dart) |
| RefreshIndicator | Lista vazia: Como deixar puxar mesmo sem nenhum item. | [`lists/refresh_indicator_vazio`](examples/lib/lists/refresh_indicator_vazio.dart) |
| DataTable | Básico: Colunas, linhas e células. | [`lists/data_table_basico`](examples/lib/lists/data_table_basico.dart) |
| DataTable | Ordenação: Toque no cabeçalho de uma coluna para ordenar. | [`lists/data_table_ordenacao`](examples/lib/lists/data_table_ordenacao.dart) |

## Navegação

Como a pessoa anda pelo app: barras, abas, menus e a troca entre telas.

| Widget | Exemplo | ID |
|---|---|---|
| AppBar | Básico: Um Scaffold com AppBar e título. | [`navigation/app_bar_basico`](examples/lib/navigation/app_bar_basico.dart) |
| AppBar | leading e actions: Menu à esquerda e botões de ação à direita. | [`navigation/app_bar_acoes`](examples/lib/navigation/app_bar_acoes.dart) |
| AppBar | Cores e título no meio: backgroundColor, foregroundColor e centerTitle. | [`navigation/app_bar_cores`](examples/lib/navigation/app_bar_cores.dart) |
| NavigationBar | Básico: Três abas que trocam o conteúdo da tela. | [`navigation/navigation_bar_basico`](examples/lib/navigation/navigation_bar_basico.dart) |
| NavigationBar | Com selos: Badge nos ícones e texto só na aba escolhida. | [`navigation/navigation_bar_selos`](examples/lib/navigation/navigation_bar_selos.dart) |
| NavigationRail | Básico: Destinos com ícone e texto ao lado do conteúdo. | [`navigation/navigation_rail_basico`](examples/lib/navigation/navigation_rail_basico.dart) |
| NavigationRail | Com FAB: leading com um FAB e destinos no meio da barra. | [`navigation/navigation_rail_fab`](examples/lib/navigation/navigation_rail_fab.dart) |
| NavigationDrawer | Menu lateral: drawer no Scaffold e o ☰ automático na AppBar. | [`navigation/navigation_drawer_basico`](examples/lib/navigation/navigation_drawer_basico.dart) |
| NavigationDrawer | Abrir pelo código: endDrawer e Scaffold.of(context) dentro de um Builder. | [`navigation/navigation_drawer_codigo`](examples/lib/navigation/navigation_drawer_codigo.dart) |
| TabBar | Com TabBarView: Abas na AppBar e conteúdo que troca deslizando. | [`navigation/tab_bar_view`](examples/lib/navigation/tab_bar_view.dart) |
| TabBar | Rolável com ícones: isScrollable para muitas abas, com ícone e texto. | [`navigation/tab_bar_rolavel`](examples/lib/navigation/tab_bar_rolavel.dart) |
| BottomAppBar | FAB dentro da barra: floatingActionButtonLocation.endContained. | [`navigation/bottom_app_bar_fab`](examples/lib/navigation/bottom_app_bar_fab.dart) |
| BottomAppBar | FAB encaixado no meio: centerDocked com o recorte CircularNotchedRectangle. | [`navigation/bottom_app_bar_entalhe`](examples/lib/navigation/bottom_app_bar_entalhe.dart) |
| Navigator | push e pop: Abre uma tela nova e volta para esta. | [`navigation/navigator_push_pop`](examples/lib/navigation/navigator_push_pop.dart) |
| Navigator | Recebendo um valor: A outra tela devolve a escolha no pop. | [`navigation/navigator_resultado`](examples/lib/navigation/navigator_resultado.dart) |

## Diálogos e avisos

Como o app conversa com a pessoa: confirmações, avisos, painéis e indicadores de carregando.

| Widget | Exemplo | ID |
|---|---|---|
| AlertDialog | Básico: showDialog com título, texto e um botão OK. | [`feedback/alert_dialog_basico`](examples/lib/feedback/alert_dialog_basico.dart) |
| AlertDialog | Confirmação com resposta: O valor do pop volta no await do showDialog. | [`feedback/alert_dialog_resultado`](examples/lib/feedback/alert_dialog_resultado.dart) |
| AlertDialog | Com ícone e ação perigosa: icon no topo e o botão de excluir em destaque. | [`feedback/alert_dialog_icone`](examples/lib/feedback/alert_dialog_icone.dart) |
| AlertDialog | Escolher uma opção: SimpleDialog: cada opção fecha e devolve seu valor. | [`feedback/alert_dialog_opcoes`](examples/lib/feedback/alert_dialog_opcoes.dart) |
| SnackBar | Básico: ScaffoldMessenger.showSnackBar com uma mensagem. | [`feedback/snack_bar_basico`](examples/lib/feedback/snack_bar_basico.dart) |
| SnackBar | Com Desfazer: SnackBarAction: um botão dentro do aviso. | [`feedback/snack_bar_desfazer`](examples/lib/feedback/snack_bar_desfazer.dart) |
| SnackBar | Flutuante: Solta das bordas, com X para fechar e duração maior. | [`feedback/snack_bar_flutuante`](examples/lib/feedback/snack_bar_flutuante.dart) |
| BottomSheet | Menu de opções: showModalBottomSheet com uma lista de ações. | [`feedback/bottom_sheet_basico`](examples/lib/feedback/bottom_sheet_basico.dart) |
| BottomSheet | Arrastável: DraggableScrollableSheet: arraste o painel e role a lista. | [`feedback/bottom_sheet_arrastavel`](examples/lib/feedback/bottom_sheet_arrastavel.dart) |
| BottomSheet | Com campo de texto: viewInsets faz o painel subir junto com o teclado. | [`feedback/bottom_sheet_teclado`](examples/lib/feedback/bottom_sheet_teclado.dart) |
| Tooltip | Básico: Toque e segure o ícone para ver a dica. | [`feedback/tooltip_basico`](examples/lib/feedback/tooltip_basico.dart) |
| Tooltip | Personalizado: Abre com um toque, em cima do ícone, com outras cores. | [`feedback/tooltip_personalizado`](examples/lib/feedback/tooltip_personalizado.dart) |
| MaterialBanner | Básico: Ícone, mensagem e uma ação para fechar. | [`feedback/material_banner_basico`](examples/lib/feedback/material_banner_basico.dart) |
| MaterialBanner | Com duas ações: Cores do tema e ações embaixo do texto. | [`feedback/material_banner_acoes`](examples/lib/feedback/material_banner_acoes.dart) |
| CircularProgressIndicator | Girando: Sem value: carregando sem saber quanto falta. | [`feedback/circular_indeterminado`](examples/lib/feedback/circular_indeterminado.dart) |
| CircularProgressIndicator | Com progresso: value de 0 a 1 mostra quanto já foi feito. | [`feedback/circular_determinado`](examples/lib/feedback/circular_determinado.dart) |
| LinearProgressIndicator | Correndo: Sem value: a barra corre sem parar. | [`feedback/linear_indeterminado`](examples/lib/feedback/linear_indeterminado.dart) |
| LinearProgressIndicator | Etapas: Progresso de um passo a passo, com altura e cantos. | [`feedback/linear_etapas`](examples/lib/feedback/linear_etapas.dart) |

## Cartões e painéis

Superfícies que agrupam conteúdo e painéis que abrem e fecham para mostrar mais.

| Widget | Exemplo | ID |
|---|---|---|
| Card | Básico: Um Card com Padding e texto. | [`cards/card_basico`](examples/lib/cards/card_basico.dart) |
| Card | Três estilos: Card, Card.filled e Card.outlined. | [`cards/card_variantes`](examples/lib/cards/card_variantes.dart) |
| Card | Com imagem e ações: Imagem no topo, ListTile e botões no rodapé. | [`cards/card_completo`](examples/lib/cards/card_completo.dart) |
| Card | Tocável: InkWell dentro do Card, com clipBehavior. | [`cards/card_tocavel`](examples/lib/cards/card_tocavel.dart) |
| ExpansionTile | Perguntas frequentes: Toque numa pergunta para ver a resposta. | [`cards/expansion_tile_basico`](examples/lib/cards/expansion_tile_basico.dart) |
| ExpansionTile | Começa aberto: initiallyExpanded, ícone e onExpansionChanged. | [`cards/expansion_tile_aberto`](examples/lib/cards/expansion_tile_aberto.dart) |
| ExpansionPanelList | Básico: Você guarda o aberto/fechado de cada painel. | [`cards/expansion_panel_basico`](examples/lib/cards/expansion_panel_basico.dart) |
| ExpansionPanelList | Um aberto por vez: ExpansionPanelList.radio fecha os outros sozinho. | [`cards/expansion_panel_radio`](examples/lib/cards/expansion_panel_radio.dart) |

## Animações

Animações prontas: mude um valor com setState e o Flutter faz a transição.

| Widget | Exemplo | ID |
|---|---|---|
| AnimatedContainer | Tamanho, cor e cantos: Mude os valores com setState e veja a transição. | [`animations/animated_container_basico`](examples/lib/animations/animated_container_basico.dart) |
| AnimatedContainer | Curvas: A mesma animação com curvas diferentes. | [`animations/animated_container_curvas`](examples/lib/animations/animated_container_curvas.dart) |
| AnimatedOpacity | Aparecer e sumir: opacity de 1 para 0 com uma duração. | [`animations/animated_opacity_basico`](examples/lib/animations/animated_opacity_basico.dart) |
| AnimatedOpacity | Sumir de verdade: Invisível ainda ocupa espaço: onEnd remove depois do fade. | [`animations/animated_opacity_espaco`](examples/lib/animations/animated_opacity_espaco.dart) |
| AnimatedSwitcher | Contador: Cada número novo entra com fade. A key faz a mágica. | [`animations/animated_switcher_contador`](examples/lib/animations/animated_switcher_contador.dart) |
| AnimatedSwitcher | Transição personalizada: transitionBuilder com ScaleTransition no ícone. | [`animations/animated_switcher_transicao`](examples/lib/animations/animated_switcher_transicao.dart) |
| Hero | Foto que abre: A mesma tag nas duas telas. Toque na foto. | [`animations/hero_imagem`](examples/lib/animations/hero_imagem.dart) |
| Hero | Avatar e nome: Dois Heroes, e o Material que protege o texto no voo. | [`animations/hero_perfil`](examples/lib/animations/hero_perfil.dart) |
| TweenAnimationBuilder | Número que conta: O saldo sobe contando até o valor novo. | [`animations/tween_numero`](examples/lib/animations/tween_numero.dart) |
| TweenAnimationBuilder | Cor: ColorTween: o coração muda de cor suavemente. | [`animations/tween_cor`](examples/lib/animations/tween_cor.dart) |

## Gestos

Interações além do botão: toques, arrastos, deslizar para apagar e zoom.

| Widget | Exemplo | ID |
|---|---|---|
| GestureDetector | Tipos de toque: onTap, onDoubleTap e onLongPress na mesma caixa. | [`gestures/gesture_detector_toques`](examples/lib/gestures/gesture_detector_toques.dart) |
| GestureDetector | Arrastar: onHorizontalDragUpdate move a bolinha pela trilha. | [`gestures/gesture_detector_arrastar`](examples/lib/gestures/gesture_detector_arrastar.dart) |
| GestureDetector | Área de toque: Toque no espaço vazio de cada caixa: só a da direita conta. | [`gestures/gesture_detector_area`](examples/lib/gestures/gesture_detector_area.dart) |
| InkWell | Básico: onTap com a onda respeitando os cantos. | [`gestures/ink_well_basico`](examples/lib/gestures/ink_well_basico.dart) |
| InkWell | Fundo colorido: use Ink: Com Container a onda some; com Ink ela aparece. | [`gestures/ink_well_ink`](examples/lib/gestures/ink_well_ink.dart) |
| InkWell | Onda redonda: customBorder e splashColor num ícone. | [`gestures/ink_well_redondo`](examples/lib/gestures/ink_well_redondo.dart) |
| Dismissible | Arrastar para apagar: key única, fundo vermelho e onDismissed. | [`gestures/dismissible_apagar`](examples/lib/gestures/dismissible_apagar.dart) |
| Dismissible | Confirmar antes: confirmDismiss pergunta antes de apagar. | [`gestures/dismissible_confirmar`](examples/lib/gestures/dismissible_confirmar.dart) |
| Draggable | Arrastar e soltar: Draggable com data e um DragTarget que recebe a cor. | [`gestures/draggable_soltar`](examples/lib/gestures/draggable_soltar.dart) |
| Draggable | Segurar para arrastar: LongPressDraggable: não atrapalha a rolagem da página. | [`gestures/draggable_segurar`](examples/lib/gestures/draggable_segurar.dart) |
| InteractiveViewer | Zoom numa imagem: minScale e maxScale limitam o zoom. | [`gestures/interactive_viewer_zoom`](examples/lib/gestures/interactive_viewer_zoom.dart) |
| InteractiveViewer | Voltar ao normal: TransformationController desfaz o zoom pelo código. | [`gestures/interactive_viewer_reset`](examples/lib/gestures/interactive_viewer_reset.dart) |

## Estilo iOS

O visual do iPhone: os widgets Cupertino imitam os componentes nativos do iOS.

| Widget | Exemplo | ID |
|---|---|---|
| CupertinoButton | Três estilos: Padrão, .tinted e .filled. | [`cupertino/cupertino_button_estilos`](examples/lib/cupertino/cupertino_button_estilos.dart) |
| CupertinoButton | Com ícone e desabilitado: CupertinoIcons e onPressed: null. | [`cupertino/cupertino_button_icone`](examples/lib/cupertino/cupertino_button_icone.dart) |
| CupertinoSwitch | Básico: value, onChanged e a cor de ligado. | [`cupertino/cupertino_switch_basico`](examples/lib/cupertino/cupertino_switch_basico.dart) |
| CupertinoSwitch | Widgets adaptativos: .adaptive vira Cupertino no iPhone. Troque a plataforma. | [`cupertino/widgets_adaptativos`](examples/lib/cupertino/widgets_adaptativos.dart) |
| CupertinoNavigationBar | Básico: CupertinoPageScaffold com título e botão. | [`cupertino/cupertino_nav_bar_basico`](examples/lib/cupertino/cupertino_nav_bar_basico.dart) |
| CupertinoNavigationBar | Título grande: CupertinoSliverNavigationBar encolhe ao rolar. | [`cupertino/cupertino_nav_bar_titulo_grande`](examples/lib/cupertino/cupertino_nav_bar_titulo_grande.dart) |
| CupertinoAlertDialog | Básico: showCupertinoDialog com a ação recomendada em negrito. | [`cupertino/cupertino_alert_basico`](examples/lib/cupertino/cupertino_alert_basico.dart) |
| CupertinoAlertDialog | Ação destrutiva: isDestructiveAction deixa a ação perigosa em vermelho. | [`cupertino/cupertino_alert_destrutivo`](examples/lib/cupertino/cupertino_alert_destrutivo.dart) |
| CupertinoAlertDialog | CupertinoActionSheet: Opções que sobem de baixo, com o Cancelar separado. | [`cupertino/cupertino_action_sheet`](examples/lib/cupertino/cupertino_action_sheet.dart) |
| CupertinoPicker | Lista de opções: itemExtent, controller inicial e onSelectedItemChanged. | [`cupertino/cupertino_picker_lista`](examples/lib/cupertino/cupertino_picker_lista.dart) |
| CupertinoPicker | Hora (CupertinoDatePicker): A roleta de horário, em formato 24h. | [`cupertino/cupertino_date_picker`](examples/lib/cupertino/cupertino_date_picker.dart) |
| CupertinoSlider | Básico: value, min, max e divisions, como no Slider. | [`cupertino/cupertino_slider_basico`](examples/lib/cupertino/cupertino_slider_basico.dart) |
