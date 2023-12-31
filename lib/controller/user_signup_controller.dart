import 'package:flutter/material.dart';
import 'package:user_side_flutter/model/user_model.dart';
import 'package:user_side_flutter/services/signup.dart';

class Usercontroller extends ChangeNotifier {
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController secondnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  Usermodel? user;
  bool? isloading = false;
  final formGlobalKey = GlobalKey<FormState>();

  Future<bool> userSignup(BuildContext context) async {
    isloading =true;
    notifyListeners();
    if (formGlobalKey.currentState!.validate()) {
      bool status = await signup(
        firstnamecontroller.text,
        secondnamecontroller.text,
        int.parse(phonenumbercontroller.text),
        emailcontroller.text,
        passwordcontroller.text,
        confirmpasswordcontroller.text,
        context,
      );

      if (status == true) {
        isloading = false;
        notifyListeners();
        return true;
      } else {
        isloading =false;
        notifyListeners();
        return false;
      }
    }

    return false;
  }
}
