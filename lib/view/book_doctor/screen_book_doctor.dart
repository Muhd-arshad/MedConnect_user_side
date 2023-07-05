import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/book_doctor/widgets/screen_apoiments.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenBooking extends StatelessWidget {
  const ScreenBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PrimaryWidget(
        widget: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                height20,
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/c1.jpeg'),
                ),
                height10,
                Padding(
                  padding: horizontal10,
                  child: Column(
                    children: [
                      height10,
                      TextWidget(
                        text: 'Child Care Expert',
                        size: 19,
                        colorText: Colors.blueGrey,
                      ),
                      height10,
                      TextWidget(
                        text: 'Dr.Ramees',
                        size: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      height10,
                      TextWidget(
                        text: '10 years Of Experiance',
                        size: 19,
                        colorText: Colors.blueGrey,
                      ),
                      height30,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          text: 'Schedule Appointment',
                          size: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height20,
                      ScreenApointment()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
