import 'package:flutter/material.dart';
import 'package:kasi_online/custom_widgets/custom_alertdialog.dart';
import 'package:kasi_online/custom_widgets/pre_register_dialogbox.dart';

// Abstract base class
abstract class BaseClass {

  void sendPasswordResetEmail(BuildContext context);

  void showRegisterDialog(BuildContext context);

}


class ApiBaseClass extends BaseClass {

  @override
  void sendPasswordResetEmail(BuildContext context) {
    AlertDialog dialog = new UniversalAlertDialog(useCase: "sendPasswordReset", label: "send",);
    showDialog(context: context, child: dialog);
  }

  @override
  void showRegisterDialog(BuildContext context){
    AlertDialog dialog = new PreRegisterAlertDialog(useCase: "sendPasswordReset", label: "send",);
    showDialog(context: context, child: dialog);
  }

}