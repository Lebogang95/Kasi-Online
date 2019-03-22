import 'dart:ui';

import 'package:flutter/material.dart';

class AppText extends StatefulWidget {

  final String label;
  final double size;

  AppText({Key key, @required this.label, this.size}) : super(key:key);

  @override
  State createState() => _AppText(buttonLabel: label, size: size);

}

class _AppText extends State<AppText> {

  _AppText( {Key key,this.buttonLabel, this.size});

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