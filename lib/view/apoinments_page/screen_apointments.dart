import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:user_side_flutter/controller/booking_details_get_controller.dart';
import 'package:user_side_flutter/services/cancel_apoinment_patch.dart';
import 'package:user_side_flutter/utils/constants/padding.dart';
import 'package:user_side_flutter/utils/constants/sizedbox.dart';
import 'package:user_side_flutter/view/apoinments_page/widgets/apointcard_widget.dart';
import 'package:user_side_flutter/view/profile_page/screen_profile.dart';
import 'package:user_side_flutter/view/widgets/appbar_widget.dart';
import 'package:user_side_flutter/view/widgets/customtextwidget.dart';
import 'package:user_side_flutter/view/widgets/primarywidget.dart';
import '../../controller/get_user_profile_controller.dart';
import '../../controller/loading_controller.dart';

class ScreenApointments extends StatelessWidget {
  const ScreenApointments({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingProvider = Provider.of<LoadingController>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<GetbookingApoinmetnsProvider>(context, listen: false)
            .getApoiments();
      },
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenProfile(),
              ),
              (route) => false);
          return false;
        },
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppbarWidget(title: 'Appointments'),
          ),
          body: PrimaryWidget(
              widget: Padding(
            padding: horizontal10,
            child: Column(
              children: [
                height10,
                Expanded(
                  child: Consumer<GetbookingApoinmetnsProvider>(
                    builder: (context, getbookingprovider, child) {
                      return getbookingprovider
                              .bookingDetailsModel!.appointments.isEmpty
                          ? const Center(
                              child: TextWidget(
                                text: 'No Appointments Available',
                                fontWeight: FontWeight.bold,
                                size: 20,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                return ApointmentCardwidget(
                                  date: DateFormat('dd/MM/yy').format(
                                    getbookingprovider.bookingDetailsModel!
                                        .appointments[index].date
                                        .add(
                                      const Duration(days: 1),
                                    ),
                                  ),
                                  time: getbookingprovider.bookingDetailsModel!
                                      .appointments[index].time,
                                  name: getbookingprovider.bookingDetailsModel!
                                      .appointments[index].doctorId.firstName,
                                  ontap: () {
                                  
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: const TextWidget(
                                            text:
                                                'Are you want to cancel appointmet',fontWeight: FontWeight.bold,
                                          ),
                                          actions: [
                                            loadingProvider.loading == true ?const Center(child: CircularProgressIndicator(),):
                                            TextButton(
                                              onPressed: () async {
                                                loadingProvider.loading = true;
                                                await cancelApointment(
                                                  getbookingprovider
                                                      .bookingDetailsModel!
                                                      .appointments[index]
                                                      .id,
                                                );
                                                // ignore: use_build_context_synchronously
                                                 await Provider.of<
                                                            UserProfileProvider>(
                                                        context,
                                                        listen: false)
                                                    .getProfile();
                                                loadingProvider.loading =false;
                                                // ignore: use_build_context_synchronously
                                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const ScreenProfile(),),);
                                                
                                               
                                              },
                                              child: const TextWidget(
                                                text: 'Yes',
                                                colorText: Colors.red,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const TextWidget(
                                                text: 'No',
                                                colorText: Colors.green,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    // ignore: use_build_context_synchronously
                                  },
                                );
                              },
                              separatorBuilder: (context, index) => height10,
                              itemCount: getbookingprovider
                                  .bookingDetailsModel!.appointments.length,
                            );
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
