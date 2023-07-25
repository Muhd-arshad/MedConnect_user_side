// To parse this JSON data, do
//
//     final booknigDetailsModel = booknigDetailsModelFromJson(jsonString);
import 'dart:convert';

BooknigDetailsModel booknigDetailsModelFromJson(String str) => BooknigDetailsModel.fromJson(json.decode(str));

String booknigDetailsModelToJson(BooknigDetailsModel data) => json.encode(data.toJson());

class BooknigDetailsModel {
    final List<Appointment> appointments;

    BooknigDetailsModel({
        required this.appointments,
    });

    factory BooknigDetailsModel.fromJson(Map<String, dynamic> json) => BooknigDetailsModel(
        appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    };
}

class Appointment {
    final String id;
    final UserId userId;
    final DoctorId doctorId;
    final String appointmentId;
    final bool cancelled;
    final DateTime date;
    final String time;
    final int amountPaid;
    final DateTime createdAt;
    final int v;

    Appointment({
        required this.id,
        required this.userId,
        required this.doctorId,
        required this.appointmentId,
        required this.cancelled,
        required this.date,
        required this.time,
        required this.amountPaid,
        required this.createdAt,
        required this.v,
    });

    factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json["_id"],
        userId: UserId.fromJson(json["userId"]),
        doctorId: DoctorId.fromJson(json["doctorId"]),
        appointmentId: json["appointmentId"],
        cancelled: json["cancelled"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        amountPaid: json["amountPaid"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId.toJson(),
        "doctorId": doctorId.toJson(),
        "appointmentId": appointmentId,
        "cancelled": cancelled,
        "date": date.toIso8601String(),
        "time": time,
        "amountPaid": amountPaid,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class DoctorId {
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

    DoctorId({
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

    factory DoctorId.fromJson(Map<String, dynamic> json) => DoctorId(
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

class UserId {
    final String id;
    final String firstName;
    final String lastName;
    final int wallet;
    final int phoneNumber;
    final String email;
    final String password;
    final bool block;
    final String profilePhoto;
    final DateTime createdAt;
    final int v;

    UserId({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.wallet,
        required this.phoneNumber,
        required this.email,
        required this.password,
        required this.block,
        required this.profilePhoto,
        required this.createdAt,
        required this.v,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
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
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
