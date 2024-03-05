import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gred_button_large.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/login_view/log_in_controller.dart';
import 'package:flutter_templete/ui/views/sign_up_view/sign_up_view.dart';
import 'package:get/get.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  LoginController controller = Get.put(LoginController());

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
            'log in',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          screenHieght(20).ph,
          CustomTextFormField(
            hintText: 'Your Email',
            fillColor: AppColors.mainGrey,
            hintTextColor: AppColors.mainback,
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
            hintText: 'Your password',
            fillColor: AppColors.mainGrey,
            hintTextColor: AppColors.mainback,
            controller: controller.emailController,
            validator: (value) {
              if (value!.isEmpty || !isPassword(value)) {
                return 'please check your password';
              }
              return null;
            },
          ),
          screenHieght(20).ph,
          CustomGred(
            text: 'Login',
            color: AppColors.mainBlueColorE,
          ),
          screenHieght(20).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(13)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'You don\'t have any account ? ',
                  style: TextStyle(
                    color: AppColors.mainblack,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpView());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: AppColors.mainBlueColorE,
                        fontSize: 20,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
