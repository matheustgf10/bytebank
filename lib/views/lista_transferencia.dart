import 'package:flutter/material.dart';
import '../models/transferencia.dart';
import 'formulario_transferencia.dart';
import 'item_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final Transferencia transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._transferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaCriada) {
            debugPrint('$transferenciaCriada');
            if (transferenciaCriada != null) {
              setState(() => widget._transferencias.add(transferenciaCriada));
            }
          });
        },
      ),
    );
  }
}
