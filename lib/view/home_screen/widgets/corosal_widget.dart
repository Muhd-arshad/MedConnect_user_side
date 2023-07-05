import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:user_side_flutter/utils/constants/color.dart';
import 'package:user_side_flutter/view/book_doctor/screen_book_doctor.dart';
import '../../../utils/constants/sizedbox.dart';
import '../../widgets/buttonwidget.dart';
import '../../widgets/customtextwidget.dart';

class CoroselSliderWidget extends StatelessWidget {
  const CoroselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/c1.jpeg',
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        height20,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              children: [
                                TextWidget(
                                  text: 'Name :',
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                width10,
                                TextWidget(
                                  text: 'Dr.Ramees',
                                  fontWeight: FontWeight.bold,
                                  size: 13,
                                ),
                              ],
                            ),
                            height10,
                            const Row(
                              children: [
                                width10,
                                TextWidget(
                                  text: 'Department :',
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                width10,
                                TextWidget(
                                  text: 'Child Care',
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            height30,
                            ButtonWidget(
                                text: 'Book',
                                onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenBooking(),),);
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