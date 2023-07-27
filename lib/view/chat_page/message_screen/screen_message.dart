import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/doctor_message_service_post_controller.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

import '../../../model/user_chat_model.dart';

class ScreenMessage extends StatelessWidget {
  const ScreenMessage({
    super.key,
    required this.chattableDoctor,
  });
  final ChattableDoctor chattableDoctor;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Provider.of<GetDoctorMessageProvider>(context, listen: false)
          .scrollToBottom(),
    );
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        //  elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(chattableDoctor.profilePhoto),
          ),
        ),
        title: TextWidget(
          text: '${chattableDoctor.firstName} ${chattableDoctor.lastName}',
          size: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: PrimaryWidget(
        widget: Consumer<GetDoctorMessageProvider>(
          builder: (context, getDoctorProvider, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  height10,
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: ListView.separated(
                      controller: getDoctorProvider.scrollController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: horizontal10,
                            child: Align(
                              alignment: getDoctorProvider
                                          .doctorMessageList![index].fromSelf ==
                                      true
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (getDoctorProvider
                                              .doctorMessageList![index]
                                              .fromSelf ==
                                          true
                                      ? Colors.grey.shade200
                                      : bgcolor),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    getDoctorProvider
                                        .doctorMessageList![index].message,
                                    style: const TextStyle(fontSize: 15),
                                    textAlign: getDoctorProvider
                                                .doctorMessageList![index]
                                                .fromSelf ==
                                            true
                                        ? TextAlign.end
                                        : TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => height15,
                        itemCount: getDoctorProvider.doctorMessageList!.length),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhysicalModel(
                          borderRadius: BorderRadius.circular(20),
                          color: cwhite,
                          elevation: 4,
                          shadowColor: cBlack,
                          child: TextField(
                            controller: getDoctorProvider.msgController,
                            decoration: InputDecoration(
                              hintText: 'Type Messages',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none),
                              fillColor: cwhite,
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  await getDoctorProvider
                                      .sendMsg(chattableDoctor.id);
                                  await getDoctorProvider
                                      .getMessage(chattableDoctor.id);
                                  //ignore: use_build_context_synchronously
                                  getDoctorProvider.sendMessage(
                                      chattableDoctor.id,
                                      getDoctorProvider.msgController.text);
                                  getDoctorProvider.messageClear();
                                },
                                icon: const Icon(Icons.send),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
