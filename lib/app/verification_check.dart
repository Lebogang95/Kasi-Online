import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/app_text.dart';
import 'package:kasi_online/data/auth.dart';
import 'package:kasi_online/data/friebase_api.dart';
import 'package:kasi_online/home_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_2.dart';
import 'package:kasi_online/utils/gradient_video.dart';
import 'package:kasi_online/utils/slide_transition.dart';
import 'package:kasi_online/utils/universal_button.dart';
import 'package:kasi_online/utils/universal_edittext.dart';
import 'package:kasi_online/utils/verify_view.dart';

class VerificationCheckPage extends StatefulWidget {

  final String userId;
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  VerificationCheckPage({
    this.auth,
    this.onSignedOut,
    this.userId
  });

  @override
  _VerificationCheckPageState createState() => new _VerificationCheckPageState();

}

class _VerificationCheckPageState extends State<VerificationCheckPage> {

  FirebaseApiClass firebaseApiClass = new ApiClass();

  void isEmailVerified() async {
    try {
      bool isVerified = await firebaseApiClass.isEmailVerified();
      if (isVerified){
        Navigator.push(
          context,
          SlideRightRoute(widget: HomePage()),
        );
      }
      else {
        Navigator.push(
          context,
          SlideRightRoute(widget: VerifyPage()),
        );
      }
    }
    catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    isEmailVerified();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: new Stack(
        children: <Widget>[

          GradientVideo(hexColor_1: Colors.black12, hexColor_2: Colors.black.withOpacity(0.9), imagePath: 'images/login_background.jpg',),

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

                        SizedBox(height: 18.0),

                        Text(
                          'Please be patient whilst loading',
                          style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 16.0, fontWeight: FontWeight.w100, color: Colors.white
                          ),
                        ),

                        SizedBox(height: 128.0),

                        Padding(
                          padding: EdgeInsets.only(left: 64.0, right: 64.0),
                          child: CircularProgressIndicator(backgroundColor: const Color(0xFFFFCA28),)
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