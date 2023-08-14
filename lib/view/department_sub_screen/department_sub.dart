import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/fetch_doctor_details_controller.dart';
import 'package:user_side_flutter/controller/filter_list_based_on_department.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

import '../../controller/schedule_apoinment.dart';

class ScreenDepartmentSub extends StatelessWidget {
  const ScreenDepartmentSub({super.key});

  @override
  Widget build(BuildContext context) {
    log('widget tree build');
    return Consumer<DoctorListingBasedonDepartmentProvider>(
        builder: (context, doctorListprovider, child) {
      List<dynamic> list = [];
      list.clear();
      list.addAll(doctorListprovider.getDoctorsForSelectedDepartment(context));
      // doctorListprovider.getDoctorsForSelectedDepartment(context);

      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppbarWidget(title: 'Doctor '),
        ),
        body: list.isEmpty
            ? const Center(
                child: TextWidget(
                  text: 'No Doctors Found',
                  fontWeight: FontWeight.bold,
                  size: 20,
                ),
              )
            : PrimaryWidget(
                widget: Column(
                  children: [
                    height20,
                    Expanded(
                      child: ListView.separated(
                        padding: horizontal10,
                        itemBuilder: (context, index) {
                          Provider.of<DoctorDetailsProvider>(context)
                              .listDoctorModel!
                              .doctors[index] = list[index];

                          return Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cwhite,
                                boxShadow: [
                                  BoxShadow(
                                    color: cBlack.withOpacity(0.3),
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                  )
                                ]),
                            child: ListTile(
                              onTap: () async {
                                log('index === $index');
                                await Provider.of<ScheduleApoinmentProvider>(
                                        context,
                                        listen: false)
                                    .scheduleApoinmet(
                                  doctorListprovider.listdoc[index].id!,
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenBooking(
                                      doctorModel:
                                          doctorListprovider.listdoc[index],
                                    ),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  Provider.of<DoctorDetailsProvider>(context)
                                      .listDoctorModel!
                                      .doctors[index]
                                      .profilePhoto!,
                                ),
                              ),
                              title: TextWidget(
                                text:
                                    '${doctorListprovider.listdoc[index].firstName} ${doctorListprovider.listdoc[index].lastName}',
                                size: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => height10,
                        itemCount: list.length,
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
