// To parse this JSON data, do
//
//     final userChatModel = userChatModelFromJson(jsonString);

import 'dart:convert';

UserChatModel userChatModelFromJson(String str) => UserChatModel.fromJson(json.decode(str));

String userChatModelToJson(UserChatModel data) => json.encode(data.toJson());

class UserChatModel {
    final List<ChattableDoctor> chattableDoctors;

    UserChatModel({
        required this.chattableDoctors,
    });

    factory UserChatModel.fromJson(Map<String, dynamic> json) => UserChatModel(
        chattableDoctors: List<ChattableDoctor>.from(json["chattableDoctors"].map((x) => ChattableDoctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "chattableDoctors": List<dynamic>.from(chattableDoctors.map((x) => x.toJson())),
    };
}

class ChattableDoctor {
    final String id;
    final String firstName;
    final String lastName;
    final int phoneNumber;
    final String email;
    final String password;
    final bool block;
    final bool verificationStatus;
    final bool showRequest;
    final String profilePhoto;
    final int v;
    final String certificateImage;
    final int experience;
    final int fee;
    final String idCardImage;
    final int idNumber;
    final String qualification;

    ChattableDoctor({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        required this.password,
        required this.block,
        required this.verificationStatus,
        required this.showRequest,
        required this.profilePhoto,
        required this.v,
        required this.certificateImage,
        required this.experience,
        required this.fee,
        required this.idCardImage,
        required this.idNumber,
        required this.qualification,
    });

    factory ChattableDoctor.fromJson(Map<String, dynamic> json) => ChattableDoctor(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        block: json["block"],
        verificationStatus: json["verificationStatus"],
        showRequest: json["showRequest"],
        profilePhoto: json["profilePhoto"],
        v: json["__v"],
        certificateImage: json["certificateImage"],
        experience: json["experience"],
        fee: json["fee"],
        idCardImage: json["idCardImage"],
        idNumber: json["idNumber"],
        qualification: json["qualification"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "block": block,
        "verificationStatus": verificationStatus,
        "showRequest": showRequest,
        "profilePhoto": profilePhoto,
        "__v": v,
        "certificateImage": certificateImage,
        "experience": experience,
        "fee": fee,
        "idCardImage": idCardImage,
        "idNumber": idNumber,
        "qualification": qualification,
    };
}
