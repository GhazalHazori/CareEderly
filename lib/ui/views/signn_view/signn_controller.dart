import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:get/get.dart';

class SignnController extends BaseController {
  final String email;
  final String phone;
  final String lname;
  final String fname;
  final String age;

  SignnController({
    required this.email,
    required this.phone,
    required this.lname,
    required this.fname,
    required this.age,
  });
  List disesesList = ['Diabetes', 'Pressure sickness', 'Heart disease'];

  RxList<int> selectedDiseases = <int>[].obs;
  RxList<String> selectedDiseasesValues = <String>[].obs;

  void selectDisease(int index) {
    if (selectedDiseases.contains(index)) {
      selectedDiseases.remove(index);
      selectedDiseasesValues.remove(disesesList[index]);
    } else {
      selectedDiseases.add(index);
      selectedDiseasesValues.add(disesesList[index]);
    }
    update();
  }
}
