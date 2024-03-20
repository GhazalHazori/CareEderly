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
  const SignnView({
    super.key,
    required this.email,
    required this.phone,
    required this.lname,
    required this.fname,
    required this.age,
    required this.phnumber,
  });
  final String email;
  final String phone;
  final String lname;
  final String phnumber;
  final String fname;
  final String age;

  @override
  State<SignnView> createState() => _SignnViewState();
}

class _SignnViewState extends State<SignnView> {
  late SignnController controller;

  @override
  void initState() {
    controller = Get.put(SignnController(
      email: widget.email,
      phone: widget.phone,
      lname: widget.lname,
      fname: widget.fname,
      age: widget.age,
    ));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: screenWidth(3),
          height: screenHeight(3),
        ),
      ),
      Text(
        'Sign Up',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      screenHeight(30).ph,
      Text(
        'Choose the diseses you suffer from:',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      SizedBox(
        height: screenHeight(3),
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
                  controller.disesesList[index].toString(),
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
      screenHeight(20).ph,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Row(
          children: [
            CustomButtonGer(
              hight: screenHeight(18),
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
              hight: screenHeight(18),
              wight: screenWidth(3),
              text: 'Next',
              onTap: () {
                Get.to(SignnnUpView(
                  diseses: controller.selectedDiseasesValues,
                  email: widget.email,
                  age: widget.age,
                  fname: widget.fname,
                  lname: widget.lname,
                  phone: widget.phone,
                ));
              },
            )
          ],
        ),
      )
    ]));
  }
}
