import 'package:flutter/material.dart';

const colorlist = <Color>[
  Colors.yellow,
  Colors.blue,
  Colors.green,
  Colors.redAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.blueAccent,
  Colors.indigoAccent,
  Colors.deepPurple,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'El color seleccionado tiene que ser mayor o igual a 0'),
        assert(selectedColor < colorlist.length,
            'El color seleccionado tiene que ser menor o igual a ${colorlist.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorlist[selectedColor],

      );
}
