import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/model/user_chat_model.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';

class UserChatProvider extends ChangeNotifier {
 UserChatModel? userChatModel; 
  Future<void> getChatUser() async {
    String url = Apiconfiguration.baseurl + Apiconfiguration.useerChat;
    dynamic key = await readToken();
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers
      );
      log(response.body);
      if(response.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(response.body) as Map<String,dynamic>;
        userChatModel = UserChatModel.fromJson(data);
        
      }
    } catch (e) {
      log('get chat failed with an exception $e');
    }
  }
}
