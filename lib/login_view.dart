import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/app_text.dart';
import 'package:kasi_online/data/base_class.dart';
import 'package:kasi_online/register_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_2.dart';
import 'package:kasi_online/utils/slide_transition.dart';
import 'package:kasi_online/utils/universal_button.dart';
import 'package:kasi_online/utils/universal_edittext.dart';


class LoginPage extends StatefulWidget {

  LoginPage() : super();

  @override
  _LoginPageState createState() => new _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  _LoginPageState();

  BaseClass baseClass = new ApiBaseClass();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: new Stack(
        children: <Widget>[

          GradientBackdrop_2(hexColor_1: Colors.black12, hexColor_2: Colors.black, imagePath: 'images/login_background.jpg',),

          new Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      children: <Widget>[

                        Container(
                            width: 130.0,
                            height: 130.0,
                            decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage('images/logo.png'),
                                )
                            )
                        ),

                        SizedBox(height: 8.0),

                        Text(
                          'K A S I   O N L I N E',
                          style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 30.0, fontWeight: FontWeight.w100, color: Colors.white
                          ),
                        ),

                        SizedBox(height: 128.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'email', useCase: 'login', hint: 'Email', formKey: 'email', label: 'Email', icon: Icons.email),
                        ),

                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'password', useCase:'login', hint: 'Password', formKey: 'password', label: 'Password', icon: Icons.lock),
                        ),

                        SizedBox(height: 50.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: UniversalButton(label:'login', useCase: 'login', message: null),
                        ),

                        SizedBox(height: 70.0),

                        FlatButton(
                            child: AppText(
                              label: 'I forgot my password', size: 16.0, fontColor: Colors.white,
                            ),
                            onPressed: (){ baseClass.sendPasswordResetEmail(context); }
                        ),

                        SizedBox(height: 16.0),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                            context,
                            SlideRightRoute(widget: RegisterPage()),
                          ); },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AppText(label: 'Dont have an account ? ', size: 16.0, fontColor: Colors.white,),
                              AppText(label: 'Sign Up', size: 16.0, fontColor: primaryColor,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}