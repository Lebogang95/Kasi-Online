import 'package:flutter/material.dart';
import 'package:kasi_online/utils/universal_button.dart';

class PreRegisterAlertDialog extends AlertDialog {

  final String label;
  final String useCase;


  PreRegisterAlertDialog({
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
        height: 250.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 16.0,),

            UniversalButton(label:'Register with Email & Password' , useCase: 'moveToRegister', message: null,),

            SizedBox(height: 16.0,),

            Text(
              '- or -',
              style: TextStyle(
                  fontFamily: 'DroidSansChinese',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.black
              ),
            ),

            SizedBox(height: 16.0,),

            UniversalButton(label:'Sign In With Google' , useCase: 'register with google', message: null,),

            SizedBox(height: 16.0,),

            UniversalButton(label:'Register Using Phone Number' , useCase: 'register with phone', message: null,),

            SizedBox(height: 16.0,),

          ],
        ),
      ),
    );
  }

}