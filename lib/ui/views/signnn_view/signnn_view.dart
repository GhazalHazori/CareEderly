import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/signn_view/signn_view.dart';
import 'package:flutter_templete/ui/views/signnn_view/signnn_controlller.dart';
import 'package:flutter_templete/ui/views/varification_code/varification_cod_view.dart';
import 'package:get/get.dart';

class SignnnUpView extends StatefulWidget {
  const SignnnUpView({super.key});

  @override
  State<SignnnUpView> createState() => _SignnnUpViewState();
}

class _SignnnUpViewState extends State<SignnnUpView> {
  SignnnUpController controller = Get.put(SignnnUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    controller.passwordController !=
                        controller.confirmpasswordController) {
                  return 'please check your confirm password';
                }
                return null;
              },
            ),
          ),
          screenHieght(20).ph,
          CustomButtonGer(
            onTap: () {
              Get.to(VerificationCodeView());
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
                    Get.to(SignnView());
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
