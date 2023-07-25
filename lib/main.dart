import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/booking_details_get_controller.dart';
import 'package:user_side_flutter/controller/department_get_controller.dart';
import 'package:user_side_flutter/controller/filter_list_based_on_department.dart';
import 'package:user_side_flutter/controller/get_user_profile_controller.dart';
import 'package:user_side_flutter/controller/schedule_apoinment.dart';
import 'package:user_side_flutter/controller/user_chat_get_controller.dart';
import 'package:user_side_flutter/controller/user_login_contoller.dart';
import 'package:user_side_flutter/controller/user_signup_controller.dart';
import 'package:user_side_flutter/view/login_page/loginpage.dart';

import 'controller/fetch_doctor_details_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Usercontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserloginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduleApoinmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetbookingApoinmetnsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorListingBasedonDepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserChatProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
