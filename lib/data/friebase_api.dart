// Abstract base class
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kasi_online/data/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FirebaseApiClass {

  FirebaseApiClass({ this.auth });

  final BaseAuth auth;

  void performLogin();

  void createUser();

  void sendEmailVerification();

  Future<bool> isEmailVerified();

  void signOut();

}

class ApiClass extends FirebaseApiClass {

  ApiClass({ this.auth });

  final BaseAuth auth;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void performLogin() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    String password = prefs.getString('password');

    try {
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      print(user.uid);
    }
    catch (e){
      print(e);
    }

  }

  @override
  void createUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email');
    String password = prefs.getString('password');
    String confirmPassword = prefs.get('register_confirmPassword');

    try {
      FirebaseUser user;
      user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      sendEmailVerification();
    }
    catch (e){
      print(e);
    }
  }

  void sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  void signOut() async {
    _firebaseAuth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}