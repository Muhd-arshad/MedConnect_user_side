import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/payment_screen/screen_payment.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/textformwidget.dart';

class ScreenApointment extends StatelessWidget {
  const ScreenApointment({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextformFeildWidget(
          controller: datecontroller,
          labelText: 'Select Date',
        ),
        height20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 150,
                height: 60,
                child: TextformFeildWidget(
                  controller: datecontroller,
                  labelText: 'Time',
                )),
            SizedBox(
                width: 150,
                height: 60,
                child: TextformFeildWidget(
                  controller: datecontroller,
                  labelText: 'Sloat',
                )),
          ],
        ),
        height30,
        ButtonWidget(
            text: 'Book Now',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenPayment(),
                ),
              );
            },
            height: 50,
            width: 140)
      ],
    );
  }
}
