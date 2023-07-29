import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/booking_details_get_controller.dart';
import 'package:user_side_flutter/controller/get_user_profile_controller.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/apoinments_page/screen_apointments.dart';
import 'package:user_side_flutter/view/edit_profile/screen_profile_editing.dart';
import 'package:user_side_flutter/view/login_page/loginpage.dart';
import 'package:user_side_flutter/view/profile_page/widgets/profile_listview_widget.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(title: 'Profile'),
      ),
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Provider.of<UserProfileProvider>(context, listen: false)
                          .userDetailsModel!
                          .userDetails
                          .profilePhoto ==
                      null
                  ? const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/images/3774299.png'),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          Provider.of<UserProfileProvider>(context,
                                  listen: false)
                              .userDetailsModel!
                              .userDetails
                              .profilePhoto!),
                    ),
              height20,
              TextWidget(
                text:
                    '${Provider.of<UserProfileProvider>(context).userDetailsModel!.userDetails.firstName} ${Provider.of<UserProfileProvider>(context, listen: false).userDetailsModel!.userDetails.lastName}',
                size: 20,
                fontWeight: FontWeight.bold,
              ),
              height10,
              // ButtonWidget(text: 'Add Photo', onPressed: (){}, height: 45, width: 150),
              height20,
              ListviewForProfileWidget(
                icon: const Icon(Icons.replay_circle_filled),
                title: 'Apointments',
                ontap: () async {
                  await Provider.of<GetbookingApoinmetnsProvider>(context,
                          listen: false)
                      .getApoiments();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenApointments(),
                    ),
                  );
                },
              ),
              height20,
              ListviewForProfileWidget(
                icon: const Icon(Icons.wallet),
                title: 'Wallet',
                subtitle: Provider.of<UserProfileProvider>(context)
                    .userDetailsModel!
                    .userDetails
                    .wallet
                    .toString(),
              ),
              height20,
              ListviewForProfileWidget(
                icon: const Icon(Icons.person),
                title: 'Edit Profile',
                ontap: () async {
                  await Provider.of<UserProfileProvider>(context, listen: false)
                      .getProfile();
                  // ignore: use_build_context_synchronously
                  Provider.of<UserProfileProvider>(context, listen: false)
                      .controller();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScreenEditingProfile(),
                    ),
                  );
                },
              ),
              height20,
              ListviewForProfileWidget(
                icon: const Icon(Icons.logout),
                title: 'Logout',
                ontap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
