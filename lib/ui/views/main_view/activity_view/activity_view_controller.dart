import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/activity_model.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/reposotories/activity_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class ActivityViewController extends BaseController {
  // List<CategoryModel> activityList = [
  //   CategoryModel(id: 1, details: "bbb", name: "aaa", repeat: "daily"),
  //   CategoryModel(id: 2, details: "bbb", name: "aaa", repeat: "weekly"),
  //   CategoryModel(id: 3, details: "bbb", name: "aaa", repeat: "weekly"),
  //   CategoryModel(id: 4, details: "bbb", name: "aaa", repeat: "per month"),
  // ];
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController nameEditmedicin = TextEditingController();
  TextEditingController detailsEditmedicin = TextEditingController();
  TextEditingController repateController = TextEditingController();
  TextEditingController repeatControllerEdit = TextEditingController();
  RxList<ActivityModel> activityList = <ActivityModel>[].obs;
  DateTime editselectedDate = DateTime.now();
  @override
  void onInit() async {
    getAllActivity();
    // MedicineRepository().getAll();
    super.onInit();
  }

  RxBool enable = false.obs;

  DateTime selectedDate = DateTime.now();
  void add() {
    runFullLoadingFutureFunction(
      function: ActivityRepository()
          .create(
            activityName: nameController.text,
            description: detailsController.text,
            endDate: selectedDate.toString(),
            id: storage.GetUser().sId!,
            EnableNotification: enable.value,
            repate: int.parse(repateController.text),
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
                // storage.setTokenInfo(r);
                CustomToast.showMessage(
                  messageType: MessageType.SUCCESS,
                  message: "Succed",
                );
                getAllActivity();
              },
            ),
          ),
    );
  }

  Future<void> getAllActivity() async {
    runLoadingFutureFunction(
        operationType: OperationType.ACTIVITY,
        function: ActivityRepository()
            .getAll(id: storage.GetUser().sId!)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);

            activityList.value = r;
          });
        }));
  }
}
