import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/app_text.dart';
import 'package:kasi_online/data/base_class.dart';
import 'package:kasi_online/data/friebase_api.dart';
import 'package:kasi_online/utils/gradient_backdrop_2.dart';
import 'package:kasi_online/utils/universal_button.dart';


class VerifyPage extends StatefulWidget {

  VerifyPage() : super();

  @override
  _VerifyPageState createState() => new _VerifyPageState();

}

class _VerifyPageState extends State<VerifyPage> {

  _VerifyPageState();

  FirebaseApiClass firebaseApiClass = new ApiClass();

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
                          'VERIFICATION',
                          style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 30.0, fontWeight: FontWeight.w100, color: Colors.white
                          ),
                        ),

                        SizedBox(height: 12.0),

                        AppText(
                          label: 'To continue using Kasi Online please verify your email', size: 16.0, fontColor: Colors.white,
                        ),

                        SizedBox(height: 128.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: UniversalButton(label:'Verify', useCase: 'verify', message: null),
                        ),

                        SizedBox(height: 24.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: UniversalButton(label:'Resend Verification email', useCase: 'resend_verification', message: null),
                        ),

                        SizedBox(height: 25.0),

                        AppText(
                          label: 'or', size: 16.0, fontColor: Colors.white,
                        ),

                        SizedBox(height: 25.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: UniversalButton(label:'Logout Of This Email', useCase: 'logout', message: null),
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