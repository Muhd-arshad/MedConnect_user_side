


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/schedule_apoinment.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import '../../../controller/fetch_doctor_details_controller.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../widgets/buttonwidget.dart';
import '../../widgets/customtextwidget.dart';

class CoroselSliderWidget extends StatelessWidget {
  const CoroselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final doctorDetailsProvider = context.read<DoctorDetailsProvider>();
    return SizedBox(
      //height: 200,
      width: 350,
      child: SizedBox(
        height: 230,
        child: CarouselSlider.builder(
            enableAutoSlider: true,
          unlimitedMode: true,
          autoSliderTransitionTime: const Duration(seconds: 2),
          itemCount: 4,
          slideBuilder: (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Card(
                    color: cwhite,
                    surfaceTintColor: cwhite,
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                                image: NetworkImage(doctorDetailsProvider
                                    .listDoctorModel!
                                    .doctors[index]
                                    .profilePhoto
                                    .toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                        height20,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                const TextWidget(
                                  text: 'Name :',
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                width10,
                                TextWidget(
                                  text: doctorDetailsProvider.listDoctorModel!
                                      .doctors[index].firstName,
                                  fontWeight: FontWeight.bold,
                                  size: 13,
                                ),
                              ],
                            ),
                            height10,
                            Row(
                              children: [
                                width10,
                                const TextWidget(
                                  text: 'Department :',
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                width10,
                                TextWidget(
                                  text: doctorDetailsProvider.listDoctorModel!
                                      .doctors[index].departmentName,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            height30,
                            // Provider.of<ScheduleApoinmentProvider>(context).isloading ==true ? const Center(child: CircularProgressIndicator(),):
                            ButtonWidget(
                                text: 'Book',
                                onPressed: () async {
                                log('book button clicked');
                                   await Provider.of<ScheduleApoinmentProvider>(context,listen: false).scheduleApoinmet(doctorDetailsProvider.listDoctorModel!.doctors[index].id!);
                                   // ignore: use_build_context_synchronously
                                  //  Provider.of<ScheduleApoinmentProvider>(context,listen: false).isloading =true;
                                   
                                  // ignore: use_build_context_synchronously
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ScreenBooking(
                                        doctorModel: doctorDetailsProvider
                                            .listDoctorModel!.doctors[index],
                                      ),
                                    ),
                                  );
                                 
                                },
                                height: 30,
                                width: 100)
                          ],
                        ),
                      ],
                    ),
                  ),
                  height10,
                ],
              ),
            );
          },
          slideIndicator: CircularSlideIndicator(
            indicatorRadius: 5,
          ),
        ),
      ),
    );
  }
}
