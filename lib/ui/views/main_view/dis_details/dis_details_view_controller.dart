import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/diseases_model.dart';
import 'package:flutter_templete/core/data/reposotories/check_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class DisDetailsViewController extends BaseController {
  DisDetailsViewController(disModel) {
    model = disModel;
  }
  DiseasesModel model = DiseasesModel();
  TextEditingController controllerValue = TextEditingController();

  void checkdia({
    required String value,
    required String disId,
    required String tokenn,
  }) {
    runFullLoadingFutureFunction(
      function: CheckRepository()
          .checkDia(disId: disId, value: value, tokenn: tokenn)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                // storage.setTokenInfo(r);
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
              },
            ),
          ),
    );
  }

  void checkBre({
    required String value,
    required String disId,
    required String tokenn,
  }) {
    runFullLoadingFutureFunction(
      function: CheckRepository()
          .checkBre(disId: disId, value: value, tokenn: tokenn)
          .then(
            (value) => value.fold(
              (l) {
                CustomToast.showMessage(
                  messageType: MessageType.REJECTED,
                  message: l,
                );
              },
              (r) {
                // storage.setTokenInfo(r);
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: r,
                );
              },
            ),
          ),
    );
  }
}
