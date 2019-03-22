import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/register_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_1.dart';
import 'package:kasi_online/utils/slide_transition.dart';
import 'package:kasi_online/utils/universal_button.dart';

class UniversalAlertDialog extends AlertDialog {

  final String label;
  final String useCase;

  TextEditingController textEditingController;

  UniversalAlertDialog({
    Key key,
    @required this.label,
    @required this.useCase,
  }) : super(key:key);

  //State createState() => _UniversalAlertDialog(label: label, useCase: useCase);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: new Container(
        color: Colors.white,
        width: 260.0,
        height: 230.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      'Please enter your email to recover your password',
                      style: TextStyle(
                          fontFamily: 'DroidSansChinese',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            TextFormField(
              key: new Key('email'),
              controller: textEditingController,
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black54),
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black54, fontFamily: 'DroidSansChinese'),
                contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.black,),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color:Colors.black,),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.black54,
                    size: 16.0,
                  ), // icon is 48px widget.
                ),
              ),
              validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
            ),

            SizedBox(
              height: 16.0,
            ),

            UniversalButton(label:label , useCase: useCase, message: null,),

          ],
        ),
      ),
    );
  }

}

/*class _UniversalAlertDialog extends State<UniversalAlertDialog> {

  _UniversalAlertDialog({
    Key key,
    this.label,
    this.useCase
  });

  final String label;
  final String useCase;

  TextEditingController textEditingController;

  void _useCase (String useCase){

    switch(useCase) {

      case "moveToRegister" : {
        Navigator.push(
          context,
          SlideRightRoute(widget: RegisterPage()),
        );
      }
      break;

      case "moveToLogin": {
        Navigator.push(
          context,
          SlideRightRoute(widget: LoginPage()),
        );
      }
      break;

    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: new Container(
        color: Colors.white,
        width: 260.0,
        height: 230.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      'Please enter your email to recover your password',
                      style: TextStyle(
                          fontFamily: 'DroidSansChinese',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w100,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            TextFormField(
              key: new Key('email'),
              controller: textEditingController,
              keyboardType: TextInputType.emailAddress,
              style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black54),
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black54, fontFamily: 'DroidSansChinese'),
                contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.black,),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color:Colors.black,),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.black54,
                    size: 16.0,
                  ), // icon is 48px widget.
                ),
              ),
              validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
            ),

            SizedBox(
              height: 16.0,
            ),

            // dialog bottom
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  SlideRightRoute(widget: RegisterPage()),
                );
              },
              child: Container(
                height: 50.0,
                child: new Card(
                    elevation: 0.0,
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: new Center(
                      child: Stack(
                        children: <Widget>[

                          GradientBackdrop_1(hexColor_1: primaryColor, hexColor_2:  primaryColor, hexColor_3: primaryColor, hexColor_4: primaryColor, imagePath: 'images/backdrop_red.jpg',),

                          Center(
                            child: new Text("Send",
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontFamily: 'DroidSansChinese', color:  Colors.black, fontSize: 16),
                            ),
                          ),

                        ],
                      ),
                    )
                ),

              ),
            )

          ],
        ),
      ),
    );
    }
  }*/