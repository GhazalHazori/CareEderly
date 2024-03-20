import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_templete/core/data/models/medicine_model.dart';
import 'package:flutter_templete/core/data/reposotories/user_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_add_midicine_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_card.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_edit_midicine.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_plus_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/medicine_view/medicine_view_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MedicineView extends StatefulWidget {
  const MedicineView({super.key});

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  MedicinViewController medicinController = Get.put(MedicinViewController());
  void updatePage() {
    medicinController.medicineList.clear();
    medicinController.getAllMedicine(); // Reload the medicine list
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        CustomMain(
          text: "Medicine page",
        ),
        Obx(() {
          return medicinController.isProductLoading
              ? SpinKitCircle(
                  color: AppColors.maingreen,
                  duration: Duration(seconds: 10),
                )
              : medicinController.medicineList.isEmpty
                  ? Text('no medicine')
                  : SizedBox(
                      height: screenHeight(2.8),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: medicinController.medicineList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(children: [
                                  CustomCard(
                                    name: medicinController
                                        .medicineList[index].medicinName!,
                                    details: medicinController
                                        .medicineList[index].description!,
                                    text:
                                        "${medicinController.medicineList[index].medicinName!}",
                                    widget: CustomEditMidicine(
                                      update: () {
                                        UserRepository()
                                            .update(
                                              id: medicinController
                                                  .medicineList[index].sId
                                                  .toString(),
                                              medicinName: medicinController
                                                          .nameEditmedicin
                                                          .text ==
                                                      ""
                                                  ? medicinController
                                                      .medicineList[index]
                                                      .medicinName!
                                                  : medicinController
                                                      .nameEditmedicin.text,
                                              description: medicinController
                                                          .detailsEditmedicin
                                                          .text ==
                                                      ""
                                                  ? medicinController
                                                      .medicineList[index]
                                                      .description!
                                                  : medicinController
                                                      .detailsEditmedicin.text,
                                              startDate: medicinController
                                                          .editselectedDate
                                                          .toString() ==
                                                      ""
                                                  ? medicinController
                                                      .medicineList[index]
                                                      .startDate
                                                  : medicinController
                                                      .editselectedDate
                                                      .toString(),
                                              endDate: medicinController
                                                          .editselectedDate
                                                          .toString() ==
                                                      DateTime.now().toString()
                                                  ? medicinController
                                                      .medicineList[index]
                                                      .endDate
                                                  : medicinController
                                                      .editselectedDate
                                                      .toString(),
                                            )
                                            .then(
                                              (value) => value.fold(
                                                (l) {
                                                  CustomToast.showMessage(
                                                    messageType:
                                                        MessageType.REJECTED,
                                                    message: l,
                                                  );
                                                },
                                                (r) {
                                                  // storage.setTokenInfo(r);
                                                  CustomToast.showMessage(
                                                    messageType:
                                                        MessageType.SUCCESS,
                                                    message: "Done update",
                                                  );
                                                  Get.back();
                                                  medicinController
                                                      .getAllMedicine();
                                                  // updatePage();
                                                },
                                              ),
                                            );

                                        // updateMedicineList();
                                      },
                                      delet: () {
                                        UserRepository().delet(
                                            id: medicinController
                                                .medicineList[index].sId
                                                .toString());
                                        Get.back();
                                        // medicinController.getAllMedicine();
                                        updatePage();
                                      },
                                    ),

                                    // onTap: showDefaultDialog,
                                  )
                                ]));
                          }),
                    );
        }),
        screenHeight(10).ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
              child: CustomPlusButton(
                widget: CustomAddMidicineDialog(),
                text: "add an midicine",
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
