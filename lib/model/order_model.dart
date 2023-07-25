// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
    final Order order;

    OrderDetailsModel({
        required this.order,
    });

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
        order: Order.fromJson(json["order"]),
    );

    Map<String, dynamic> toJson() => {
        "order": order.toJson(),
    };
}

class Order {
    final String id;
    final String entity;
    final int amount;
    final int amountPaid;
    final int amountDue;
    final String currency;
    final dynamic receipt;
    final dynamic offerId;
    final String status;
    final int attempts;
    final List<dynamic> notes;
    final int createdAt;

    Order({
        required this.id,
        required this.entity,
        required this.amount,
        required this.amountPaid,
        required this.amountDue,
        required this.currency,
        required this.receipt,
        required this.offerId,
        required this.status,
        required this.attempts,
        required this.notes,
        required this.createdAt,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        entity: json["entity"],
        amount: json["amount"],
        amountPaid: json["amount_paid"],
        amountDue: json["amount_due"],
        currency: json["currency"],
        receipt: json["receipt"],
        offerId: json["offer_id"],
        status: json["status"],
        attempts: json["attempts"],
        notes: List<dynamic>.from(json["notes"].map((x) => x)),
        createdAt: json["created_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entity": entity,
        "amount": amount,
        "amount_paid": amountPaid,
        "amount_due": amountDue,
        "currency": currency,
        "receipt": receipt,
        "offer_id": offerId,
        "status": status,
        "attempts": attempts,
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "created_at": createdAt,
    };
}
