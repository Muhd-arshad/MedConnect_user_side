import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/user_chat_get_controller.dart';
import 'package:user_side_flutter/view/chat_page/screen_chat.dart';
import 'package:user_side_flutter/view/home_screen/screen_home.dart';
import 'package:user_side_flutter/view/profile_page/screen_profile.dart';
import 'package:user_side_flutter/view/widgets/listtilewidget.dart';

import '../../controller/get_user_profile_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTileWidget(
            title: 'Home',
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenHome(),
                  ));
            },
          ),
          ListTileWidget(
            title: 'Chat',
            ontap: () async{
              await Provider.of<UserChatProvider>(context,listen: false).getChatUser();
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenChat(),
                  ));
            },
          ),
          ListTileWidget(
            title: 'Profile',
            ontap: () async{
               await Provider.of<UserProfileProvider>(context,listen: false).getProfile();
               // ignore: use_build_context_synchronously
               Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenProfile(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

