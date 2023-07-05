import 'package:flutter/material.dart';


import 'customtextwidget.dart';



class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title:  TextWidget(
        text: title,
        size: 30,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    );
  }
}