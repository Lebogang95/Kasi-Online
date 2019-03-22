import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomIcon extends StatefulWidget {

  final IconData iconData;

  CustomIcon({Key key, @required this.iconData}) : super(key:key);

  @override
  State createState() => _CustomIcon(iconData: iconData);

}

class _CustomIcon extends State<CustomIcon> {

  _CustomIcon( {Key key,this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        iconData,
        size: 20.0,
      ),
    );
  }

}