import 'package:flutter/material.dart';

enum Pagamento { pix, cartao, boleto }

class DropdownMenuIcones extends StatelessWidget {
  const DropdownMenuIcones({super.key});

  @override
  Widget build(BuildContext context) {
    // Usar um enum como valor evita erros de digitação com textos soltos.
    return const DropdownMenu<Pagamento>(
      label: Text('Pagamento'),
      // initialSelection: a opção que já vem escolhida.
      initialSelection: Pagamento.pix,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: Pagamento.pix,
          label: 'Pix',
          leadingIcon: Icon(Icons.qr_code),
        ),
        DropdownMenuEntry(
          value: Pagamento.cartao,
          label: 'Cartão',
          leadingIcon: Icon(Icons.credit_card),
        ),
        DropdownMenuEntry(
          value: Pagamento.boleto,
          label: 'Boleto',
          leadingIcon: Icon(Icons.receipt_long),
        ),
      ],
    );
  }
}
