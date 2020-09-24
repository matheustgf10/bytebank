import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Padding(
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                labelText: 'Numero da Conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
            padding: EdgeInsets.all(16.0),
          ),
          Padding(
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                icon: Icon(
                  Icons.monetization_on,
                ),
                labelText: 'Valor',
                hintText: '0.0',
              ),
              keyboardType: TextInputType.number,
            ),
            padding: EdgeInsets.all(16.0),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final int numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final transferencia = Transferencia(valor, numeroConta);
                debugPrint('$transferencia');
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('$transferencia'),
                ));
              }
            },
          )
        ],
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1000)),
          ItemTransferencia(Transferencia(300.0, 2000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'valor: $valor - numero conta: $numeroConta';
  }
}
