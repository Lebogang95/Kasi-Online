import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/specials_card.dart';
import 'package:kasi_online/data/base_class.dart';
import 'package:kasi_online/utils/const.dart';


class SpecialsFragment extends StatefulWidget {

  SpecialsFragment() : super();

  @override
  _SpecialsFragmentState createState() => new _SpecialsFragmentState();

}

class _SpecialsFragmentState extends State<SpecialsFragment> {

  _SpecialsFragmentState();

  BaseClass baseClass = new ApiBaseClass();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: fragmentBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 16.0),
              child: Column(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

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
                        }).toList(),
                      ),

                      SizedBox(width: 20.0,),

                      DropdownButton<String>(
                        value: "R20.00",
                        onChanged: (String newValue) {
                          setState(() {
                            //dropdownValue = newValue;
                          });
                        },
                        items: <String>['R20.00', 'R30.00', 'R40.00', 'R50.00']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: new TextStyle(fontFamily: 'DroidSansChinese', color: Colors.black, fontSize: 16)),
                          );
                        }).toList(),
                      ),
                    ],

                  ),
                ],
              ),
            ),
            Expanded(child:  _buildBody(context),),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('shops').snapshots(),

      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        if (!snapshot.hasData) return Row(
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
    return GridView.count(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(), crossAxisCount: 2,
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: SpecialsCard(
          restaurantName: record.name,
          location: record.suburb,
          imageLink: record.imageLink,
        ),
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