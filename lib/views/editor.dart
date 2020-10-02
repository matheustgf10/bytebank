import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final Icon icone;

  Editor({this.rotulo, this.dica, this.icone, this.controlador});

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          icon: icone,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
      padding: EdgeInsets.all(16.0),
    );
  }
}
