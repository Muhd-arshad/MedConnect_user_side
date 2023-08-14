import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/schedule_apoinment.dart';
import 'package:user_side_flutter/services/wallet_post_service.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/payments_sucess/screen_payment_sucsess.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import '../../../services/inilize_razorpay_post_service.dart';
import '../../../utils/constants/color.dart';

class ScreenApointment extends StatelessWidget {
  const ScreenApointment({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleApoinmentProvider>(
        builder: (context, sheduleApoinmet, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          height10,
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cwhite,
              boxShadow: [
                BoxShadow(
                  color: cBlack.withOpacity(0.3),
                  blurRadius: 5.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: sheduleApoinmet.bookingDetailsModel!.bookingDetails.isEmpty
                ? const Center(child: Text('No Date Slots Available'))
                : TextButton.icon(
                    onPressed: () async {
                      final selectedDateTemp = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: sheduleApoinmet
                            .bookingDetailsModel!
                            .bookingDetails[sheduleApoinmet.bookingDetailsModel!
                                    .bookingDetails.length -
                                1]
                            .date!,
                        lastDate: DateTime.now().add(
                          const Duration(days: 100),
                        ),
                      );
                      if (selectedDateTemp == null) {
                        return;
                      } else {
                        sheduleApoinmet.setSelectedDate(selectedDateTemp);
                      }
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    label: Text(
                      sheduleApoinmet.selectedDate == null
                          ? "select date"
                          : DateFormat("yyyy-MM-dd")
                              .format(sheduleApoinmet.selectedDate!),
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 15),
                    ),
                  ),
          ),
          height20,
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cwhite,
              boxShadow: [
                BoxShadow(
                  color: cBlack.withOpacity(0.3),
                  blurRadius: 5.0,
                  spreadRadius: 0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: sheduleApoinmet.bookingDetailsModel!.bookingDetails.isEmpty
                  ? const Text('No Time Slots Available')
                  : Text(sheduleApoinmet.time!),
            ),
          ),
          height30,
          ButtonWidget(
              text: 'Book Now',
              onPressed: sheduleApoinmet
                      .bookingDetailsModel!.bookingDetails.isEmpty
                  ? () {
                      return ScaffoldMessenger.of(context)..removeCurrentSnackBar()..showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: cBlack.withOpacity(0.5),
                          content: const Center(
                            child: TextWidget(
                              text: 'No Slots Available',
                              colorText: cwhite,
                              size: 18,
                            ),
                          ),
                        ),
                      );
                    }
                  : () async {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              'Select A payment Metheod',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  log('wallet clicked');
                                  bool status = await walletPayment(
                                      id,
                                      sheduleApoinmet
                                          .bookingDetailsModel!
                                          .bookingDetails[sheduleApoinmet
                                                  .bookingDetailsModel!
                                                  .bookingDetails
                                                  .length -
                                              1]
                                          .id!,
                                      context);
                                  if (status == true) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ScreenPaymentSucsess(),
                                      ),
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Wallet'),
                              ),
                              Consumer<ScheduleApoinmentProvider>(
                                  builder: (context, paymentProvider, child) {
                                return TextButton(
                                  onPressed: () async {
                                    log('other clicked');
                                    dynamic order = await inisilalizeRazorpay(
                                        id,
                                        sheduleApoinmet
                                            .bookingDetailsModel!
                                            .bookingDetails[sheduleApoinmet
                                                    .bookingDetailsModel!
                                                    .bookingDetails
                                                    .length -
                                                1]
                                            .id!);
                                    order == null
                                        ? log("null recieved")
                                        :

                                        // ignore: use_build_context_synchronously
                                        paymentProvider.openCheckout(order);
                                   

                                    if (paymentProvider.isSucess == true) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ScreenPaymentSucsess(),
                                        ),
                                      );
                                      
                                    }

                                    // paymentProvider.disposeRazorpay();
                                  },
                                  child: const Text('Other'),
                                );
                              }),
                            ],
                          );
                        },
                      );
                    },
              height: 50,
              width: 140)
        ],
      );
    });
  }
}
