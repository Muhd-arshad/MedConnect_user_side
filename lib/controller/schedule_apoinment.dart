import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:user_side_flutter/services/verify_payment_post_service.dart';
import 'package:user_side_flutter/utils/constants/api_configuration.dart';
import '../model/booking_details_model.dart';
import '../model/order_model.dart';

class ScheduleApoinmentProvider extends ChangeNotifier {
  DateTime? selecteddate;
  String? dropdownValue;
  List<String> listStartingTime = [''];
  List<String> listLastTime = [''];
  List<String> timeschedue = [''];
  String? time;

  BookingDetailsModel? bookingDetailsModel;
// bool isloading =false;
  DateTime? get selectedDate => selecteddate;

  void setSelectedDate(DateTime? date) {
    selecteddate = date;
    notifyListeners();
  }

  void changevalue(String value) {
    dropdownValue = value;
    notifyListeners();
  }

  Future<dynamic> scheduleApoinmet(String id) async {
    listStartingTime.clear();
    listLastTime.clear();
    Map<String, dynamic> payload = {"doctorId": id};

    String url = Apiconfiguration.baseurl + Apiconfiguration.bookingDetails;

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      log(response.body);

      if (response.statusCode == 200) {
        log('sucessful get apoinment');
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        bookingDetailsModel = BookingDetailsModel.fromJson(data);
        listStartingTime.addAll(
          bookingDetailsModel!.bookingDetails.map((e) => e.startingTime!),
        );
        listLastTime.addAll(
            bookingDetailsModel!.bookingDetails.map((e) => e.endingTime!));
        time =
            '${listStartingTime[listStartingTime.length - 1]}  ${listLastTime[listLastTime.length - 1]}';
        timeschedue.add(time!);
        return bookingDetailsModel;
      }
    } catch (e) {
      log('failed with an exception $e');
    }
  }

  Razorpay razorpay = Razorpay();
  bool? isSuccess = false;
  void initializeRazorpay() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void disposeRazorpay() {
    razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response1) {
     isSuccess = true;
     notifyListeners();
  
    dynamic response = {
      // The success response from Razorpay.
      'razorpay_payment_id': response1.paymentId,
      'razorpay_order_id': response1.orderId,
      'razorpay_signature': response1.signature,
    };
   
    verifyPayment(
      bookingDetailsModel!
          .bookingDetails[bookingDetailsModel!.bookingDetails.length - 1].id!,
      response,
    );
    disposeRazorpay();
    log("Payment Successful: ${response1.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment error logic here
    log("Payment Error: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // External wallet logic here
    log("External Wallet: ${response.walletName}");
  }

  void openCheckout(OrderDetailsModel order) {
    log(order.order.id);

    var options = {
      'key': 'rzp_test_7b7zq020vmJ34I', // Replace with your Razorpay key
      'amount': order.order.amount,
      'currency': order.order.currency, // Amount in paisa (e.g., 2000 for ₹20)
      'order_id': order.order.id,
      'name': 'Dr care',
      'description': 'Test Payment',
      'prefill': {'contact': '1234567890', 'email': 'YOUR_EMAIL'},
      'external': {
        'wallets': ['paytm'], // Add supported wallets (if any)
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
   
  }
}
