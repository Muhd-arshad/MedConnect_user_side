import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';
import 'package:http/http.dart' as http;
import '../model/booking_apoinments_details_model.dart';

class GetbookingApoinmetnsProvider extends ChangeNotifier {
  BooknigDetailsModel? bookingDetailsModel;

  Future<dynamic> getApoiments() async {
    dynamic key = await readToken();

    String url = Apiconfiguration.baseurl + Apiconfiguration.bookedApoinment;
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      log('apoinmets ${response.body}');
      if(response.statusCode == 200){
        log('get apoinment succesful');
        Map<String,dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
        bookingDetailsModel =BooknigDetailsModel.fromJson(data);
        return bookingDetailsModel;
      }
    } catch (e) {
      log('Get booked apoinments failed with an exception $e');
    }
  }
}
