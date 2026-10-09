import 'package:flutter/material.dart';

import '../examples/forms/autocomplete_basico.dart';
import '../examples/forms/autocomplete_objetos.dart';
import '../examples/forms/dropdown_menu_basico.dart';
import '../examples/forms/dropdown_menu_filtro.dart';
import '../examples/forms/dropdown_menu_icones.dart';
import '../examples/forms/form_salvar.dart';
import '../examples/forms/form_validar.dart';
import '../examples/forms/search_bar_filtro.dart';
import '../examples/forms/search_bar_sugestoes.dart';
import '../examples/forms/text_field_basico.dart';
import '../examples/forms/text_field_controller.dart';
import '../examples/forms/text_field_decoracao.dart';
import '../examples/forms/text_field_linhas.dart';
import '../examples/forms/text_field_senha.dart';
import '../examples/forms/text_field_teclados.dart';
import '../examples/forms/text_form_field_formatadores.dart';
import '../examples/forms/text_form_field_validacao.dart';
import '../models.dart';

const _kPasta = 'lib/learn/examples/forms';

final kFormsDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'TextField',
    description: 'O campo de texto: onde a pessoa digita.',
    preview: const SizedBox(
      width: 220,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Nome',
          border: OutlineInputBorder(),
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Um campo com rótulo.',
        sourcePath: '$_kPasta/text_field_basico.dart',
        builder: (_) => const TextFieldBasico(),
      ),
      WidgetExample(
        title: 'Decoração',
        description: 'InputDecoration: dica, ajuda, ícones, prefixo e borda.',
        sourcePath: '$_kPasta/text_field_decoracao.dart',
        builder: (_) => const TextFieldDecoracao(),
      ),
      WidgetExample(
        title: 'Tipos de teclado',
        description: 'keyboardType e textInputAction para e-mail, número e telefone.',
        sourcePath: '$_kPasta/text_field_teclados.dart',
        builder: (_) => const TextFieldTeclados(),
      ),
      WidgetExample(
        title: 'Senha',
        description: 'obscureText e um botão para mostrar ou esconder.',
        sourcePath: '$_kPasta/text_field_senha.dart',
        builder: (_) => const TextFieldSenha(),
      ),
      WidgetExample(
        title: 'Ler o que foi digitado',
        description: 'TextEditingController e onChanged, com botão de limpar.',
        sourcePath: '$_kPasta/text_field_controller.dart',
        builder: (_) => const TextFieldController(),
      ),
      WidgetExample(
        title: 'Várias linhas e limite',
        description: 'minLines, maxLines e maxLength com contador.',
        sourcePath: '$_kPasta/text_field_linhas.dart',
        builder: (_) => const TextFieldLinhas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TextFormField',
    description: 'Um TextField com validação, feito para usar dentro de um Form.',
    preview: const SizedBox(
      width: 220,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'E-mail',
          errorText: 'Falta o @ no e-mail',
          border: OutlineInputBorder(),
        ),
      ),
    ),
    examples: [
      WidgetExample(
        title: 'Validação',
        description: 'validator mostra o erro enquanto a pessoa digita.',
        sourcePath: '$_kPasta/text_form_field_validacao.dart',
        builder: (_) => const TextFormFieldValidacao(),
      ),
      WidgetExample(
        title: 'Só números',
        description: 'inputFormatters bloqueiam letras e limitam o tamanho.',
        sourcePath: '$_kPasta/text_form_field_formatadores.dart',
        builder: (_) => const TextFormFieldFormatadores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Form',
    description: 'Agrupa campos para validar, salvar e limpar todos de uma vez.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        final campo = BoxDecoration(
          border: Border.all(color: cores.outline),
          borderRadius: BorderRadius.circular(4),
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            Container(width: 180, height: 20, decoration: campo),
            Container(width: 180, height: 20, decoration: campo),
            Container(
              width: 80,
              height: 22,
              decoration: BoxDecoration(
                color: cores.primary,
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ],
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Validar ao enviar',
        description: 'validate() confere todos os campos de uma vez.',
        sourcePath: '$_kPasta/form_validar.dart',
        builder: (_) => const FormValidar(),
      ),
      WidgetExample(
        title: 'Salvar e restaurar',
        description: 'save() chama os onSaved; reset() volta ao valor inicial.',
        sourcePath: '$_kPasta/form_salvar.dart',
        builder: (_) => const FormSalvar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SearchBar',
    description: 'A barra de busca do Material 3.',
    preview: const SizedBox(
      width: 240,
      child: SearchBar(hintText: 'Buscar', leading: Icon(Icons.search)),
    ),
    examples: [
      WidgetExample(
        title: 'Filtrando uma lista',
        description: 'onChanged filtra as frutas a cada letra digitada.',
        sourcePath: '$_kPasta/search_bar_filtro.dart',
        builder: (_) => const SearchBarFiltro(),
      ),
      WidgetExample(
        title: 'Com sugestões',
        description: 'SearchAnchor.bar abre uma tela de busca com sugestões.',
        sourcePath: '$_kPasta/search_bar_sugestoes.dart',
        builder: (_) => const SearchBarSugestoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'DropdownMenu',
    description: 'Um campo que abre uma lista de opções para escolher.',
    preview: const DropdownMenu<String>(
      label: Text('Tamanho'),
      initialSelection: 'M',
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'P', label: 'Pequeno'),
        DropdownMenuEntry(value: 'M', label: 'Médio'),
      ],
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Opções com valor e rótulo, e onSelected.',
        sourcePath: '$_kPasta/dropdown_menu_basico.dart',
        builder: (_) => const DropdownMenuBasico(),
      ),
      WidgetExample(
        title: 'Com filtro',
        description: 'enableFilter: digite para encontrar a opção.',
        sourcePath: '$_kPasta/dropdown_menu_filtro.dart',
        builder: (_) => const DropdownMenuFiltro(),
      ),
      WidgetExample(
        title: 'Valor inicial e ícones',
        description: 'initialSelection, leadingIcon e um enum como valor.',
        sourcePath: '$_kPasta/dropdown_menu_icones.dart',
        builder: (_) => const DropdownMenuIcones(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Autocomplete',
    description: 'Um campo que sugere opções enquanto a pessoa digita.',
    preview: Builder(
      builder: (context) {
        final cores = Theme.of(context).colorScheme;
        final estilo = Theme.of(context).textTheme.bodySmall;
        return SizedBox(
          width: 180,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 26,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: cores.primary, width: 2)),
                ),
                child: Text('Bra', style: estilo),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: cores.surfaceContainerHighest,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text('Brasil', style: estilo),
                    Text('Brasília', style: estilo),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
    examples: [
      WidgetExample(
        title: 'Básico',
        description: 'Digite o começo de uma capital, como "Be".',
        sourcePath: '$_kPasta/autocomplete_basico.dart',
        builder: (_) => const AutocompleteBasico(),
      ),
      WidgetExample(
        title: 'Com objetos',
        description: 'Opções que são objetos, com campo personalizado.',
        sourcePath: '$_kPasta/autocomplete_objetos.dart',
        builder: (_) => const AutocompleteObjetos(),
      ),
    ],
  ),
];
