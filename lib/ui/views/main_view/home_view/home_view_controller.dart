import 'package:flutter_templete/core/data/models/activity_model.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/reposotories/home_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/core/enums/request_status.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_activity.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_medicins.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/views/main_view/activity_view/activity_view.dart';
import 'package:get/get.dart';

class HomeViewController extends BaseController {
  RxList<String> categoryList = <String>[].obs;
  List medicineList = [
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
    CustomMedicine(
      medicineName: "aaa",
      medicinedetails: "bbbb",
    ),
  ];
  List activityList = [
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
    CustomActivity(
      activitName: "aaa",
      activitydetails: "bbbb",
    ),
  ];

  RxList<MedicineModel> medicineListHome = <MedicineModel>[].obs;
  RxList<ActivityModel> activityListHome = <ActivityModel>[].obs;
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    getAllMedicineForHome();
    getAllActivityForHome();
    // getAllGategory();

    super.onInit();
  }

  bool get isLoading => requestStatus.value == RequestStatus.LOADING;

  Future<void> getAllMedicineForHome() async {
    runLoadingFutureFunction(
        operationType: OperationType.MEDICINE,
        function: HomeRepository().getAllMedicine().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            medicineListHome.value = r;
          });
        }));
  }

  bool get isMedicineLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.MEDICINE;
  bool get isActivityLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType == OperationType.ACTIVITY;
  Future<void> getAllActivityForHome() async {
    runLoadingFutureFunction(
        operationType: OperationType.ACTIVITY,
        function: HomeRepository().getAllActivity().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: "succed", messageType: MessageType.SUCCESS);
            activityListHome.value = r;
          });
        }));
  }

  Future<void> updateData() async {
    await getAllMedicineForHome();
    await getAllActivityForHome();
  }
}
