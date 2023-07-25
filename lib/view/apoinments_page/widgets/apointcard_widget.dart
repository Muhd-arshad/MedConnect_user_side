import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/sizedbox.dart';

class ApointmentCardwidget extends StatelessWidget {
  final String date;
  final String? time;
  final String? name;
  final Function() ontap;
  const ApointmentCardwidget({
    super.key, required this.date, this.time, this.name, required this.ontap,
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
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                  const  TextWidget(
                      text: 'Date',
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                     height10,
                     TextWidget(

                  text: date,
                  size: 14,
                ),
                  ],
                ),

                Column(
                  children: [
                   const TextWidget(
                      text: 'Time',
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                     height10,
                     TextWidget(
                  text: time,
                  size: 14,
                ),
                  ],
                ),
                
                Column(
                  
                  children: [
                   const TextWidget(
                      text: 'Doctor',
                      size: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    height10,
                    TextWidget(
                  text: 'Dr.$name',
                  size: 14,
                ),
                  ],
                  
                ),
                // width5,
              ],
            ),
            
          
            height20,
            ButtonWidget(
                text: 'Cancel', onPressed: ontap, height: 40, width: 120)
          ],
        ),
      ),
    );
  }
}
