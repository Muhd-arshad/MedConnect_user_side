import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/doctor_message_service_post_controller.dart';
import 'package:user_side_flutter/controller/get_user_profile_controller.dart';
import 'package:user_side_flutter/controller/user_chat_get_controller.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/chat_page/message_screen/screen_message.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Chat'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'Messages',
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            height20,
            Expanded(
              child: Consumer<UserChatProvider>(
                  builder: (context, userChatProvider, child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: cBlack.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              spreadRadius: 0,
                              blurRadius: 5,
                            )
                          ],
                          color: cwhite,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        onTap: ()async { 
                          await Provider.of<GetDoctorMessageProvider>(context,listen: false).getMessage( userChatProvider
                                  .userChatModel!.chattableDoctors[index].id);
                                   // ignore: use_build_context_synchronously
                             Provider.of<GetDoctorMessageProvider>(context,listen: false).initSocketConnection(Provider.of<UserProfileProvider>(context,listen: false).userDetailsModel!.userDetails.id!);
                             
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScreenMessage(
                              chattableDoctor: userChatProvider
                                  .userChatModel!.chattableDoctors[index],
                            ),
                          ),
                        );
                          
                        },
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userChatProvider
                              .userChatModel!
                              .chattableDoctors[index]
                              .profilePhoto),
                        ),
                        title: TextWidget(
                          text:
                              'Dr.${userChatProvider.userChatModel!.chattableDoctors[index].firstName} ${userChatProvider.userChatModel!.chattableDoctors[index].lastName}',
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => height10,
                  itemCount:
                      userChatProvider.userChatModel!.chattableDoctors.length,
                );
              }),
            )
          ],
        ),
      )),
    );
  }
}
