
import 'dart:convert';

BookingDetailsModel bookingDetailsModelFromJson(String str) => BookingDetailsModel.fromJson(json.decode(str));

String bookingDetailsModelToJson(BookingDetailsModel data) => json.encode(data.toJson());

class BookingDetailsModel {
     List<BookingDetail> bookingDetails = [];
    final int fee;

    BookingDetailsModel({
        required this.bookingDetails,
        required this.fee,
    });

    factory BookingDetailsModel.fromJson(Map<String, dynamic> json) => BookingDetailsModel(
        bookingDetails: List<BookingDetail>.from(json["bookingDetails"].map((x) => BookingDetail.fromJson(x))),
        fee: json["fee"],
    );

    Map<String, dynamic> toJson() => {
        "bookingDetails": List<dynamic>.from(bookingDetails.map((x) => x.toJson())),
        "fee": fee,
    };
}

class BookingDetail {
    final String? id;
    final String? doctorId;
    final DateTime? date;
    final String? startingTime;
    final String? endingTime;
    final int? slot;
    final int? v;

    BookingDetail({
         this.id,
         this.doctorId,
         this.date,
         this.startingTime,
         this.endingTime,
         this.slot,
         this.v,
    });

    factory BookingDetail.fromJson(Map<String, dynamic> json) => BookingDetail(
        id: json["_id"],
        doctorId: json["doctorId"],
        date: DateTime.parse(json["date"]),
        startingTime: json["startingTime"],
        endingTime: json["endingTime"],
        slot: json["slot"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "doctorId": doctorId,
        "date": date?.toIso8601String(),
        "startingTime": startingTime,
        "endingTime": endingTime,
        "slot": slot,
        "__v": v,
    };
}