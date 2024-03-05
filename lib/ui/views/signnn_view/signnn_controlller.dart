import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class SignnnUpController extends BaseController {
  TextEditingController passwordController = TextEditingController(
      // text: "test@1234"
      );
  TextEditingController confirmpasswordController = TextEditingController(
      // text: "test@1234"
      );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool passwordVisible = false.obs;
  RxBool passwordVisible2 = false.obs;

  void hidePassword({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

  void hidePassword2({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }
}
