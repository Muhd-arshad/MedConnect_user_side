import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/get_user_profile_controller.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';
import 'package:user_side_flutter/view/widgets/textformwidget.dart';

List<String> textlist = [
  'Name',
  'Second Name',
  'Phone Number',
  'E-Mail',
  'Password'
];

class ScreenEditingProfile extends StatelessWidget {
  const ScreenEditingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppbarWidget(title: ' Edit Profile')),
      body: SingleChildScrollView(
        child: PrimaryWidget(
            widget: Padding(
          padding: horizontal10,
          child: Consumer<UserProfileProvider>(
              builder: (context, userprofileProvier, child) {
            return Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height *0.055,),
                userprofileProvier.userDetailsModel!.userDetails.profilePhoto ==
                        null
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/c1.jpeg'),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(userprofileProvier
                            .userDetailsModel!.userDetails.profilePhoto!),
                      ),
                height10,
                ButtonWidget(
                    text: 'Edit Photo',
                    onPressed: () async {
                      userprofileProvier.imagePicker();
                      //  userprofileProvier.editProfilePhoto();
                    },
                    height: 45,
                    width: 145),
                height15,
               
                TextformFeildWidget(
                  controller: userprofileProvier.namecontroller,
                  labelText: 'FirstName',
                ),
                height15,
                TextformFeildWidget(
                  controller: userprofileProvier.secondnamecontroller,
                  labelText: 'SecondName',
                ),
                height15,
                TextformFeildWidget(
                  controller: userprofileProvier.emailcontroller,
                  labelText: 'Email',
                ),
                height15,
                TextformFeildWidget(
                  controller: userprofileProvier.phoneNumbercontroller,
                  labelText: 'PhoneNumber',
                ),
                height20,
                ButtonWidget(
                    text: 'Submit',
                    onPressed: () async {
                      log('submit button click');
                      await userprofileProvier.editProfileDetails();
                      await userprofileProvier.editProfilePhoto();
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                    height: 45,
                    width: 145),
              ],
            );
          }),
        )),
      ),
    );
  }
}
