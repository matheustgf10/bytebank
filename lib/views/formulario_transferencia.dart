import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'editor.dart';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              rotulo: 'Número da conta',
              dica: '0000',
              controlador: widget._controladorCampoNumeroConta,
            ),
            Editor(
              rotulo: 'Valor',
              dica: '0.00',
              controlador: widget._controladorCampoValor,
              icone: Icon(Icons.monetization_on),
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}
