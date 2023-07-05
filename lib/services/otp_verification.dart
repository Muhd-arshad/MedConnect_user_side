import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';

import '../utils/constants/error_handling.dart';
import '../utils/constants/show_snackbar.dart';
Future<bool> otpInput(String otpInput,BuildContext context)async{

  Map<String ,dynamic> payload ={
    "otpCode" : otpInput,
  };
  
  String url = Apiconfiguration.baseurl + Apiconfiguration.otpurl;

  var response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(payload),
    

  );
  log(response.body.toString());
  // ignore: use_build_context_synchronously
  httpErrorHandler(response: response, context: context, onSucces: (){
      showSnackBar(context, 'Sucessfuly login');
    });
  if(response.statusCode == 200){
    log('sucess');
    return true;
  }else{
    log('Request failed with status code ${response.statusCode}');
    return false;
  }
}