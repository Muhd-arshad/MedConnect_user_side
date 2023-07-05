import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/buttonwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';
import 'package:user_side_flutter/view/widgets/textformwidget.dart';
List<String> textlist= ['Name','Second Name','Phone Number','E-Mail','Password'];
class ScreenEditingProfile extends StatelessWidget {
  const ScreenEditingProfile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    return   Scaffold(
      appBar: const PreferredSize(preferredSize: Size.fromHeight(60), child: AppbarWidget(title: 'Chat')),
     body: SingleChildScrollView(
       child: PrimaryWidget(widget: Padding(
         padding: horizontal10,
         child: Column(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/c1.jpeg'),
            ),
            height10,
            ButtonWidget(text: 'Edit Photo', onPressed: (){}, height: 45, width: 145),
            height15,
            SizedBox(
              height: MediaQuery.of(context).size.height *0.48,
              child: ListView.separated(itemBuilder: (context, index) {
                return TextformFeildWidget(controller:namecontroller,labelText: textlist[index], );
              }, separatorBuilder: (context, index) => height10, itemCount: textlist.length),
            ),
             ButtonWidget(text: 'Submit', onPressed: (){}, height: 45, width: 145),
          ],
         ),
       )),
     ),
    );
  }
}