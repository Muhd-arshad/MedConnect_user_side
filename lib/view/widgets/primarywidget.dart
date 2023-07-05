import 'package:flutter/material.dart';

class PrimaryWidget extends StatelessWidget {
  final Widget widget;
  const PrimaryWidget({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          
       
          Colors.white,
         Colors.white,
        ], end: Alignment.centerRight, begin: Alignment.topRight),
      ),
      child: widget,
    );
  }
}
