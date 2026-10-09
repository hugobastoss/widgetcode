---
name: widgetcode
description: Use this skill when the user asks to bring, use, copy or port an example from the "WidgetCode" app (formerly "Flutter Widgets Hub") or the "widgetcode" repository (github.com/hugobastoss/widgetcode) into the current Flutter project (e.g. "traga o exemplo buttons/elevated_button_carregando do WidgetCode", "use the ElevatedButton loading example from WidgetCode", "trae el ejemplo de SegmentedButton con selección múltiple de WidgetCode"), or pastes one or more example ids shaped like <section>/<file> (e.g. lists/refresh_indicator_basico).
---

# WidgetCode: consumer skill

`github.com/hugobastoss/widgetcode` is a showcase app of Flutter's
native widgets: 12 sections, 79 widgets, 210 examples. Every example is one
self-contained Dart file that runs live in the app, and the person picks
one there (the app's code panel has a "copy request for the AI" button that
includes the example id; the app's Favorites screen copies one request with
the ids of every favorite, comma-separated and in quotes). That repository
is NOT part of this project:
treat every fetch below as reading an external reference.

## Steps

1. Fetch
   `https://raw.githubusercontent.com/hugobastoss/widgetcode/main/manifest/widgets.json`.
   Shape: `sections[] → widgets[] → examples[]`. Each example has `id`,
   `title` and `description` (each in `pt`/`en`/`es`), `filePath`,
   `className` and, when needed, `requires`. Widgets have `name` (the
   Flutter class, e.g. `SegmentedButton`) and a translated `description`.
2. Find the example:
   - If the user gave an id (`buttons/elevated_button_carregando`), match
     `examples[].id` exactly. If they gave several (e.g.
     `"buttons/fab_grande", "lists/page_view_botoes"`), fetch the manifest
     once and do steps 2–6 for each of them, one file per example.
   - Otherwise match by widget `name` plus example `title`/`description`,
     in whichever of the three languages the user wrote.
   - If more than one plausibly matches, or the user named only a widget,
     list the candidates (id + title in the user's language) and ask.
     Don't guess.
3. Fetch the source at `<rawBaseUrl><filePath>` (both from the manifest).
4. Put it in this project: by default `lib/widgets/<file name>`, or wherever
   this project keeps widgets or the user asked. The file only imports
   `package:flutter/material.dart` / `cupertino.dart` / `services.dart`; it
   never depends on other files of the repository.
5. Adapt it, because it was written as a demo:
   - The public class (`className`, e.g. `ElevatedButtonCarregando`) is
     named after the example, in Portuguese. Rename it to what it does in
     this project, or, if the user asked for it inside a specific screen,
     move the relevant widget code into that screen instead of keeping the
     demo wrapper.
   - On-screen texts and code comments are in Portuguese: translate texts
     to this project's language; follow this project's convention for
     comments.
   - Demo values (sample data, fixed colors like `Colors.indigo`, fake
     delays standing in for real work) should be replaced with this
     project's theme, data and logic where the user expects real behavior.
6. Handle every entry in `requires`:
   - `type: asset`: the example loads a bundled image at `path`. Download
     `<rawBaseUrl><filePath>` to the same `path` in this project and
     declare its folder under `flutter: assets:` in `pubspec.yaml`, or point
     the code at an image this project already has.
   - `type: androidPermission`: make sure
     `<uses-permission android:name="<name>"/>` is in
     `android/app/src/main/AndroidManifest.xml` (release builds need it).
7. Tell the user where each file went and show the one line that uses it
   (the import plus e.g. `const SaveButton()` in their widget tree), then
   run `flutter analyze`.
