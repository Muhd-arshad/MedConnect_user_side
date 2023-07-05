import 'package:flutter/material.dart';
import '../../utils/constants/color.dart';
import 'customtextwidget.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double height;
  final double width;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: btcolor),
          onPressed: onPressed,
          child: TextWidget(
            colorText: cwhite,
            fontWeight: FontWeight.bold,
            size: 20,
            text: text,
          ),
        ),
      ),
    );
  }
}
