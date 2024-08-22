import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/intro_view/intro_view.dart';
import 'package:flutter_templete/ui/views/main_view/home_view/home_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view.dart';
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

  void login() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .login(
            fcm: storage.getFcmToken(),
            email: emailController.text,
            password: passwordController.text,
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
                  message: "Succed",
                );
                storage.setTokenInfo(r);
                Get.to(MainView());
              },
            ),
          ),
    );
  }
}
