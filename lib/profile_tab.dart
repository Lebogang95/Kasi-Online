import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/data/base_class.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:kasi_online/utils/gradient_backdrop_3.dart';


class ProfileTab extends StatefulWidget {

  ProfileTab() : super();

  @override
  _ProfileTabState createState() => new _ProfileTabState();

}

class _ProfileTabState extends State<ProfileTab> {

  _ProfileTabState();

  BaseClass baseClass = new ApiBaseClass();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[

                GradientBackdrop_3(hexColor_1: profileColorTransparent, hexColor_2: menuColorTransparent, imagePath: 'images/profile_background.png',),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Padding(padding: EdgeInsets.only(bottom: 16.0), child: Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        CircleAvatar(
                          backgroundImage: new NetworkImage(
                              'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&h=350'),
                          radius: 40.0,
                        ),
                      ]),
                    ),),

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Lebogang Nkosi',
                        style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 23.0, color: Colors.black
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 32.0),
                      child: Text(
                        'nkosilebogang95@gmail.com',
                        style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 16.0, color: Colors.black
                        ),
                      ),
                    )

                  ],
                ),
              ],
            ),
          ),

        ),
      ),

      body: new Stack(
        children: <Widget>[

          new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 0.0, right: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 8.0),

                      Padding(padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[

                              Icon(
                                Icons.account_circle,
                                size: 20.0,
                              ),

                              SizedBox(width: 16.0,),

                              Text(
                                'Account Settings',
                                style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 20.0, color: Colors.black
                                ),
                              ),
                            ],
                          )
                      ),

                      Padding(padding: EdgeInsets.only(top: 16.0, bottom: 16.0), child: Container(height: 0.3, color: Colors.black38,),),

                      Padding(padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[

                              Icon(
                                Icons.lock,
                                size: 20.0,
                              ),

                              SizedBox(width: 16.0,),

                              Text(
                                'Password & Security',
                                style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 20.0, color: Colors.black
                                ),
                              ),
                            ],
                          )
                      ),

                      Padding(padding: EdgeInsets.only(top: 16.0, bottom: 16.0), child: Container(height: 0.3, color: Colors.black38,),),

                      Padding(padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[

                              Icon(
                                Icons.remove_red_eye,
                                size: 20.0,
                              ),

                              SizedBox(width: 16.0,),

                              Text(
                                'Privacy',
                                style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 20.0, color: Colors.black
                                ),
                              ),
                            ],
                          )
                      ),

                      Padding(padding: EdgeInsets.only(top: 16.0, bottom: 16.0), child: Container(height: 0.3, color: Colors.black38,),),

                      Padding(padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[

                              Icon(
                                Icons.info,
                                size: 20.0,
                              ),

                              SizedBox(width: 16.0,),

                              Text(
                                'About App',
                                style: TextStyle(fontFamily: 'DroidSansChinese', fontSize: 20.0, color: Colors.black
                                ),
                              ),
                            ],
                          )
                      ),

                      SizedBox(height: 70.0),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}