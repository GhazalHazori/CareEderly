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
  const VerificationCodeView({super.key});

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

class _VerificationCodeViewState extends State<VerificationCodeView> {
  VarificationCodeController controller = Get.put(VarificationCodeController());
  TextEditingController controllerCode = TextEditingController();
  @override
  void initState() {
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
                      text: 'your mobile',
                      textAlign: TextAlign.start,
                      textColor: AppColors.mainblack,
                    ),
                    screenHieght(50).ph,
                    CustomText(
                      text: 'Please check your mobile  09***009',
                      textAlign: TextAlign.center,
                      textColor: AppColors.secondaryGreyColor,
                      fontSize: 24,
                      bold: true,
                    ),

                    // OtpScreen(),
                    //StarTextField(),
                    screenHieght(20).ph,
                    PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      appContext: context,
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      //الرقم يتحول لنجمة
                      animationType: AnimationType.slide, //can change
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box, //can change
                        borderRadius: BorderRadius.circular(5),
                        selectedFillColor: AppColors.fillGreyColor,
                        inactiveFillColor: AppColors.fillGreyColor,
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
                      // backgroundColor: AppColors.textFieldColor,
                      enableActiveFill: true,
                      //errorAnimationController: errorController,
                      controller: controllerCode,
                      // بتتحسس لكل مدخلات عند لخر ادخال خدني ع واجهة اذا مافي زر
                      // onChanged: (value) {
                      //   print("complete");
                      // },
                      onChanged: controller.OnChangedCode,
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    screenHieght(50).ph,
                    CustomGred(
                      text: 'Next',
                      color: AppColors.mainBlueColorE,
                      onTap: () {
                        CustomToast.showMessage(
                            message: 'verification Done',
                            messageType: MessageType.SUCCESS);
                      },
                    ),
                    screenHieght(50).ph,
                  ],
                ),
              ),
            )));
  }
}
