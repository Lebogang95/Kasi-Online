import 'dart:ui';
import 'package:flutter_eventemitter/flutter_eventemitter.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/data/friebase_api.dart';
import 'package:kasi_online/home_view.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/register_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_1.dart';
import 'package:kasi_online/utils/slide_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UniversalButton extends StatefulWidget {


  final String label;
  final String useCase;
  final String message;


  UniversalButton({
    Key key,
    @required this.label,
    @required this.useCase,
    @required this.message,
  }) : super(key:key);


  @override
  State createState() => _UniversalButton(
    label: label,
    useCase: useCase,
    message: message,
  );


}

class _UniversalButton extends State<UniversalButton> {


  _UniversalButton({
    Key key,
    this.label,
    this.useCase,
    this.message,
  });


  final String label;
  final String useCase;
  final String message;

  FirebaseApiClass firebaseApiClass = new ApiClass();

  void emitUseCase() async {
    EventEmitter.publishSync(useCase, useCase);
  }

  void isEmailVerified() async {
    try {
      print("is working");
      bool isVerified = await firebaseApiClass.isEmailVerified();
      if (isVerified){
        Navigator.push(
          context,
          SlideRightRoute(widget: HomePage()),
        );
      }
      else {
        print('Email not verified');
      }
    }
    catch (e){
      print("it breaks");
      print(e);
    }
  }

  void clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void checkFields() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.get('name');
    String surname = prefs.get('surname');
    String phoneNumber = prefs.get('phoneNumber');
    String email = prefs.getString('email');
    String password = prefs.getString('password');
    String confirmPassword = prefs.get('register_confirmPassword');

    final RegExp nameRegExp = RegExp('a');

    if (name.length>=4) {
      if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(name) == false) {
        if (surname.length>=1){
          if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(surname) == false) {
            if (phoneNumber.length==10){
            if (RegExp(r'a-zA-Z[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]').hasMatch(phoneNumber) == false){

            }
            else {
              final snackBar = SnackBar(
                content: Text('Please enter a valid phone number'),
                duration: const Duration(seconds: 3),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            }
          }
          else {
            final snackBar = SnackBar(
              content: Text('Please enter a valid phone number'),
              duration: const Duration(seconds: 3),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
          }
          else {
            final snackBar = SnackBar(
              content: Text('Surname cannot have special characters'),
              duration: const Duration(seconds: 3),
            );
            Scaffold.of(context).showSnackBar(snackBar);
          }
        }
        else {
          final snackBar = SnackBar(
            content: Text('Surname cannot be smaller than 1 character'),
            duration: const Duration(seconds: 3),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        }
      }
      else {
        final snackBar = SnackBar(
          content: Text('Names cannot include special characters'),
          duration: const Duration(seconds: 3),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }

    }
    else {
      final snackBar = SnackBar(
        content: Text('Name cannot be smaller than 4 characters'),
        duration: const Duration(seconds: 3),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

  }


  void _useCase (String useCase){

    switch(useCase) {

      case "login" : {
        emitUseCase();
        firebaseApiClass.performLogin();
      }
      break;

      case "register" : {
        clearPrefs();
        emitUseCase();
        checkFields();
        //firebaseApiClass.createUser();
      }
      break;


      case "moveToRegister": {
        Navigator.push(
          context,
          SlideRightRoute(widget: RegisterPage()),
        );
      }
      break;

      case "verify": {
        isEmailVerified();
      }
      break;

      case "resend_verification": {
        firebaseApiClass.sendEmailVerification();
        final snackBar = SnackBar(
          content: Text('Verification Email Sent'),
          duration: const Duration(seconds: 5),
          /*action: SnackBarAction(
           label: 'Open Email App',
           onPressed: () {
             // Some code to undo the change!
           },
         ),*/
        );
        Scaffold.of(context).showSnackBar(snackBar);
      }
      break;

      case "logout": {
        firebaseApiClass.signOut();
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
    return GestureDetector(

      onTap: (){
        _useCase(useCase);
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
                    child: new Text(label,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontFamily: 'DroidSansChinese', color:  Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
        ),

      ),

    );
  }

}