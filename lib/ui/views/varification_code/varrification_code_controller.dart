import 'package:flutter/material.dart';
import 'package:flutter_templete/core/services/base_controller.dart';

class VarificationCodeController extends BaseController {
  TextEditingController controller = TextEditingController();
  OnChangedCode(String value) {
    print(value);
  }
}
