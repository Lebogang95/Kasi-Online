import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/specials_fragment.dart';
import 'package:kasi_online/restaurants_fragment.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasi_online/utils/custom_icon.dart';
import 'package:kasi_online/utils/gradient_backdrop_1.dart';
import 'package:kasi_online/utils/gradient_backdrop_2.dart';
import 'package:kasi_online/utils/gradient_backdrop_3.dart';

class MenuTab extends StatefulWidget {

  MenuTab() : super();

  @override
  _MenuTabState createState() => new _MenuTabState();

}

class _MenuTabState extends State<MenuTab> {

  _MenuTabState();

  int _currentIndex = 0;
  final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: fragmentBackgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Lebogang Nkosi',
                          style: TextStyle(
                            fontFamily: 'DroidSansChinese',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4.0,),
                        Text(
                          'nkosilebogang95@gmail.com',
                          style: TextStyle(
                            fontFamily: 'DroidSansChinese',
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircleAvatar(
                      backgroundImage: new NetworkImage(
                          'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&h=350'),
                      radius: 16.0,
                    ),
                  ]),
                ),
                IconButton(
                  icon: new Icon(Icons.add_shopping_cart, color: Colors.black,),
                  onPressed: () {},
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[

                    GradientBackdrop_3(hexColor_1: menuColorTransparent, hexColor_2: menuColor, imagePath: 'images/profile_background.png',),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 30.0),
                          child: TextField(
                            autofocus: false,
                            style: new TextStyle(fontFamily: 'DroidSansChinese', color:Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
                                child: Icon(
                                  FontAwesomeIcons.search,
                                  color: Colors.black26,
                                  size: 16.0,
                                ),
                                // icon is 48px widget.
                              ),
                              filled: true,
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(8.0),
                                ),

                              ),
                              fillColor: Colors.white,
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.black, fontFamily: 'DroidSansChinese'),
                              contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 20.0, 16.0),
                            ),
                          ),
                        ),

                        TabBar(
                          indicatorColor: Colors.black,
                          tabs: [

                            Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                'Specials',
                                style: TextStyle(color: Colors.black, fontFamily: 'DroidSansChinese', fontSize: 18.0),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                'Restaurants',
                                style: TextStyle(color: Colors.black, fontFamily: 'DroidSansChinese', fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),



                  ],
                ),
              ),

            ),
          ),

          body: TabBarView(
            children: [
              SpecialsFragment(),
              RestaurantsFragment(),
            ],
          ),

        ),
      ),
    );
  }
}