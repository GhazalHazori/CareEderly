import 'package:flutter_templete/core/data/models/diseases_model.dart';
import 'package:flutter_templete/core/data/reposotories/diseases_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

class BlocViewController extends BaseController {
  List<String> imageList = ['heart', 'Diabetes', 'Pressure'];
  List<String> nameList = [
    'Heart disease',
    'Diabetes',
    'Pressure sickness',
  ];
  @override
  void onInit() {
    getAllDisease();
    super.onInit();
  }

  RxList<DiseasesModel> disList = <DiseasesModel>[].obs;
  //  BlocViewController (ProductModel diseasemodel) {
  //   model = diseasemodel;
  // }
  // ProductModel model = ProductModel();
  Future<void> getAllDisease() async {
    runLoadingFutureFunction(
        operationType: OperationType.MEDICINE,
        function: DisRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            disList.value = r;
          });
        }));
  }
}
