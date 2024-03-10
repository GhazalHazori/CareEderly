import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/varification_code/varification_cod_view.dart';
import 'package:get/get.dart';

class SignnnUpController extends BaseController {
  String? email;
  List<String>? diseses;

  String? phone;
  String? lname;
  String? fname;
  String? age;
  SignnnUpController({
    required this.email,
    required this.diseses,
    required this.phone,
    required this.lname,
    required this.fname,
    required this.age,
  });
  TextEditingController passwordController = TextEditingController();
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

  void register() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .register(
            phnumber: phone!,
            diseses: diseses!,
            email: email!,
            firstname: fname!,
            lastname: lname!,
            age: int.parse(age!),
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
                  message: "succed",
                );
                Get.off(() => VerificationCodeView(
                      email: email!,
                    ));
              },
            ),
          ),
    );
  }
}
