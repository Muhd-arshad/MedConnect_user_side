import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';

Future<void> cancelApointment(String apointmentid) async {
  Map<String, dynamic> data = {"AppointmentId": apointmentid};
  final headers = {'Content-Type': 'application/json'};
  String url = Apiconfiguration.baseurl + Apiconfiguration.cancelApointment;
  try {
    http.Response response = await http.patch(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: headers,
    );
    if(response.statusCode == 200){
      log('cancel apointment successful');
    }else{
      log('failed with an error${response.statusCode}');
    }
  } catch (e) {
    log('Cancel apoinments patch failed with an eaception $e');
  }
}
