import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kasi_online/data/friebase_api.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:flutter_eventemitter/flutter_eventemitter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UniversalTextFormField extends StatefulWidget {

  final String preferenceName;
  final String useCase;
  final String hint;
  final String formKey;
  final String label;
  final IconData icon;


  UniversalTextFormField({
    Key key,
    @required this.preferenceName,
    @required this.useCase,
    @required this.hint,
    @required this.formKey,
    @required this.label,
    @required this.icon
  }) : super(key:key);


  @override
  State createState() => _UniversalTextFormField(
    preferenceName: preferenceName,
    useCase: useCase,
    hint:hint,
    formKey: formKey,
    label: label,
    icon: icon,
  );

}

class _UniversalTextFormField extends State<UniversalTextFormField> {


  _UniversalTextFormField({
    Key key,
    this.preferenceName,
    this.useCase,
    this.hint,
    this.formKey,
    this.label,
    this.icon
  });


  final String preferenceName;
  final String useCase;
  final String hint;
  final String formKey;
  final String label;
  final IconData icon;

  FirebaseApiClass firebaseApiClass = new ApiClass();

  TextEditingController textEditingController = new TextEditingController();
  Timer timer;


  void _useCase (String prefName, String useCase){

    switch(useCase) {

      case "login" : {

        timer.cancel();

        _setPrefs(String preferenceName) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(preferenceName, textEditingController.text);
          print(prefs.getString(preferenceName));
        }

        EventEmitter.subscribe(useCase, (data) {
          _setPrefs(prefName);
          firebaseApiClass.performLogin();
        });

      }
      break;

      case "register": {

        timer.cancel();

        _setPrefs(String preferenceName) async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(preferenceName, textEditingController.text);
          print(prefs.getString(preferenceName));
        }

        EventEmitter.subscribe(useCase, (data) {
          _setPrefs(prefName);
          //firebaseApiClass.createUser();
        });

      }
      break;

    }
  }


  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _useCase(preferenceName,useCase));
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: new Key(formKey),
      controller: textEditingController,
      autofocus: false,
      style: new TextStyle(fontFamily: 'DroidSansChinese', color:Colors.white),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
          child: Icon(
            icon,
            color: primaryColor,
            size: 16.0,
          ), // icon is 48px widget.
        ),
        fillColor: Colors.white,
        hintText: label,
        hintStyle: TextStyle(color: Colors.white, fontFamily: 'DroidSansChinese'),
        contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: accentColor,),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color:accentColor,),
        ),
      ),
      validator: (val) => val.isEmpty ? 'Values can\'t be empty.' : null,
    );
  }

}