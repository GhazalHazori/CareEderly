import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class SignnnUpController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "test@1234");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
