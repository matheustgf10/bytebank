import 'package:flutter/material.dart';

void main() {
  runApp(Column(
    children: <Widget>[
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        textDirection: TextDirection.ltr,
      ),
      Text(
        'Curabitur laoreet mollis sagittis.',
        textDirection: TextDirection.ltr,
      ),
      Text(
        'Mauris dictum fringilla aliquam.',
        textDirection: TextDirection.ltr,
      ),
      Column(
        children: <Widget>[
          Text(
            'Nulla posuere dictum mi, eget vehicula ex ullamcorper sit amet.',
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    ],
  ));
}
