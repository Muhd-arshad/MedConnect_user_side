
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/department_get_controller.dart';
import 'package:user_side_flutter/controller/filter_list_based_on_department.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/department_sub_screen/department_sub.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

import '../../controller/fetch_doctor_details_controller.dart';
class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
   Provider.of<DoctorDetailsProvider>(context,listen: false).fechDoctorDetails();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppbarWidget(title: 'Departments'),
      ),
      body: PrimaryWidget(
        widget: Consumer<DepartmentProvider>(
          builder: (context,dptProvider,child) {
            return ListView.separated(
              padding: horizontal10,
              itemBuilder: (context, index) {
              return Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                   boxShadow: [BoxShadow(color: cBlack.withOpacity(0.3),offset: const Offset(0, 2),spreadRadius: 0,blurRadius: 5,)],
                  color: cwhite,borderRadius: BorderRadius.circular(10),),
                child:ListTile(
                onTap: (){
                  Provider.of<DoctorListingBasedonDepartmentProvider>(context,listen: false).setSelectedDepartmentIndex(index );
                 
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>const  ScreenDepartmentSub(),),);
                },
                  title: TextWidget(text: dptProvider.departmentmodel!.departments[index].departmentName,size: 18,fontWeight: FontWeight.bold),
                ),
              );
            }, 
            separatorBuilder: (context, index) => height20, itemCount: dptProvider.departmentmodel!.departments.length);
          }
        ),
      ),
    );
  }
}
