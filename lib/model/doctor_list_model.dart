
import 'dart:convert';

ListDoctorModel listDoctorModelFromJson(String str) => ListDoctorModel.fromJson(json.decode(str));

String listDoctorModelToJson(ListDoctorModel data) => json.encode(data.toJson());

class ListDoctorModel {
     List<Doctor> doctors=[];

    ListDoctorModel({
        required this.doctors,
    });

    factory ListDoctorModel.fromJson(Map<String, dynamic> json) => ListDoctorModel(
        doctors: List<Doctor>.from(json["doctors"].map((x) => Doctor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "doctors": List<dynamic>.from(doctors.map((x) => x.toJson())),
    };
}

class Doctor {
    final String? id;
    final String? firstName;
    final String? lastName;
    final int? phoneNumber;
    final String? email;
    final String? password;
    final bool? block;
    final bool? verificationStatus;
    final bool? showRequest;
    final String? profilePhoto;
    final int? v;
    final String? certificateImage;
    final String? departmentName;
    final int? experience;
    final int? fee;
    final String? idCardImage;
    final int? idNumber;
    final String? qualification;

    Doctor({
         this.id,
         this.firstName,
         this.lastName,
         this.phoneNumber,
         this.email,
         this.password,
         this.block,
         this.verificationStatus,
         this.showRequest,
         this.profilePhoto,
         this.v,
         this.certificateImage,
         this.departmentName,
         this.experience,
         this.fee,
         this.idCardImage,
         this.idNumber,
         this.qualification,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
        departmentName: json["departmentName"],
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
        "departmentName": departmentName,
        "experience": experience,
        "fee": fee,
        "idCardImage": idCardImage,
        "idNumber": idNumber,
        "qualification": qualification,
    };
}