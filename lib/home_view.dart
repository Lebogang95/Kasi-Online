import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/menu_tab.dart';
import 'package:kasi_online/profile_tab.dart';
import 'package:kasi_online/register_view.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kasi_online/utils/custom_icon.dart';

class HomePage extends StatefulWidget {

  HomePage() : super();

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  _HomePageState();

  int _currentIndex = 0;
  final List<Widget> _children = [
    MenuTab(),
    LoginPage(),
    RegisterPage(),
    ProfileTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fragmentBackgroundColor,

      body: _children[_currentIndex],

      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: menuColor,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped, // new
          currentIndex: _currentIndex,
          items: [
            new BottomNavigationBarItem(
              icon: new CustomIcon(iconData: FontAwesomeIcons.clipboard,),
              title: new Text("Menu",
                style: new TextStyle(
                  fontFamily: 'DroidSansChinese',
                ),
              ),
            ),
            new BottomNavigationBarItem(
              icon: new CustomIcon(iconData: FontAwesomeIcons.heart,),
              title: new Text("Friends", style: new TextStyle(
                fontFamily: 'DroidSansChinese',
              ),),
            ),
            new BottomNavigationBarItem(
              icon: new CustomIcon(iconData: FontAwesomeIcons.history,),
              title: new Text("Purchases", style: new TextStyle(
                fontFamily: 'DroidSansChinese',
              ),),
            ),
            new BottomNavigationBarItem(
              icon: new CustomIcon(iconData: FontAwesomeIcons.user,),
              title: new Text("Profile", style: new TextStyle(
                fontFamily: 'DroidSansChinese',
              ),),
            )
          ],
        ),
      ),

    );
  }
}