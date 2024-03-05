import 'package:flutter_templete/core/data/models/diseses+model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class SignnController extends BaseController {
  List disesesList = ['Diabetes', 'Pressure sickness', 'Heart disease'];
  RxInt collegeId = 1.obs;
  RxInt selectedDiseases = 0.obs;
  RxList<DisesesModel> deiseaseList = <DisesesModel>[].obs;
  List<DisesesModel> collegeList = [
    DisesesModel(id: 1, name: ""),
    DisesesModel(id: 2, name: "second"),
    DisesesModel(id: 3, name: "third"),
  ];
  void selectDisease(int index) {
    selectedDiseases.value = index;
    update();
  }
}
