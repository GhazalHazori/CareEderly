import 'package:flutter_templete/core/data/models/diseses+model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class SignnController extends BaseController {
  List disesesList = ['Diabetes', 'Pressure sickness', 'Heart disease'];
  RxInt collegeId = 1.obs;
  RxList<int> selectedDiseases = <int>[].obs;
  RxList<DisesesModel> deiseaseList = <DisesesModel>[].obs;

  void selectDisease(int index) {
    if (selectedDiseases.contains(index)) {
      selectedDiseases.remove(index);
    } else {
      selectedDiseases.add(index);
    }
    update();
  }
}

//   void toggleDisease(int index) {
//     if (selectedDiseases.value.contains(index)) {
//       selectedDiseases.remove(index);
//     } else {
//       selectedDiseases.add(index);
//     }
//     update();

// }
  // List<DisesesModel> collegeList = [
  //   DisesesModel(id: 1, name: "Diabetes"),
  //   DisesesModel(id: 2, name: "Presure"),
  //   DisesesModel(id: 3, name: "Heart"),
  // ];