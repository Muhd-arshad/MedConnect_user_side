import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/loading_controller.dart';
import 'package:user_side_flutter/utils/constants/color.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingModel = Provider.of<LoadingController>(context);

    return loadingModel.isLoading
        ? Container(
          color: cwhite.withOpacity(0.5),
              child:const Center(child: CircularProgressIndicator()),
          
          )
        : Container(); 
  }
}