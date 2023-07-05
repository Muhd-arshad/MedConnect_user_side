import 'package:flutter/material.dart';

import '../services/login_service.dart';

class UserloginProvider extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  Future<bool> userLogin(BuildContext context) async {
    if (formGlobalKey.currentState!.validate()) {
      bool status =
          await login(emailcontroller.text, passwordcontroller.text, context);
      if (status == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
