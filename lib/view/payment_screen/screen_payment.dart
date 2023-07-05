import 'package:flutter/material.dart';
import 'package:user_side_flutter/view/payments_sucess/screen_payment_sucsess.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:const  PreferredSize(preferredSize: Size.fromHeight(70),child:  AppbarWidget(title: 'Payment '),),
      body: PrimaryWidget(widget: 
      Column(
        children: [
          ButtonWidget(text: "PayNow", onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenPaymentSucsess(),),);
          }, height: 60, width: 150),
        ],
      )
      ),
    );
  }
}