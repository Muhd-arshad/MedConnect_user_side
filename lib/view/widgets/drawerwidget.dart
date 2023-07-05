import 'package:flutter/material.dart';
import 'package:user_side_flutter/view/chat_page/screen_chat.dart';
import 'package:user_side_flutter/view/home_screen/screen_home.dart';
import 'package:user_side_flutter/view/profile_page/screen_profile.dart';
import 'package:user_side_flutter/view/widgets/listtilewidget.dart';

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
            ontap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenChat(),
                  ));
            },
          ),
          ListTileWidget(
            title: 'Profile',
            ontap: () {
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

