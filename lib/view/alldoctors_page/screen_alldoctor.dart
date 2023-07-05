import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';


class ScreenAllDoctor extends StatelessWidget {
  const ScreenAllDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'All Doctors'),
      ),
      body: PrimaryWidget(
        widget: ListView.separated(
            padding: horizontal10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: cBlack.withOpacity(0.3),offset: const Offset(0, 2),spreadRadius: 0,blurRadius: 5,)],
                    borderRadius: BorderRadius.circular(10), color: cwhite),
                child:  ListTile(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenBooking(),),);
                 },
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/c1.jpeg'),
                  ),
                  title: const TextWidget(text: 'Dr.Ramees',fontWeight: FontWeight.bold,),
                  subtitle: const TextWidget(text: 'Child care',colorText: Colors.grey,),
                ),
              );
            },
            separatorBuilder: (context, index) => height10,
            itemCount: 10),
      ),
    );
  }
}
