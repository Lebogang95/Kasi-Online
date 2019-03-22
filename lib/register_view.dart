import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/app_text.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_2.dart';
import 'package:kasi_online/utils/slide_transition.dart';
import 'package:kasi_online/utils/universal_button.dart';
import 'package:kasi_online/utils/universal_edittext.dart';

class RegisterPage extends StatefulWidget {

  RegisterPage({Key key}) : super(key:key);

  @override
  _RegisterPageState createState() => new _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: new Stack(
        children: <Widget>[

          /// Custom gradient backdrop which I constructed. It can be customised easily using one line of code and it can be used across the entire app if you want the effect
          GradientBackdrop_2(hexColor_1: Colors.black12, hexColor_2: Colors.black, imagePath: 'images/register_background.jpg',),

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
                          'REGISTER',
                          style: TextStyle(
                              fontFamily: 'DroidSansChinese',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.white
                          ),
                        ),

                        SizedBox(height: 32.0),

                        AppText(
                          label: 'By Registering you agree to the terms of the app', size: 16.0, fontColor: Colors.white,
                        ),

                        SizedBox(height: 32.0),

                        SizedBox(height: 64.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'name', useCase: 'register', hint: 'Name', formKey: 'name', label: 'Name', icon: Icons.person),
                        ),
                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'surname', useCase: 'register', hint: 'Surname', formKey: 'surname', label: 'Surname', icon: Icons.person),
                        ),
                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'email', useCase: 'register', hint: 'Email', formKey: 'email', label: 'Email', icon: Icons.email),
                        ),
                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'phoneNumber', useCase: 'register', hint: 'Phone Number', formKey: 'phoneNumber', label: 'Phone Number', icon: Icons.call),
                        ),
                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'password', useCase: 'register', hint: 'Password', formKey: 'password', label: 'Password', icon: Icons.lock),
                        ),
                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: UniversalTextFormField(preferenceName:'confirmPassword', useCase: 'register', hint: 'Confirm Password', formKey: 'confirmPassword', label: 'Confirm Password', icon: Icons.lock),
                        ),
                        SizedBox(height: 50.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: UniversalButton(label:'register', useCase: 'register', message: null,),
                        ),

                        SizedBox(height: 70.0),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              SlideRightRoute(widget: LoginPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AppText(label: 'Have an account ? ', size: 16.0, fontColor: Colors.white,),
                              AppText(label: 'Login', size: 16.0, fontColor: primaryColor,),
                            ],
                          ),
                        ),
                        SizedBox(height: 70.0),
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