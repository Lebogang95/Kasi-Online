import 'dart:ui';

import 'package:flutter/material.dart';

class SpecialsCard extends StatefulWidget {

  final String restaurantName;
  final String location;
  final String imageLink;

  SpecialsCard({Key key, @required this.restaurantName, @required this.location, @required this.imageLink}) : super(key:key);

  @override
  State createState() => _SpecialsCard(restaurantName: restaurantName, location: location, imageLink:imageLink);

}

class _SpecialsCard extends State<SpecialsCard> {

  _SpecialsCard( {Key key,this.restaurantName, this.location, this.imageLink});

  final String restaurantName;
  final String location;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          new ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: new Image.network(
                imageLink,
                fit: BoxFit.cover,
              )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              SizedBox(
                height: 25.0,
                child: new Center(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: new Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: new Padding(padding: EdgeInsets.only(
                              left: 8.0
                          ),
                              child: new Row(
                                children: <Widget>[

                                  Text('R20.00', style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.white, fontSize: 16),),

                                ],
                              )
                          )
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 50.0,
                child: new Center(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: new Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: new Padding(padding: EdgeInsets.only(
                              left: 8.0
                          ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.fastfood,
                                            color: Colors.white,
                                            size: 12.0,
                                          ),
                                          SizedBox(width: 10.0,),// icon is 48px widget.
                                          Text(restaurantName, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.white, fontSize: 14),),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 4.0,
                                      ),

                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                            size: 12.0,
                                          ),
                                          SizedBox(width: 10.0,),// icon is 48px widget.
                                          Text(location, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.white, fontSize: 14),),
                                        ],
                                      ),

                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(right: 16.0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  )

                                ],
                              )
                          )
                      ),
                    ),
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }

}