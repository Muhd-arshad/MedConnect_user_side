import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/model/doctor_list_model.dart';

import '../utils/constants/api_configuration.dart';
import '../utils/constants/secure_storage_read.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  ListDoctorModel? listDoctorModel;
  bool? status= false;
  Future<dynamic> fechDoctorDetails() async {  
    status =true;
    log('enterd in doctor fetching');
    dynamic key = await readToken();
    log(key);
    String url = Apiconfiguration.baseurl + Apiconfiguration.viedoctor;
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    log(response.body);
    if (response.statusCode == 200) {
      log('Succsessful!');
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      log(data.toString());
      listDoctorModel = ListDoctorModel.fromJson(data);
      log(listDoctorModel!.doctors.toString());
      status =false;
      return listDoctorModel;
    } else {
      log('responce failed with ${response.statusCode}');
    }
    
  }
}
