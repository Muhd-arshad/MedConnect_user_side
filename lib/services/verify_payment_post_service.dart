import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';

import '../utils/constants/secure_storage_read.dart';
bool? successnavigate =false;
Future<void> verifyPayment(
    String apoinmentid,dynamic response) async {
  dynamic key = await readToken();
  Map<String, dynamic> payload = {
    "appointmentId": apoinmentid,
    "response": response
  };

  final headers = {
    'Authorization': 'Bearer $key',
    'Content-Type': 'application/json',
  };
  // String url = 'http://10.4.3.105 :8080/api/verifyPayment';
  String url =Apiconfiguration.baseurl + Apiconfiguration.verify;

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(payload),
      headers: headers
    );
   
    if(response.statusCode ==200){
      successnavigate =true;
      log('verify payment successfull');
    }else{
      successnavigate =false;
      log('verify payment failed with an ${response.statusCode}');
    }
  } catch (e) {
    successnavigate =false;
    log('verify payment failed with an exception $e');
  }
}
