import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_side_flutter/model/order_model.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';

import '../utils/constants/secure_storage_read.dart';

Future<dynamic> inisilalizeRazorpay(String doctorid, String appointmentId) async {
   
  Map<String, dynamic> payload = {
    "doctorId": doctorid,
    "appointmentId": appointmentId
  };
  dynamic key = await readToken();
  final headers = {
    'Authorization': 'Bearer $key',
    'Content-Type': 'application/json',
    
  };
  String url = Apiconfiguration.baseurl + Apiconfiguration.inilizeRazo;
  try {
    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(payload));
        log(response.body);
    if (response.statusCode == 200) {
      log('payment Success');
       Map<String,dynamic> data = jsonDecode(response.body)as Map<String,dynamic>;
      OrderDetailsModel  order = OrderDetailsModel.fromJson(data);
      log("in initilize ${order.order.id}");
       return order;
    } else {
      log('failed with an error${response.statusCode}');
      return null;
    }
  } catch (e) {
    log('failed with an exception $e');
  }
}
