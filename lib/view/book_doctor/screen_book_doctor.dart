import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/schedule_apoinment.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/book_doctor/widgets/screen_apoiments.dart';
import 'package:user_side_flutter/view/home_screen/screen_home.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

import '../../model/doctor_list_model.dart';

class ScreenBooking extends StatelessWidget {
  final Doctor doctorModel;

  const ScreenBooking({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    log(doctorModel.id.toString());
    final paymentNotifier =
        Provider.of<ScheduleApoinmentProvider>(context, listen: false);
    paymentNotifier.initializeRazorpay();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ScreenHome(),
            ),
            (route) => false);
        return false;
      },
      child: Scaffold(
        body: PrimaryWidget(
          widget: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  height20,
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(doctorModel.profilePhoto!),
                  ),
                  height10,
                  Padding(
                    padding: horizontal10,
                    child: Column(
                      children: [
                        height10,
                        TextWidget(
                          text: doctorModel.departmentName,
                          size: 19,
                          colorText: Colors.blueGrey,
                        ),
                        height10,
                        TextWidget(
                          text:
                              '${doctorModel.firstName} ${doctorModel.lastName}',
                          size: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        height10,
                        TextWidget(
                          text: '${doctorModel.experience} years Of Experiance',
                          size: 19,
                          colorText: Colors.blueGrey,
                        ),
                        height30,
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: TextWidget(
                            text: 'Schedule Appointment',
                            size: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height20,
                        ScreenApointment(id: doctorModel.id!)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
