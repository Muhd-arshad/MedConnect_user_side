import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';

Future<void> profileDetails(
  String firstName,
  String secondname,
  String mail,
  String number,
) async {
  dynamic key = await readToken();
  Map<String, dynamic> data = {
    "details": {
      "firstName": firstName,
      "lastName": secondname,
      "email": mail,
      "phoneNumber": number
    }
  };
  final headers = {
    'Authorization': 'Bearer $key',
    'Content-Type': 'application/json'
  };

  String url = Apiconfiguration.baseurl + Apiconfiguration.editDetails;
  try {
    http.Response response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data)
    );
    if(response.statusCode == 200){
      log('Edit details metheod successful');
    }else{
      log('Failed with with ${response.statusCode}');
    }
  } catch (e) {
    log('failed with an exception $e');
  }
}
