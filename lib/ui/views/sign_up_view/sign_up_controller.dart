import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class SignUpController extends BaseController {
  TextEditingController emailController = TextEditingController(
      // text: "test@gmail.com"

      );
  TextEditingController phoneController = TextEditingController(
      // text: "test@1234"
      );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController(
      // text: "test@1234"
      );

  TextEditingController lnameController = TextEditingController(
      // text: "test@1234"
      );

  TextEditingController ageController = TextEditingController(
      // text: "test@1234"
      );
}
