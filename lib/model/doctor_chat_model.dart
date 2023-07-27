import 'dart:convert';

List<DoctorMessageModel> doctorMessageModelFromJson(String str) => List<DoctorMessageModel>.from(json.decode(str).map((x) => DoctorMessageModel.fromJson(x)));

String doctorMessageModelToJson(List<DoctorMessageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorMessageModel {
    final bool fromSelf;
    final String message;
    final DateTime time;

    DoctorMessageModel({
        required this.fromSelf,
        required this.message,
        required this.time,
    });

    factory DoctorMessageModel.fromJson(Map<String, dynamic> json) => DoctorMessageModel(
        fromSelf: json["fromSelf"],
        message: json["message"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "fromSelf": fromSelf,
        "message": message,
        "time": time.toIso8601String(),
    };
}