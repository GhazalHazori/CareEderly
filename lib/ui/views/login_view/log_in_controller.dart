import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController(
      // text: "test@gmail.com"
      );
  TextEditingController passwordController = TextEditingController(
      // text: "test@1234"
      );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool passwordVisible = false.obs;

  void hidePassword({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }
}
