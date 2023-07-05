
import 'package:flutter/material.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final Function() ontap;
  const ListTileWidget({
    super.key,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
        title: TextWidget(
      text: title,
      fontWeight: FontWeight.bold,
      size: 20,
    
    ));
  }
}