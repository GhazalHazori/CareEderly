import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_gred_button_large.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/varification_code/varrification_code_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({super.key, required this.email});
  final String email;

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  late VarificationCodeController controller;

  TextEditingController controllerCode = TextEditingController();

  @override
  void initState() {
    controller = Get.put(VarificationCodeController(
      email: widget.email,
    ));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: screenHieght(16)),
                child: Column(
                  children: [
                    CustomText(
                      fontSize: 40,
                      text: 'We sent an OTP to',
                      textAlign: TextAlign.start,
                      textColor: AppColors.mainblack,
                    ),
                    screenHieght(50).ph,
                    CustomText(
                      fontSize: 30,
                      text: 'your email',
                      textAlign: TextAlign.start,
                      textColor: AppColors.mainblack,
                    ),
                    screenHieght(50).ph,
                    CustomText(
                      text: 'Please check your email  *****.com',
                      textAlign: TextAlign.center,
                      textColor: AppColors.secondaryGreyColor,
                      fontSize: 24,
                      bold: true,
                    ),
                    screenHieght(20).ph,
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      appContext: context,
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      animationType: AnimationType.slide,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        selectedFillColor: AppColors.mainBlueEpin,
                        inactiveFillColor: AppColors.mainBlueEpin,
                        fieldHeight: screenWidth(5),
                        fieldWidth: screenWidth(5),
                        activeFillColor: AppColors.fillGreyColor,
                        activeColor: AppColors.fillGreyColor,
                        inactiveColor: AppColors.fillGreyColor,
                        selectedColor: AppColors.fillGreyColor,
                        borderWidth: screenWidth(40),
                      ),
                      cursorColor: AppColors.fillGreyColor,
                      hintCharacter: '*',
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: controller.controllerCode,
                      onChanged: controller.OnChangedCode,
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");

                        return true;
                      },
                    ),
                    screenHieght(50).ph,
                    CustomGred(
                      text: 'Next',
                      color: AppColors.mainBlueColorE,
                      onTap: () {
                        controller.verfiy();
                      },
                    ),
                    screenHieght(50).ph,
                  ],
                ),
              ),
            )));
  }
}
