import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:get/get.dart';

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}

void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
          decoration: BoxDecoration(
              color: AppColors.mainback.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          width: screenWidth(4),
          height: screenHieght(4),
          child: SpinKitCircle());
    });
bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isPassword(String value) {
  RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

bool isVaildMobileNo(String value) {
  RegExp regExp = new RegExp(r'^\+?09[0-9]{8}$');
  return regExp.hasMatch(value);
}

bool isVaildName(String value) {
  RegExp regExp = new RegExp(r"^[a-zA-Z]+(([\'\-\s][a-zA-Z])?[a-zA-Z]*)*$");
  return regExp.hasMatch(value);
}
