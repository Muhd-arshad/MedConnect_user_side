import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/department_get_controller.dart';
import 'package:user_side_flutter/controller/fetch_doctor_details_controller.dart';
import 'package:user_side_flutter/model/doctor_list_model.dart';

class DoctorListingBasedonDepartmentProvider extends ChangeNotifier {
  int? selectedDepartmentIndex;
  List<Doctor> listdoc = [];

  void setSelectedDepartmentIndex(int index) {
    log('index ===========$index');
    selectedDepartmentIndex = index;
    notifyListeners();
  }

  // Method to get the list of doctors based on the selected department
  List<dynamic> getDoctorsForSelectedDepartment(BuildContext context) {
    log('selescted index == =$selectedDepartmentIndex');
    listdoc.clear();
    if (selectedDepartmentIndex != null) {
      log("in getdoctor");
      String? selectedDepartmentName = Provider.of<DepartmentProvider>(context,listen: false)
          .departmentmodel!
          .departments[selectedDepartmentIndex!]
          .departmentName;
      log(selectedDepartmentName ?? "");
      List<Doctor> temp = [];
      List<dynamic> tempdoctors =
          Provider.of<DoctorDetailsProvider>(context,listen: false).listDoctorModel!.doctors;
      log(tempdoctors.length.toString());
      for (Doctor doc in tempdoctors) {
        log("doc dept ${doc.departmentName}");
        if (doc.departmentName != null && selectedDepartmentName != null) {
          if (doc.departmentName!.trim().toLowerCase() ==
              selectedDepartmentName.trim().toLowerCase()) {
            temp.add(doc);
          }
        }
      }
      listdoc.addAll(temp.toSet().toList());
      log(listdoc.toString());
      return listdoc;
    }
    return [];
  }

}
