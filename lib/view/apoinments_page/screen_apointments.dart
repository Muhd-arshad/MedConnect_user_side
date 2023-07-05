import 'package:flutter/material.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/apoinments_page/widgets/apointcard_widget.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';

class ScreenApointments extends StatelessWidget {
  const ScreenApointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppbarWidget(title: 'Apointments'),
      ),
      body: PrimaryWidget(
          widget: Padding(
        padding: horizontal10,
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => const ApointmentCardwidget(),
                  separatorBuilder: (context, index) => height10,
                  itemCount: 10),
            ),
          ],
        ),
      )),
    );
  }
}

