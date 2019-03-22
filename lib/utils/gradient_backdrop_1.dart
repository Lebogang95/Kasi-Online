import 'dart:ui';

import 'package:flutter/material.dart';

class GradientBackdrop_1 extends StatefulWidget {

  final String imagePath;
  final Color hexColor_1;
  final Color hexColor_2;
  final Color hexColor_3;
  final Color hexColor_4;

  GradientBackdrop_1({
    Key key,
    @required this.hexColor_1,
    @required this.hexColor_2,
    @required this.hexColor_3,
    @required this.hexColor_4,
    @required this.imagePath
  }) : super(key:key);

  @override
  State createState() => _GradientBackdrop_1(
      hexColor_1: hexColor_1,
      hexColor_2: hexColor_2,
      hexColor_3: hexColor_3,
      hexColor_4: hexColor_4,
      imagePath: imagePath
  );

}

class _GradientBackdrop_1 extends State<GradientBackdrop_1> {

  _GradientBackdrop_1({Key key,
    this.hexColor_1,
    this.hexColor_2,
    this.hexColor_3,
    this.hexColor_4,
    this.imagePath
  });

  final String imagePath;
  final Color hexColor_1;
  final Color hexColor_2;
  final Color hexColor_3;
  final Color hexColor_4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        new ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          //child: new FlutterLogo(),
          //child: Image.asset('images/background.jpg'),
          child: DecoratedBox(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(imagePath),
                  fit: BoxFit.cover

              ),
            ),
          ),
        ),

        new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                hexColor_1,
                hexColor_2,
                hexColor_3,
                hexColor_4,

              ],
            ),
          ),
        )

      ],
    );
  }

}