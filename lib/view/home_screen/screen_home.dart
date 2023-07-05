import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/alldoctors_page/screen_alldoctor.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import 'package:user_side_flutter/view/department_page/screen_departments_page.dart';
import 'package:user_side_flutter/view/home_screen/widgets/corosal_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/drawerwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

List dept = ['Child Care', 'Dentist', 'Ortho', 'Homeo'];

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
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
                      onTap: () {
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
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenAllDoctor(),
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
                              text: dept[index],
                              size: 18,
                              colorText: btcolor,
                              fontWeight: FontWeight.bold,
                            )),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => width10,
                      itemCount: dept.length),
                ),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                      text: 'All Doctors',
                      fontWeight: FontWeight.bold,
                      size: 20,
                    ),
                    InkWell(
                      onTap: () {
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
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenBooking(),
                            ),
                          ),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: cwhite,
                            ),
                            child: const Column(
                              children: [
                                height10,
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/3774299.png'),
                                ),
                                height10,
                                TextWidget(
                                  text: 'Dr.Anu',
                                  size: 15,
                                ),
                                TextWidget(
                                  text: 'ortho',
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => width10,
                      itemCount: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
