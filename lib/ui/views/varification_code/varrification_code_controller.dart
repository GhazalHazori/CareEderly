import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/login_view/log_in_view.dart';
import 'package:get/get.dart';

class VarificationCodeController extends BaseController {
  String? email;
  VarificationCodeController({
    required this.email,
  });
  TextEditingController controller = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  OnChangedCode(String value) {
    if (value == controllerCode.text) {
      print("Verification successful");
    } else {
      print("Verification failed");
    }

    print(value);
  }

  void verfiy() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .verfiy(
            otpnum: controllerCode.text,
            email: email!,
          )
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: "succed",
                );
                Get.off(() => LogInView());
              },
            ),
          ),
    );
  }
}
