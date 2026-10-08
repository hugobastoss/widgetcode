---
name: flutter-widgets-hub
description: Use this skill when the user asks to use, port, copy, or reference a widget from the "flutterwidgetshub" (or "flutter widgets hub") repository/catalog into the current Flutter project — phrases like "use the confirmation dialog from flutterwidgetshub", "pull in the FAB widget from the hub", "port widget X from github.com/hugobastoss/flutterwidgetshub".
---

# Flutter Widgets Hub — consumer skill

This project has installed this skill to port widgets from
`github.com/hugobastoss/flutterwidgetshub` into itself. That repository is
NOT part of this project — treat every fetch below as reading an external
reference, not local project code.

## Steps

1. Fetch `https://raw.githubusercontent.com/hugobastoss/flutterwidgetshub/main/manifest/widgets.json`.
2. Find the entry whose `name`/`description`/`exportedSymbols` best matches
   what the user asked for. If more than one plausibly matches, ask the
   user to disambiguate rather than guessing.
3. Fetch the raw source at
   `https://raw.githubusercontent.com/hugobastoss/flutterwidgetshub/main/<filePath>`
   (the `filePath` field from the manifest entry).
4. Copy that widget into this project (e.g. `lib/widgets/<file-name>`),
   preserving its doc-comment header.
5. **Do not** also copy any token/theme system from the hub repo — every
   widget there is self-contained by design (`selfContained: true` in the
   manifest) and uses only `Theme.of(context)` plus its own parameters.
   Adapt call sites to pass this project's own colors/spacing as explicit
   parameters if the widget exposes them; never invent a dependency on a
   `flutter_widgets_hub` token class, because none of the widgets require
   one.
6. If the manifest entry lists more than one `exportedSymbols` (e.g. a FAB
   file exporting both a primary and an extended variant), bring over only
   the symbol(s) the user actually asked for, unless they want the whole
   file.
