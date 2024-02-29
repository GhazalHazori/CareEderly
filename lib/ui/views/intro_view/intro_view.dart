import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/intro_view/intro_controller.dart';
import 'package:flutter_templete/ui/views/landing_view/landing_view.dart';
import 'package:get/get.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final IntroController controller = Get.put(IntroController());

  List<String> descriptionList = [
    "Welcome to our senior care application,\n providing healthcare and reminders for the elderly.",
    "Empower yourself in managing your health. Our senior care app provides medication alerts  \n and encourages participation in meaningful activities.",
    "Stay healthy and active with our senior care app.\n Get personalized medication reminders and \n  stay engaged in daily activities."
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(12)),
        child: Column(
          children: [
            (screenWidth(3)).ph,
            Obx(
              () => Image.asset(
                'assets/images/intro${controller.currentIndex}.png',
                width: screenWidth(1.6),
              ),
            ),
            20.ph,
            Obx(
              () => DotsIndicator(
                dotsCount: 3,
                position: controller.currentIndex.toInt(),
                decorator: DotsDecorator(
                    color: AppColors.mainGrey, activeColor: Colors.green),
              ),
            ),
            20.ph,
            Text(descriptionList[controller.currentIndex.value],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: AppColors.mainlightgrey)),
            50.ph,
            Obx(() => CustomButton(
                  text: controller.isLastIndex() ? 'Finish' : 'Next',
                  backgroundColor: Colors.green,
                  textColor: AppColors.mainWhiteColor,
                  borderColor: AppColors.mainOrangeColor,
                  onPressed: () {
                    if (!controller.isLastIndex()) {
                      controller.incrementIndex();
                    } else
                      Get.off(LandingView());
                  },
                )),
          ],
        ),
      )),
    );
  }
}
