import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_side_flutter/model/doctor_chat_model.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class GetDoctorMessageProvider extends ChangeNotifier {
  List<DoctorMessageModel>? doctorMessageList;
 TextEditingController msgController = TextEditingController();
   final ScrollController scrollController = ScrollController();
  Future<void> getMessage(String doctorId) async {
    dynamic key = await readToken();
    Map<String, dynamic> payload = {
      "to": doctorId,
    };
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
     String url = Apiconfiguration.baseurl + Apiconfiguration.chatwithdocid;
    // String url ='http://'
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: headers
      );
      log('response.body ========${response.body}');
      if(response.statusCode == 200){
        log('Get metheod successfull');
        //Map<String,dynamic> data =jsonDecode(response.body) as Map<String,dynamic>;
         // = DoctorMessageModel.fromJson(data);
         doctorMessageList=doctorMessageModelFromJson(response.body);
      }
    } catch (e) {
      log('get msg failed with an exception $e');
    }
    notifyListeners();
  }
  
  Future<void> sendMsg(String doctorId) async {
    dynamic key = await readToken();
    Map<String, dynamic> payload = {
      "to": doctorId,
      "message": msgController.text
    };
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json'
    };
    log('msg====${msgController.text}');
    String url = Apiconfiguration.baseurl + Apiconfiguration.sendMsg;
    // String url = 'http://10.4.3.105:8080/api/message/addMessage';
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(payload),
        headers: headers
      );
      if(response.statusCode == 200){
        log('send msg sucessful with============= ${response.body}');
      }else{
        log('failed with an error ${response.statusCode}');
      }
    } catch (e) {
      log(' send message Failed with an exception $e');
    }
  }
   void messageClear(){
    msgController.clear();
    notifyListeners();
  }
  late IO.Socket socket;
String serverUrl =Apiconfiguration.baseurl;
  void initSocketConnection(String userId) {
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.on('msg-recieve', (data) {
      // Handle received message here
      log('Received message: $data');
   DoctorMessageModel model = DoctorMessageModel(fromSelf: false, message: data, time:DateTime.now());
    doctorMessageList!.add(model);
      notifyListeners();
    });

    // Emit 'add-user' event to the server with the user's ID
    socket.emit('add-user', userId);
    notifyListeners();
  }

  void sendMessage(String recipientUserId, String message) {
    log('send messge callinggg == =');
    if (message.isNotEmpty) {
      // Emit 'send-msg' event to the server with message data
      socket.emit('send-msg', {
        'to': recipientUserId,
        'message': message,
      });
    }
  }
  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
      );
    }
    notifyListeners();
  }
  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
