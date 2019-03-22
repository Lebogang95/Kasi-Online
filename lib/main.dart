import 'package:flutter/material.dart';
import 'package:kasi_online/app/verification_check.dart';
import 'package:kasi_online/data/root_page.dart';
import 'package:kasi_online/home_view.dart';
import 'package:kasi_online/login_view.dart';
import 'package:kasi_online/utils/verify_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Firebase Intergration',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(),
    );
  }
}