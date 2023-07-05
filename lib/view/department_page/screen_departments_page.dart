import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/alldoctors_page/screen_alldoctor.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';
List dept = ['Child Care', 'Dentist', 'Ortho', 'Homeo'];
class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Departments'),
      ),
      body: PrimaryWidget(
        widget: ListView.separated(
          padding: horizontal10,
          itemBuilder: (context, index) {
          return Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
               boxShadow: [BoxShadow(color: cBlack.withOpacity(0.3),offset: const Offset(0, 2),spreadRadius: 0,blurRadius: 5,)],
              color: cwhite,borderRadius: BorderRadius.circular(10),),
            child:ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenAllDoctor(),),);
            },
              title: TextWidget(text: dept[index],size: 18,fontWeight: FontWeight.bold),
            ),
          );
        }, 
        separatorBuilder: (context, index) => height20, itemCount: dept.length),
      ),
    );
  }
}
