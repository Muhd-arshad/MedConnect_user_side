import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/apoinments_page/screen_apointments.dart';
import 'package:user_side_flutter/view/edit_profile/screen_profile_editing.dart';
import 'package:user_side_flutter/view/login_page/loginpage.dart';
import 'package:user_side_flutter/view/profile_page/widgets/profile_listview_widget.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      drawer: const DrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(title: 'Profile'),
      ),
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Column(
            children: [
              height10,
        
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/3774299.png'),
        
              ),
              height10,
              const TextWidget(text: 'Muhammed Arshad',size: 20,fontWeight: FontWeight.bold,),
              height10,
              ButtonWidget(text: 'Add Photo', onPressed: (){}, height: 45, width: 150),
              height20,
               ListviewForProfileWidget(icon:const Icon(Icons.replay_circle_filled),title: 'Apointments',ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const  ScreenApointments(),),);
              },),
              height20,
              const ListviewForProfileWidget(icon: Icon(Icons.wallet),title: 'Wallet',),
              height20,
               ListviewForProfileWidget(icon: const Icon(Icons.person),title: 'Edit Profile',ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenEditingProfile(),),);
              },),
              height20,
               ListviewForProfileWidget(icon: const Icon(Icons.logout),title: 'Logout',ontap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen(),), (route) => false);
               },),
        
            ],
          ),
        ),
      ),
    );
  }
}


