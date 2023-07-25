import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';

Future<void> profilePhotoEdit(
  String photoPath,
) async {
  Map<String, dynamic> data = {
    "profile": photoPath,
  };
  String url = Apiconfiguration.baseurl + Apiconfiguration.editPhoto;
  dynamic key = await readToken();
  try {
    http.Response response = await http.patch(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $key',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(data),
    );
    log(response.body);
    if (response.statusCode == 200) {
      log('Photo edited succsseful');
    } else {
      log('failed with an ${response.statusCode}');
    }
  } catch (e) {
    log('Failed with an exception $e');
  }
}
