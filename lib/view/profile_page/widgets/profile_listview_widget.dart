import 'package:flutter/material.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';

import '../../../utils/constants/color.dart';

class ListviewForProfileWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Function()? ontap;
  

  const ListviewForProfileWidget({
    super.key, required this.title, required this.icon, this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         boxShadow: [BoxShadow(color: cBlack.withOpacity(0.3),offset: const Offset(0, 2),spreadRadius: 0,blurRadius: 5,)],
        borderRadius: BorderRadius.circular(20),color: cwhite),
      child: ListTile(
        onTap: ontap,
        leading: icon,
        title: TextWidget(text: title,size: 18,fontWeight: FontWeight.bold,),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}