import 'dart:ui';

import 'package:flutter/material.dart';

class AppText extends StatefulWidget {

  final String label;
  final double size;
  final Color fontColor;

  AppText({Key key, @required this.label, this.size, this.fontColor}) : super(key:key);

  @override
  State createState() => _AppText(buttonLabel: label, size: size, fontColor: fontColor);

}

class _AppText extends State<AppText> {

  _AppText( {Key key,this.buttonLabel, this.size, this.fontColor});

  final String buttonLabel;
  final double size;
  final fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonLabel,
      style: new TextStyle(
          fontFamily: 'DroidSansChinese',
          color: fontColor,
          fontSize: size,
      ),
    );
  }

}