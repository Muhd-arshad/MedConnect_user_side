import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: DrawerWidget(),
    appBar: PreferredSize(preferredSize: Size.fromHeight(70),child: AppbarWidget(title: 'Chat'),),
    body: PrimaryWidget(
      widget: Padding(
        padding: horizontal10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          TextWidget(text: 'Messages',fontWeight: FontWeight.bold,size: 20,),
          height20,
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                   boxShadow: [BoxShadow(color: cBlack.withOpacity(0.3),offset: const Offset(0, 2),spreadRadius: 0,blurRadius: 5,)],
                  color: cwhite,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  
                leading: CircleAvatar(backgroundImage: AssetImage('assets/images/WhatsApp Image 2023-02-08 at 7.20.59 PM.jpeg'),),
                title: TextWidget(text: 'Dr.ramees',),
                ),
              );
            }, separatorBuilder: (context, index) => height10, itemCount: 6),
          )
        ],
        ),
      )
    ),
    );
  }
}