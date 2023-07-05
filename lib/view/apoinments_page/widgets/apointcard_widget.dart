import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizedbox.dart';

class ApointmentCardwidget extends StatelessWidget {
  const ApointmentCardwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: cwhite),
      child: Padding(
        padding: horizontal10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                TextWidget(
                  text: 'Date',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),

                SizedBox(
                  width: 83,
                ),
                TextWidget(
                  text: 'Time',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 50,
                ),
                TextWidget(
                  text: 'Doctor',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                // width5,
              ],
            ),
            height10,
            const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: '27/06/2023',
                  size: 18,
                ),
                SizedBox(
                  width: 30,
                ),
                TextWidget(
                  text: '2.02pm',
                  size: 18,
                ),
                SizedBox(
                  width: 30,
                ),

                TextWidget(
                  text: 'DR.ramees',
                  size: 18,
                ),

                // width5
              ],
            ),
            height20,
            ButtonWidget(
                text: 'Cancel', onPressed: () {}, height: 30, width: 120)
          ],
        ),
      ),
    );
  }
}
