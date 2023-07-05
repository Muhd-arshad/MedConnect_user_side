
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  // final TextStyle? style;
  final FontWeight? fontWeight;
  final double? size;
 final Color? colorText;
 final TextOverflow? overflow;

 

  const TextWidget({
    super.key, this.text, this.fontWeight, this.size, this.colorText, this.overflow, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        overflow:overflow ,
          fontSize: size,
          fontWeight: fontWeight,
          color: colorText),
    );
  }
}