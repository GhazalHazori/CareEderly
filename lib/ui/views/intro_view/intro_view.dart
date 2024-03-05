import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/intro_view/intro_controller.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:flutter_templete/ui/views/splash_screen/spalsh_screen_view.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final IntroController controller = Get.put(IntroController());

  List<String> descriptionList = [
    "Welcome to our senior care \n application providing healthcare \n  and reminders for the elderly",
    "Empower yourself in managing \n your health. Our senior care app  \n provides medication alerts  and \n encourages participation in \n meaningful activities",
    "stay healthy and active with our \n senior care app. Get personalized \n medication reminders and stay \n engaged in daily activities"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          (screenWidth(5)).ph,
          Obx(
            () => DotsIndicator(
              dotsCount: 3,
              position: controller.currentIndex.value,
              decorator: DotsDecorator(
                  size: Size(25, 25),
                  activeSize: Size(25, 25),
                  color: AppColors.mainGrey,
                  activeColor: AppColors.mainBlueColorE),
            ),
          ),
          (screenWidth(8)).ph,
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(
                'assets/images/intro${controller.currentIndex}.png',
                width: double.infinity,
              ),
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Obx(() {
                if (controller.currentIndex.value == 0) {
                  return Container(
                    width: double.infinity,
                    height: 249,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.01),
                        end: Alignment(-1, 0.01),
                        colors: [Color(0xFF07A9B2), Color(0x0007A9B2)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(100)),
                      ),
                    ),
                  );
                } else if (controller.currentIndex.value == 1) {
                  return Container(
                    width: double.infinity,
                    height: 249,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.01),
                        end: Alignment(-1, 0.01),
                        colors: [Color(0xFF07A9B2), Color(0x0007A9B2)],
                      ),
                      shape: RoundedRectangleBorder(),
                    ),
                  );
                } else if (controller.currentIndex.value == 2) {
                  return Container(
                    width: double.infinity,
                    height: 249,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, -0.01),
                        end: Alignment(-1, 0.01),
                        colors: [Color(0xFF07A9B2), Color(0x0007A9B2)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(100)),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              Positioned(
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    60.ph,
                    Text(descriptionList[controller.currentIndex.value],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    40.ph,
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: controller.currentIndex != 0,
                              child: CustomButtonGer(
                                  hight: screenHieght(18),
                                  wight: screenWidth(3),
                                  text: 'Back',
                                  onTap: () {
                                    if (!controller.isLastIndex()) {
                                      controller.decrementIndex();
                                    } else
                                      Get.off(SplashSceenView());
                                  }),
                            ),
                            CustomButtonGer(
                                hight: screenHieght(18),
                                wight: screenWidth(3),
                                text: controller.isLastIndex()
                                    ? 'Finish'
                                    : 'Next',
                                onTap: () {
                                  if (!controller.isLastIndex()) {
                                    controller.incrementIndex();
                                  } else
                                    Get.off(LandingView());
                                }),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
