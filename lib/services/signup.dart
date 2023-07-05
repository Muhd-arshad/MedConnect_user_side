import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/model/user_model.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/error_handling.dart';
import 'package:user_side_flutter/utils/constants/show_snackbar.dart';
//10.4.3.105 
Future<dynamic> signup(
    String firstName,
    String secondName,
    int phoneNumber,
    String email,
    String password,
    String confirmPassword,
    BuildContext context) async {
  http.Response? response;
  Map<String, dynamic> payload = {
    'value': {
      'firstName': firstName,
      'lastName': secondName,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    },
  };
  try {
    String url = Apiconfiguration.baseurl + Apiconfiguration.signupurl;
    response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    // ignore: use_build_context_synchronously
    httpErrorHandler(
        response: response,
        context: context,
        onSucces: () {
          showSnackBar(context, 'SucssesFull');
        });

    if (response.statusCode == 200) {
      log('Request succeeded!');
      Usermodel.fromJson(payload);
      return true;
    } else {
      // Request failed
      log('Request failed with status code ${response.statusCode}');
      return false;
    }
  } catch (e) {
    log(e.toString());
  }
}
