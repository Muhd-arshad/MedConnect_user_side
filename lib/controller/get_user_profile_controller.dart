import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_side_flutter/model/user_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:user_side_flutter/services/edit_profile_photo_patch_service.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import 'package:user_side_flutter/utils/constants/secure_storage_read.dart';

import '../services/edit_profile_details_patch_service.dart';

class UserProfileProvider extends ChangeNotifier {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController secondnamecontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  UserDetailsModel? userDetailsModel;
  File? photo;
  String? profilepath;
  Future<dynamic> getProfile() async {
    dynamic key = await readToken();
    final headers = {
      'Authorization': 'Bearer $key',
      'Content-Type': 'application/json'
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.getUserdetails;
    try {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        log('get user details is sucsees');
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        userDetailsModel = UserDetailsModel.fromJson(data);
        return userDetailsModel;
      }
    } catch (e) {
      log('failed with an exception $e');
    }
    notifyListeners();
  }

  void controller() {
    namecontroller.text = userDetailsModel!.userDetails.firstName!;
    secondnamecontroller.text = userDetailsModel!.userDetails.lastName!;
    emailcontroller.text = userDetailsModel!.userDetails.email!;
    phoneNumbercontroller.text =
        userDetailsModel!.userDetails.phoneNumber!.toString();
  }

  Future<void> imagePicker() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    } else {
      final phototemp = File(image.path);
      photo = phototemp;
      profilepath = await uploadToCloudinery(photo!.path);

      userDetailsModel!.userDetails.profilePhoto = profilepath;
      log('$profilepath');

      notifyListeners();
    }
  }

  Future<void> editProfilePhoto() async {
    profilepath = userDetailsModel!.userDetails.profilePhoto ;
    await profilePhotoEdit(profilepath!);
  }

  Future<dynamic> uploadToCloudinery(String imagepath) async {
    final cloudinery = Cloudinary.signedConfig(
      apiKey: '331149413215856',
      apiSecret: 'DuAkn5qC3Rr2zBWv1ZVjDGHDVA8',
      cloudName: 'dupsc4cu4',
    );
    try {
      CloudinaryResponse response = await cloudinery.upload(
        file: imagepath,
        fileBytes: File(imagepath).readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );
      if (response.statusCode == 200) {
        log('Sucessfull');
        String imageUrl = response.secureUrl.toString();
        return imageUrl;
      }
    } catch (e) {
      log('failed with an exception in cloudinery upload $e');
    }
  }

  Future<void> editProfileDetails() async {
    await profileDetails(
      namecontroller.text,
      secondnamecontroller.text,
      emailcontroller.text,
      phoneNumbercontroller.text,
    );
    userDetailsModel!.userDetails.profilePhoto = profilepath.toString();
    userDetailsModel!.userDetails.firstName = namecontroller.text;
    userDetailsModel!.userDetails.lastName = secondnamecontroller.text;
    userDetailsModel!.userDetails.email = emailcontroller.text;
    userDetailsModel!.userDetails.phoneNumber =
        int.parse(phoneNumbercontroller.text);
    notifyListeners();
  }
}
