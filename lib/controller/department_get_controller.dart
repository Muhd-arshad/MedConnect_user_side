import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/department_model.dart';
import '../utils/constants/api_configuration.dart';
import 'package:http/http.dart' as http;

class DepartmentProvider extends ChangeNotifier {
 
   Departmentmodel? departmentmodel;
  // String? dropdownValue;
  Future<dynamic> getDepartment() async {
    // list.clear();
    String url = Apiconfiguration.baseurl + Apiconfiguration.dptdetails;
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      log('sucsesss');
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
       departmentmodel = Departmentmodel.fromJson(data);
      // list.addAll(departmentmodel.departments.map((e) => e.departmentName!));
      notifyListeners();
      return departmentmodel;
    } else {
      log('failed ${response.body}');
    }
  }
  

}