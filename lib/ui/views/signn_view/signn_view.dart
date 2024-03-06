import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/sign_up_view/sign_up_view.dart';
import 'package:flutter_templete/ui/views/signn_view/signn_controller.dart';
import 'package:flutter_templete/ui/views/signnn_view/signnn_view.dart';
import 'package:get/get.dart';

class SignnView extends StatefulWidget {
  const SignnView({super.key});

  @override
  State<SignnView> createState() => _SignnViewState();
}

class _SignnViewState extends State<SignnView> {
  SignnController controller = Get.put(SignnController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: screenWidth(3),
          height: screenHieght(3),
        ),
      ),
      Text(
        'Sign Up',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      screenHieght(30).ph,
      Text(
        'Choose the diseses you suffer from:',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      SizedBox(
        height: screenHieght(3),
        child: ListView.builder(
          itemCount: controller.disesesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Obx(
                () => Checkbox(
                  activeColor: AppColors.mainBlueColorE,
                  value: controller.selectedDiseases.contains(index),
                  onChanged: (bool? value) {
                    controller.selectDisease(index);
                  },
                ),
              ),
              title: Obx(
                () => Text(
                  controller.disesesList[index],
                  style: TextStyle(
                    color: controller.selectedDiseases.contains(index)
                        ? AppColors.mainBlueColorE
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      screenHieght(20).ph,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Row(
          children: [
            CustomButtonGer(
              hight: screenHieght(18),
              wight: screenWidth(3),
              text: 'Back',
              onTap: () {
                Get.to(SignUpView());
              },
            ),
            SizedBox(
              width: screenWidth(5),
            ),
            CustomButtonGer(
              hight: screenHieght(18),
              wight: screenWidth(3),
              text: 'Next',
              onTap: () {
                Get.to(SignnnUpView());
              },
            )
          ],
        ),
      )
    ]));
  }
}
