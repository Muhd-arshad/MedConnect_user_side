import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';

import '../../view/widgets/customtextwidget.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      
      backgroundColor: cBlack.withOpacity(0.5),
      content: Center(
        child: TextWidget(
          text: text,
          size: 18,
          colorText: cwhite,
        ),
      ),
    ),
  );
}
