import 'package:flutter/material.dart';

class WidgetsAdaptativos extends StatefulWidget {
  const WidgetsAdaptativos({super.key});

  @override
  State<WidgetsAdaptativos> createState() => _WidgetsAdaptativosState();
}

class _WidgetsAdaptativosState extends State<WidgetsAdaptativos> {
  TargetPlatform _plataforma = TargetPlatform.android;
  bool _ligado = true;
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        SegmentedButton<TargetPlatform>(
          segments: const [
            ButtonSegment(value: TargetPlatform.android, label: Text('Android')),
            ButtonSegment(value: TargetPlatform.iOS, label: Text('iOS')),
          ],
          selected: {_plataforma},
          onSelectionChanged: (selecao) {
            setState(() => _plataforma = selecao.first);
          },
        ),
        // Num app de verdade a plataforma vem do celular. Aqui, o Theme
        // finge ser a plataforma escolhida acima, só para comparar.
        Theme(
          data: Theme.of(context).copyWith(platform: _plataforma),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 12,
            children: [
              // .adaptive: no iPhone vira o widget Cupertino; no Android,
              // fica o do Material. Um código só para as duas plataformas.
              Switch.adaptive(
                value: _ligado,
                onChanged: (valor) => setState(() => _ligado = valor),
              ),
              Slider.adaptive(
                value: _volume,
                onChanged: (valor) => setState(() => _volume = valor),
              ),
              const CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      ],
    );
  }
}
