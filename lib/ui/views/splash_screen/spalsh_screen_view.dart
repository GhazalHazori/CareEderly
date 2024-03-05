import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashSceenView extends StatefulWidget {
  const SplashSceenView({super.key});
  @override
  State<SplashSceenView> createState() => _SplashSceenViewState();
}

class _SplashSceenViewState extends State<SplashSceenView> {
  SplashSceenController controller = Get.put(SplashSceenController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        screenWidth(20).ph,
        Container(
          height: screenWidth(6),
          child: SpinKitThreeBounce(color: AppColors.mainBlueColorE),
        ),
      ],
    )));
  }
}
