import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/sign_up_view/sign_up_controller.dart';
import 'package:flutter_templete/ui/views/signn_view/signn_view.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Form(
          key: controller.formKey,
          child: Column(
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
              CustomTextFormField(
                suffixi: Icon(
                  Icons.email_outlined,
                  color: AppColors.mainBlueEpin,
                ),
                hintText: 'Your Email',
                fillColor: AppColors.mainGrey,
                hintTextColor: AppColors.mainBlueEpin,
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty || !isEmail(value)) {
                    return 'please check your email';
                  }
                  return null;
                },
              ),
              screenHieght(20).ph,
              CustomTextFormField(
                suffixi: Icon(
                  Icons.phone,
                  color: AppColors.mainBlueEpin,
                ),
                hintText: 'Your Phone',
                fillColor: AppColors.mainGrey,
                hintTextColor: AppColors.mainBlueEpin,
                controller: controller.phoneController,
                validator: (value) {
                  if (value!.isEmpty || !isVaildMobileNo(value)) {
                    return 'please check your MobilePhone';
                  }
                  return null;
                },
              ),
              screenHieght(20).ph,
              Row(
                children: [
                  CustomTextFormField(
                    maxWidth: screenWidth(2.5),
                    hintText: 'first name',
                    fillColor: AppColors.mainGrey,
                    hintTextColor: AppColors.mainBlueEpin,
                    controller: controller.fnameController,
                    validator: (value) {
                      if (value!.isEmpty || !isVaildName(value)) {
                        return 'please check your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    width: screenWidth(10),
                  ),
                  CustomTextFormField(
                    maxWidth: screenWidth(2.5),
                    hintText: 'second name',
                    fillColor: AppColors.mainGrey,
                    hintTextColor: AppColors.mainBlueEpin,
                    controller: controller.lnameController,
                    validator: (value) {
                      if (value!.isEmpty || !isVaildName(value)) {
                        return 'please check your second name';
                      }
                      return null;
                    },
                  ),
                  screenHieght(20).ph,
                ],
              ),
              screenHieght(20).ph,
              Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomTextFormField(
                  maxWidth: screenWidth(2.5),
                  hintText: 'age',
                  fillColor: AppColors.mainGrey,
                  hintTextColor: AppColors.mainBlueEpin,
                  controller: controller.ageController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please check your age';
                    }
                    return null;
                  },
                ),
              ),
              screenHieght(20).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButtonGer(
                    hight: screenHieght(18),
                    wight: screenWidth(3),
                    text: 'Next',
                    onTap: () {
                      if (controller.formKey.currentState!.validate()) {
                        // // SharedPrefrenceRepostory().setLoginInfo([
                        // //   controller.emailController.text,
                        // //   controller.phoneController.text,
                        // //   controller.ageController.text,
                        // //   controller.fnameController.text,
                        // //   controller.lnameController.text
                        // // ]);
                        // controller.userEmailList
                        //     .add(controller.emailController.text);
                        // SharedPrefrenceRepostory()
                        //     .setLoginInfo(controller.userEmailList);
                        Get.to(SignnView(
                          phnumber: controller.phoneController.text,
                          email: controller.emailController.text,
                          age: controller.ageController.text,
                          fname: controller.fnameController.text,
                          phone: controller.phoneController.text,
                          lname: controller.lnameController.text,
                        ));
                      } else {
                        CustomToast.showMessage(
                            message: 'User is not valid',
                            messageType: MessageType.WARNING);
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
