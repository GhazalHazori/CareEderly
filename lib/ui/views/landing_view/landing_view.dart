import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gred_button_large.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/log_in_view.dart';
import 'package:flutter_templete/ui/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    screenHeight(20).ph,
                    Center(
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: screenWidth(3),
                        height: screenHeight(3),
                      ),
                    ),
                    CustomGred(
                      color: AppColors.mainBlueColorE,
                      text: 'Log in',
                      onTap: () {
                        Get.to(LogInView());
                      },
                    ),
                    screenHeight(30).ph,
                    Row(
                      children: [
                        Container(
                          width: screenWidth(2.2),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                        Text('   OR  '),
                        Container(
                          width: screenWidth(2.2),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    screenHeight(30).ph,
                    CustomGred(
                        color: AppColors.mainOrangeColorE,
                        text: 'sign Up',
                        onTap: () {
                          Get.to(SignUpView());
                        }),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
