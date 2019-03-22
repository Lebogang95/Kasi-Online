import 'package:flutter/material.dart';
import 'package:kasi_online/app/verification_check.dart';
import 'package:kasi_online/data/auth.dart';
import 'package:kasi_online/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';


class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth}) : super(key: key);
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.notSignedIn;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> isLoggedIn() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  initState() {
    super.initState();
    isLoggedIn().then((userId) {
      setState(() {
        authStatus = userId != null ? AuthStatus.signedIn : AuthStatus.notSignedIn;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginPage();
      case AuthStatus.signedIn:
        return new VerificationCheckPage(
            auth: widget.auth,
        );
    }
  }
}