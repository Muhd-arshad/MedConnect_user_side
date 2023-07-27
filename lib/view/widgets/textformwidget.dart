import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';

class TextformFeildWidget extends StatelessWidget {
  const TextformFeildWidget({
    super.key,
    required this.controller,
    this.labelText,
    this.padding = EdgeInsets.zero,
    this.type,
  });

  final TextEditingController controller;
  final String? labelText;
  final EdgeInsets padding;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: PhysicalModel(
        color: Colors.white,
        shadowColor: cBlack,
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "$labelText cannot be empty";
            }
            return null;
          },
          
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: type,
          controller: controller,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            fillColor: cwhite,
            filled: true,
            labelText: labelText,
            labelStyle: const TextStyle(color: cBlack),
            border: //  InputBorder.none,
                OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
          ),
        ),
      ),
    );
  }
}
