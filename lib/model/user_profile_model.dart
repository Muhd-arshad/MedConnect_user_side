// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
    final UserDetails userDetails;

    UserDetailsModel({
        required this.userDetails,
    });

    factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
        userDetails: UserDetails.fromJson(json["userDetails"]),
    );

    Map<String, dynamic> toJson() => {
        "userDetails": userDetails.toJson(),
    };
}

class UserDetails {
    final String? id;
     String? firstName;
     String? lastName;
    final int? wallet;
   int? phoneNumber;
     String? email;
    final String? password;
    final bool? block;
     String? profilePhoto;
    final DateTime? createdAt;
    final int? v;

    UserDetails({
         this.id,
         this.firstName,
         this.lastName,
         this.wallet,
         this.phoneNumber,
         this.email,
         this.password,
         this.block,
         this.profilePhoto,
         this.createdAt,
         this.v,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        wallet: json["wallet"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        block: json["block"],
        profilePhoto: json["profilePhoto"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "wallet": wallet,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "block": block,
        "profilePhoto": profilePhoto,
        "createdAt": createdAt!.toIso8601String(),
        "__v": v,
    };
}
