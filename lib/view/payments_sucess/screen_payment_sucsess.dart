import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/home_screen/screen_home.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenPaymentSucsess extends StatelessWidget {
  const ScreenPaymentSucsess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(widget:
      SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundColor: cwhite,child: Icon(Icons.done,size: 60,),),
              height50,
              const TextWidget(text: 'Congratulation',size: 25,fontWeight: FontWeight.bold,),
              height30,
              const TextWidget(text: 'Your Payments is Succesfull',fontWeight: FontWeight.bold,),
              height30,
              ButtonWidget(text: 'Go Home', onPressed:(){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const ScreenHome(),), (route) => false,);
              }, height: 60, width: 200)

          ],
        ),
      ) ,
      ),
    );
  }
}