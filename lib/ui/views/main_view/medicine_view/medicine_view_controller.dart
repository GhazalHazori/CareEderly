import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/category_model.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/reposotories/medicine_repository.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicinViewController extends BaseController {
  // List<CategoryModel> medicinList = [
  //   CategoryModel(id: 1, details: "bbb", name: "aaa", repeat: "daily"),
  //   CategoryModel(id: 2, details: "bbb", name: "aaa", repeat: "weekly"),
  //   CategoryModel(id: 3, details: "bbb", name: "aaa", repeat: "weekly"),
  //   CategoryModel(id: 4, details: "bbb", name: "aaa", repeat: "per month"),
  // ];
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController nameEditmedicin = TextEditingController();
  TextEditingController detailsEditmedicin = TextEditingController();
  RxString firstname = "".obs;
  RxString phone = "".obs;
  RxString lastname = "".obs;
  RxString email = "".obs;
  RxString id = "".obs;

  @override
  void onInit() async {
    getInfo();
    getAllMedicine();
    // MedicineRepository().getAll();
    super.onInit();
  }

  DateTime selectedDate = DateTime.now();
  DateTime editselectedDate = DateTime.now();
  bool get isProductLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.MEDICINE;
  RxList<MedicineModel> medicineList = <MedicineModel>[].obs;

  RxBool enable = false.obs;

  void add() {
    runFullLoadingFutureFunction(
      function: UserRepository()
          .create(
            medicinName: nameController.text,
            description: detailsController.text,
            endDate: selectedDate.toString(),
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
                getAllMedicine();
              },
            ),
          ),
    );
  }

  // void change() {
  //   runFullLoadingFutureFunction(
  //     function: UserRepository()
  //         .update(
  //             medicinName: nameEditmedicin.text,
  //             startDate: selectedDate.toString(),
  //             id: id)
  //         .then(
  //           (value) => value.fold(
  //             (l) {
  //               CustomToast.showMessage(
  //                 messageType: MessageType.REJECTED,
  //                 message: l,
  //               );
  //             },
  //             (r) {
  //               // storage.setTokenInfo(r);
  //               CustomToast.showMessage(
  //                 messageType: MessageType.SUCCESS,
  //                 message: "Succed",
  //               );
  //             },
  //           ),
  //         ),
  //   );
  // }
  Future<void> getAllMedicine() async {
    runLoadingFutureFunction(
        operationType: OperationType.MEDICINE,
        function: MedicineRepository()
            .getAll(id: storage.GetUser().sId!)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            medicineList.value = r;
          });
        }));
  }

  void getInfo() {
    firstname.value = storage.GetUser().firstname!;
    phone.value = storage.GetUser().phnumber!;
    lastname.value = storage.GetUser().lastname!;
    email.value = storage.GetUser().email!;
    id.value = storage.GetUser().sId!;
  }
}
