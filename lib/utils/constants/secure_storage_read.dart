import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // Get the token from the secure storage.
   
  Future<String> readToken() async {
    log('enterd into key');
   String? token;
    try {
      token = await secureStorage.read(key: 'token');
      log(token!);

    } catch (e) {
      log(e.toString());
      token = null;
    }
    return token!;
  }