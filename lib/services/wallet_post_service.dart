import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/error_handling.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';
import 'package:user_side_flutter/utils/constants/show_snackbar.dart';

Future<bool> walletPayment(String doctorId, String appointmentId,BuildContext context) async {
  Map<String, dynamic> payload = {
    "doctorId": doctorId,
    "appointmentId": appointmentId
  };
  dynamic key = await readToken();
  final headers = {
    'Authorization': 'Bearer $key',
    'Content-Type': 'application/json'
  }; 
  String url = Apiconfiguration.baseurl + Apiconfiguration.wallet;

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(payload)
    );
    // ignore: use_build_context_synchronously
    httpErrorHandler(response: response, context: context, onSucces: () {
      showSnackBar(context,'Wallet payment Sucessfull');
    },);
    if(response.statusCode ==200){
      log('suceesfuly payment using wallet');
     return true;
    }else{
      log('failed with an error ${response.statusCode}');
      return false;
    }
  } catch (e) {
    log('failed with an exception $e');
  }
  return false;
}
