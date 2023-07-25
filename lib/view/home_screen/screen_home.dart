import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/department_get_controller.dart';
import 'package:user_side_flutter/controller/fetch_doctor_details_controller.dart';
import 'package:user_side_flutter/controller/filter_list_based_on_department.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/alldoctors_page/screen_alldoctor.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import 'package:user_side_flutter/view/department_page/screen_departments_page.dart';
import 'package:user_side_flutter/view/department_sub_screen/department_sub.dart';
import 'package:user_side_flutter/view/home_screen/widgets/corosal_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

import '../../controller/schedule_apoinment.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final listDocbasedonDpt =context.read<DoctorListingBasedonDepartmentProvider>();
    GlobalKey<ScaffoldState> drawerkey = GlobalKey();
    return Scaffold(
      drawer: const DrawerWidget(),
      key: drawerkey,
      // drawer: const DrawerWidget(),
      body: PrimaryWidget(
        widget: SafeArea(
          child: Padding(
            padding: horizontal10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        drawerkey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    width10,
                    const TextWidget(
                      text: 'Popular Doctors',
                      size: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                height20,
                const CoroselSliderWidget(),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      text: 'Departments',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    InkWell(
                      onTap: () async{
                  
                       await Provider.of<DepartmentProvider>(context,listen: false).getDepartment();
                       
                        
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenCategory(),
                          ),
                        );
                         
                      },
                      child: const TextWidget(
                        text: 'See All',
                        fontWeight: FontWeight.bold,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                height20,
                SizedBox(
                  height: 100,
                  child: Consumer<DepartmentProvider>(
                   
                    builder: (context, dptProvider,child) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async{
                                listDocbasedonDpt.setSelectedDepartmentIndex(index);
                                listDocbasedonDpt.getDoctorsForSelectedDepartment(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ScreenDepartmentSub(),
                                  ),
                                );
                                 
                              },
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: cwhite,
                                ),
                                child: Center(
                                    child: TextWidget(
                                  text: dptProvider.departmentmodel!.departments[index].departmentName,
                                  size: 18,
                                  colorText: btcolor,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => width10,
                          itemCount: dptProvider.departmentmodel!.departments.length);
                    }
                  ),
                ),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      text:  'All Doctors',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    InkWell(
                      onTap: () async{
                         
                         await Provider.of<DoctorDetailsProvider>(context,listen: false).fechDoctorDetails();

                         // ignore: use_build_context_synchronously
                       
                       
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenAllDoctor(),
                          ),
                        );
                       
                      },
                     
                      child: const TextWidget(
                        text: 'See All',
                        fontWeight: FontWeight.bold,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                height20,
                SizedBox(
                  height: 150,
                  child: Consumer<DoctorDetailsProvider>(
                    
                    builder: (context, doctorDetailsProvider,child) {
                      return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                 Provider.of<ScheduleApoinmentProvider>(context,listen: false).scheduleApoinmet(doctorDetailsProvider.listDoctorModel!.doctors[index].idNumber!.toString());
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  ScreenBooking(doctorModel: doctorDetailsProvider.listDoctorModel!.doctors[index],),
                                ),
                              );
                              } ,
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: cwhite,
                                ),
                                child:  Column(
                                  children: [
                                    height10,
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          NetworkImage(doctorDetailsProvider.listDoctorModel!.doctors[index].profilePhoto!),
                                    ),
                                    height10,
                                    TextWidget(
                                      text: doctorDetailsProvider.listDoctorModel!.doctors[index].firstName,
                                      size: 15,
                                    ),
                                    TextWidget(
                                      text: doctorDetailsProvider.listDoctorModel!.doctors[index].departmentName,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => width10,
                          itemCount: doctorDetailsProvider.listDoctorModel!.doctors.length);
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
