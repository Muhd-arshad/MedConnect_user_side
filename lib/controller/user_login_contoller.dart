import 'package:flutter/material.dart';

import '../services/login_service.dart';

class UserloginProvider extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
    final GlobalKey<FormState> formGlobalKey= GlobalKey<FormState>();
  bool isloaded = false;
  Future<bool> userLogin(BuildContext context) async {
    isloaded = true;
    notifyListeners();
    if (formGlobalKey.currentState!.validate()) {
      bool status =
          await login(emailcontroller.text, passwordcontroller.text, context);
      if (status == true) {
        isloaded = false;
        notifyListeners();
        return true;
      } else {
        isloaded = false;
        notifyListeners();
        return false;
      }
    }
    isloaded =false;
    notifyListeners();
    return false;
  }
  void feildClear(){
    emailcontroller.clear();
    passwordcontroller.clear();
    notifyListeners();
  }
}
