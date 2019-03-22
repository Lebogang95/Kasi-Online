import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/data/base_class.dart';
import 'package:kasi_online/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RestaurantsFragment extends StatefulWidget {

  RestaurantsFragment() : super();

  @override
  _RestaurantsFragmentState createState() => new _RestaurantsFragmentState();

}

class _RestaurantsFragmentState extends State<RestaurantsFragment> {

  _RestaurantsFragmentState();

  BaseClass baseClass = new ApiBaseClass();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: fragmentBackgroundColor,
      body: new Stack(
        children: <Widget>[
          new Center(
            child: ListView(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    DropdownButton<String>(
                      value: "Open",
                      onChanged: (String newValue) {
                        setState(() {
                          //dropdownValue = newValue;
                        });
                      },
                      items: <String>['Open', 'Soweto', 'Alexendre', 'Daveyton']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black, fontSize: 16)),
                        );
                      })
                          .toList(),
                    ),

                    SizedBox(width: 20.0,),

                    DropdownButton<String>(
                      value: "Near Me",
                      onChanged: (String newValue) {
                        setState(() {
                          //dropdownValue = newValue;
                        });
                      },
                      items: <String>['Near Me', 'Soweto', 'Alexendre', 'Daveyton']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black, fontSize: 16)),
                        );
                      })
                          .toList(),
                    ),

                    SizedBox(width: 20.0,),

                    DropdownButton<String>(
                      value: "Johannesburg",
                      onChanged: (String newValue) {
                        setState(() {
                          //dropdownValue = newValue;
                        });
                      },
                      items: <String>['Johannesburg', 'Soweto', 'Alexendre', 'Daveyton']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black, fontSize: 16)),
                        );
                      })
                          .toList(),
                    ),

                  ],

                ),
                _buildBody(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('shops').snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        if (!snapshot.hasData) return Column(
          children: <Widget>[
            Text('You have no data for this month', style: new TextStyle(color: Colors.black, fontSize: 32,fontWeight: FontWeight.w900),),
          ],
        );
        if (snapshot.hasError) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListBody(
      //padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.map((data) => _buildListItem(context, data)).toList()
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child:  Card(
            elevation: 0.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 500.0,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(
                        record.imageLink,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Center(
                  child: new ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: new Padding(padding: EdgeInsets.only(
                              left: 8.0
                          ),
                              child: new Row(
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
                                          Text(record.name, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.white, fontSize: 24),),
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
                                          Text(record.suburb, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.white, fontSize: 14),),
                                        ],
                                      ),

                                      Container(
                                        color: Colors.white,
                                        height: 0.5,
                                      ),

                                      SizedBox(height: 8.0,),

                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 12.0,
                                          ),
                                          SizedBox(width: 2.0,),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 12.0,
                                          ),
                                          SizedBox(width: 2.0,),//
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 12.0,
                                          ),
                                          SizedBox(width: 2.0,),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 12.0,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 12.0,
                                          ),//// icon is 48px widget.
                                        ],
                                      ),

                                    ],

                                  ),

                                ],
                              )
                          )
                      ),
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}

class Record {
  final String name;
  final String suburb;
  final String imageLink;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['suburb'] != null),
        assert(map['imageLink'] != null),
        name = map['name'],
        suburb = map['suburb'],
        imageLink = map['imageLink'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name$suburb$imageLink>";
}