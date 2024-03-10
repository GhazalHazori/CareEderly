import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/signn_view/signn_view.dart';
import 'package:flutter_templete/ui/views/signnn_view/signnn_controlller.dart';
import 'package:get/get.dart';

class SignnnUpView extends StatefulWidget {
  const SignnnUpView(
      {super.key,
      required this.email,
      required this.phone,
      required this.lname,
      required this.fname,
      required this.age,
      required this.diseses});
  final String email;
  final List<String> diseses;
  final String phone;
  final String lname;
  final String fname;
  final String age;
  @override
  State<SignnnUpView> createState() => _SignnnUpViewState();
}

class _SignnnUpViewState extends State<SignnnUpView> {
  late SignnnUpController controller;
  @override
  void initState() {
    controller = Get.put(SignnnUpController(
      email: widget.email,
      diseses: widget.diseses,
      phone: widget.phone,
      lname: widget.lname,
      fname: widget.fname,
      age: widget.age,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          screenHieght(20).ph,
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
          screenHieght(20).ph,
          Obx(
            () => CustomTextFormField(
              obscureText: !controller.passwordVisible2.value,
              suffixi: InkWell(
                onTap: () {
                  controller.hidePassword2(
                    password: controller.passwordVisible2,
                    value: controller.passwordVisible2.value,
                  );
                },
                child: controller.passwordVisible2.value
                    ? Icon(
                        Icons.visibility,
                        color: AppColors.mainBlueEpin,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.mainBlueEpin,
                      ),
              ),
              hintText: 'Your Password',
              fillColor: AppColors.mainGrey,
              hintTextColor: AppColors.mainBlueEpin,
              controller: controller.passwordController,
              validator: (value) {
                if (value!.isEmpty || !isPassword(value)) {
                  return 'please check your password';
                }
                return null;
              },
            ),
          ),
          screenHieght(20).ph,
          Obx(
            () => CustomTextFormField(
              obscureText: !controller.passwordVisible.value,
              suffixi: InkWell(
                onTap: () {
                  controller.hidePassword(
                    password: controller.passwordVisible,
                    value: controller.passwordVisible.value,
                  );
                },
                child: controller.passwordVisible.value
                    ? Icon(
                        Icons.visibility,
                        color: AppColors.mainBlueEpin,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.mainBlueEpin,
                      ),
              ),
              hintText: 'Confirm password',
              fillColor: AppColors.mainGrey,
              hintTextColor: AppColors.mainBlueEpin,
              controller: controller.confirmpasswordController,
              validator: (value) {
                if (value!.isEmpty ||
                    !isPassword(value) ||
                    controller.passwordController.text !=
                        controller.confirmpasswordController.text) {
                  return 'please check your confirm password';
                }
                return null;
              },
            ),
          ),
          screenHieght(20).ph,
          CustomButtonGer(
            onTap: () {
              controller.register();
              // Get.to(VerificationCodeView(
              //   email: widget.email,
              // ));
              // if (controller.formKey.currentState!.validate()) {
              //   Get.to(VerificationCodeView());
              // }
            },
            text: 'Create',
            wight: screenWidth(2),
            hight: screenHieght(18),
          ),
          screenHieght(20).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomButtonGer(
                  onTap: () {
                    Get.to(SignnView(
                      phnumber: widget.phone,
                      email: widget.email,
                      age: widget.age,
                      fname: widget.fname,
                      lname: widget.lname,
                      phone: widget.phone,
                    ));
                  },
                  text: 'back',
                  wight: screenWidth(3),
                  hight: screenHieght(18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
