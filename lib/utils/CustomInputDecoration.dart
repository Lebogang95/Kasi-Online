import 'dart:ui';

import 'package:flutter/material.dart';

class CustomInputDecoration extends StatefulWidget {

  final String label;
  final double size;

  CustomInputDecoration({Key key, @required this.label, this.size}) : super(key:key);

  @override
  State createState() => _CustomInputDecoration(buttonLabel: label, size: size);

}

class _CustomInputDecoration extends State<CustomInputDecoration> {

  _CustomInputDecoration( {Key key,this.buttonLabel, this.size});

  final String buttonLabel;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonLabel,
      style: new TextStyle(
        fontFamily: 'DroidSansChinese',
        color: Colors.white,
        fontSize: size,
      ),
    );
  }

}