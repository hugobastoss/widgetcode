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
import '../tr.dart';

const _kPasta = 'lib/learn/examples/forms';

const _basico = Tr(pt: 'Básico', en: 'Basic', es: 'Básico');

final kFormsDocs = <WidgetDoc>[
  WidgetDoc(
    name: 'TextField',
    description: const Tr(
      pt: 'O campo de texto: onde a pessoa digita.',
      en: 'The text field: where people type.',
      es: 'El campo de texto: donde la persona escribe.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Um campo com rótulo.',
          en: 'A field with a label.',
          es: 'Un campo con etiqueta.',
        ),
        sourcePath: '$_kPasta/text_field_basico.dart',
        builder: (_) => const TextFieldBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Decoração', en: 'Decoration', es: 'Decoración'),
        description: const Tr(
          pt: 'InputDecoration: dica, ajuda, ícones, prefixo e borda.',
          en: 'InputDecoration: hint, helper text, icons, prefix and border.',
          es: 'InputDecoration: pista, ayuda, íconos, prefijo y borde.',
        ),
        sourcePath: '$_kPasta/text_field_decoracao.dart',
        builder: (_) => const TextFieldDecoracao(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Tipos de teclado',
          en: 'Keyboard types',
          es: 'Tipos de teclado',
        ),
        description: const Tr(
          pt: 'keyboardType e textInputAction para e-mail, número e telefone.',
          en: 'keyboardType and textInputAction for email, number and phone.',
          es: 'keyboardType y textInputAction para correo, número y teléfono.',
        ),
        sourcePath: '$_kPasta/text_field_teclados.dart',
        builder: (_) => const TextFieldTeclados(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Senha', en: 'Password', es: 'Contraseña'),
        description: const Tr(
          pt: 'obscureText e um botão para mostrar ou esconder.',
          en: 'obscureText and a button to show or hide it.',
          es: 'obscureText y un botón para mostrarla u ocultarla.',
        ),
        sourcePath: '$_kPasta/text_field_senha.dart',
        builder: (_) => const TextFieldSenha(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Ler o que foi digitado',
          en: 'Reading the input',
          es: 'Leer lo que se escribió',
        ),
        description: const Tr(
          pt: 'TextEditingController e onChanged, com botão de limpar.',
          en: 'TextEditingController and onChanged, with a clear button.',
          es: 'TextEditingController y onChanged, con un botón para borrar.',
        ),
        sourcePath: '$_kPasta/text_field_controller.dart',
        builder: (_) => const TextFieldController(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Várias linhas e limite',
          en: 'Multiple lines and a limit',
          es: 'Varias líneas y límite',
        ),
        description: const Tr(
          pt: 'minLines, maxLines e maxLength com contador.',
          en: 'minLines, maxLines and maxLength with a counter.',
          es: 'minLines, maxLines y maxLength con contador.',
        ),
        sourcePath: '$_kPasta/text_field_linhas.dart',
        builder: (_) => const TextFieldLinhas(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'TextFormField',
    description: const Tr(
      pt: 'Um TextField com validação, feito para usar dentro de um Form.',
      en: 'A TextField with validation, made to be used inside a Form.',
      es: 'Un TextField con validación, pensado para usarse dentro de un Form.',
    ),
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
        title: const Tr(pt: 'Validação', en: 'Validation', es: 'Validación'),
        description: const Tr(
          pt: 'validator mostra o erro enquanto a pessoa digita.',
          en: 'validator shows the error as the person types.',
          es: 'validator muestra el error mientras la persona escribe.',
        ),
        sourcePath: '$_kPasta/text_form_field_validacao.dart',
        builder: (_) => const TextFormFieldValidacao(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Só números', en: 'Numbers only', es: 'Solo números'),
        description: const Tr(
          pt: 'inputFormatters bloqueiam letras e limitam o tamanho.',
          en: 'inputFormatters block letters and limit the length.',
          es: 'inputFormatters bloquean letras y limitan el tamaño.',
        ),
        sourcePath: '$_kPasta/text_form_field_formatadores.dart',
        builder: (_) => const TextFormFieldFormatadores(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Form',
    description: const Tr(
      pt: 'Agrupa campos para validar, salvar e limpar todos de uma vez.',
      en: 'Groups fields to validate, save and reset them all at once.',
      es: 'Agrupa campos para validar, guardar y limpiar todos a la vez.',
    ),
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
        title: const Tr(
          pt: 'Validar ao enviar',
          en: 'Validate on submit',
          es: 'Validar al enviar',
        ),
        description: const Tr(
          pt: 'validate() confere todos os campos de uma vez.',
          en: 'validate() checks every field at once.',
          es: 'validate() revisa todos los campos a la vez.',
        ),
        sourcePath: '$_kPasta/form_validar.dart',
        builder: (_) => const FormValidar(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Salvar e restaurar',
          en: 'Save and reset',
          es: 'Guardar y restaurar',
        ),
        description: const Tr(
          pt: 'save() chama os onSaved; reset() volta ao valor inicial.',
          en: 'save() calls each onSaved; reset() goes back to the initial values.',
          es: 'save() llama a los onSaved; reset() vuelve al valor inicial.',
        ),
        sourcePath: '$_kPasta/form_salvar.dart',
        builder: (_) => const FormSalvar(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'SearchBar',
    description: const Tr(
      pt: 'A barra de busca do Material 3.',
      en: 'The Material 3 search bar.',
      es: 'La barra de búsqueda de Material 3.',
    ),
    preview: const SizedBox(
      width: 240,
      child: SearchBar(hintText: 'Buscar', leading: Icon(Icons.search)),
    ),
    examples: [
      WidgetExample(
        title: const Tr(
          pt: 'Filtrando uma lista',
          en: 'Filtering a list',
          es: 'Filtrando una lista',
        ),
        description: const Tr(
          pt: 'onChanged filtra as frutas a cada letra digitada.',
          en: 'onChanged filters the fruits with every letter typed.',
          es: 'onChanged filtra las frutas con cada letra escrita.',
        ),
        sourcePath: '$_kPasta/search_bar_filtro.dart',
        builder: (_) => const SearchBarFiltro(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com sugestões', en: 'With suggestions', es: 'Con sugerencias'),
        description: const Tr(
          pt: 'SearchAnchor.bar abre uma tela de busca com sugestões.',
          en: 'SearchAnchor.bar opens a search view with suggestions.',
          es: 'SearchAnchor.bar abre una pantalla de búsqueda con sugerencias.',
        ),
        sourcePath: '$_kPasta/search_bar_sugestoes.dart',
        builder: (_) => const SearchBarSugestoes(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'DropdownMenu',
    description: const Tr(
      pt: 'Um campo que abre uma lista de opções para escolher.',
      en: 'A field that opens a list of options to choose from.',
      es: 'Un campo que abre una lista de opciones para elegir.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Opções com valor e rótulo, e onSelected.',
          en: 'Options with a value and a label, plus onSelected.',
          es: 'Opciones con valor y etiqueta, y onSelected.',
        ),
        sourcePath: '$_kPasta/dropdown_menu_basico.dart',
        builder: (_) => const DropdownMenuBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com filtro', en: 'With a filter', es: 'Con filtro'),
        description: const Tr(
          pt: 'enableFilter: digite para encontrar a opção.',
          en: 'enableFilter: type to find the option.',
          es: 'enableFilter: escribe para encontrar la opción.',
        ),
        sourcePath: '$_kPasta/dropdown_menu_filtro.dart',
        builder: (_) => const DropdownMenuFiltro(),
      ),
      WidgetExample(
        title: const Tr(
          pt: 'Valor inicial e ícones',
          en: 'Initial value and icons',
          es: 'Valor inicial e íconos',
        ),
        description: const Tr(
          pt: 'initialSelection, leadingIcon e um enum como valor.',
          en: 'initialSelection, leadingIcon and an enum as the value.',
          es: 'initialSelection, leadingIcon y un enum como valor.',
        ),
        sourcePath: '$_kPasta/dropdown_menu_icones.dart',
        builder: (_) => const DropdownMenuIcones(),
      ),
    ],
  ),
  WidgetDoc(
    name: 'Autocomplete',
    description: const Tr(
      pt: 'Um campo que sugere opções enquanto a pessoa digita.',
      en: 'A field that suggests options as the person types.',
      es: 'Un campo que sugiere opciones mientras la persona escribe.',
    ),
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
        title: _basico,
        description: const Tr(
          pt: 'Digite o começo de uma capital, como "Be".',
          en: 'Type the start of a Brazilian state capital, like "Be".',
          es: 'Escribe el comienzo de una capital brasileña, como "Be".',
        ),
        sourcePath: '$_kPasta/autocomplete_basico.dart',
        builder: (_) => const AutocompleteBasico(),
      ),
      WidgetExample(
        title: const Tr(pt: 'Com objetos', en: 'With objects', es: 'Con objetos'),
        description: const Tr(
          pt: 'Opções que são objetos, com campo personalizado.',
          en: 'Options that are objects, with a custom field.',
          es: 'Opciones que son objetos, con un campo personalizado.',
        ),
        sourcePath: '$_kPasta/autocomplete_objetos.dart',
        builder: (_) => const AutocompleteObjetos(),
      ),
    ],
  ),
];
