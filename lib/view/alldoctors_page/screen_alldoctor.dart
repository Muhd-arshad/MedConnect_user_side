import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/fetch_doctor_details_controller.dart';
import 'package:user_side_flutter/controller/schedule_apoinment.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/primarywidget.dart';

class ScreenAllDoctor extends StatelessWidget {
  const ScreenAllDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'All Doctors'),
      ),
      body: PrimaryWidget(
        widget: Consumer<DoctorDetailsProvider>(
            builder: (context, doctorDtailsProvider, child) {
          return ListView.separated(
              padding: horizontal10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                      blurRadius: 5,
                    )
                  ], borderRadius: BorderRadius.circular(10), color: cwhite),
                  child: ListTile(
                    onTap: () async{
                     await Provider.of<ScheduleApoinmentProvider>(context,listen: false).scheduleApoinmet(doctorDtailsProvider.listDoctorModel!.doctors[index].id!);

                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(

                          builder: (context) => ScreenBooking(
                           
                            doctorModel: doctorDtailsProvider
                                .listDoctorModel!.doctors[index],
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(doctorDtailsProvider
                          .listDoctorModel!.doctors[index].profilePhoto!),
                    ),
                    title: TextWidget(
                      text: doctorDtailsProvider
                          .listDoctorModel!.doctors[index].firstName,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: TextWidget(
                      text: doctorDtailsProvider
                          .listDoctorModel!.doctors[index].departmentName,
                      colorText: Colors.grey,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => height10,
              itemCount: doctorDtailsProvider.listDoctorModel!.doctors.length);
        }),
      ),
    );
  }
}
