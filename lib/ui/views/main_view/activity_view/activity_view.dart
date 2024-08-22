import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/activity_repository.dart';
import 'package:flutter_templete/core/enums/message_type.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_add_activity_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_card.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_edit_activity.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_plus_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/textform.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

import 'activity_view_controller.dart';

class ActiviteView extends StatefulWidget {
  const ActiviteView({super.key});

  @override
  State<ActiviteView> createState() => _ActiviteViewState();
}

class _ActiviteViewState extends State<ActiviteView> {
  TextEditingController controller = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  ActivityViewController activityController = Get.put(ActivityViewController());

  void updatePage() {
    activityController.activityList.clear();
    activityController.getAllActivity(); // Reload the medicine list
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      shrinkWrap: true,
      children: [
        CustomMain(
          text: "Activity Page",
        ),
        Obx(() {
          return SizedBox(
            height: screenHeight(2.8),
            child: activityController.activityList.isEmpty
                ? Text("no activity")
                : SizedBox(
                    height: screenHeight(2.2),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: activityController.activityList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(children: [
                                  CustomCard(
                                    name: activityController
                                        .activityList[index].activityName,
                                    details: activityController
                                        .activityList[index].description,
                                    widget: CustomEditActivity(
                                      update: () {
                                        ActivityRepository()
                                            .update(
                                                id: activityController
                                                    .activityList[index].sId
                                                    .toString(),
                                                activityName: activityController.nameEditmedicin.text == ""
                                                    ? activityController
                                                        .activityList[index]
                                                        .activityName!
                                                    : activityController
                                                        .nameEditmedicin.text,
                                                description: activityController
                                                            .detailsEditmedicin
                                                            .text ==
                                                        ""
                                                    ? activityController
                                                        .activityList[index]
                                                        .description!
                                                    : activityController
                                                        .detailsEditmedicin
                                                        .text,
                                                endDate: activityController
                                                            .editselectedDate
                                                            .toString() ==
                                                        DateTime.now().toString()
                                                    ? activityController.activityList[index].endDate
                                                    : activityController.editselectedDate.toString(),
                                                repate: int.parse(activityController.repeatControllerEdit.text),
                                                EnableNotification: activityController.enable.value)
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
                                                  updatePage();
                                                },
                                              ),
                                            );

                                        // updateMedicineList();
                                      },
                                      delet: () {
                                        ActivityRepository().delet(
                                            id: activityController
                                                .activityList[index].sId
                                                .toString());
                                        Get.back();
                                        updatePage();
                                      },
                                    ),
                                    text: "name activity",
                                  )
                                ]));
                          }),
                    ),
                  ),
          );
        }),
        screenHeight(10).ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
              child: CustomPlusButton(
                widget: CustomAddActivityDialog(),
                text: "add an activity",
              ),
            ),
          ],
        ),
      ],
    ));
  }

  showDefaultDialog() {
    Get.defaultDialog(
        content: Column(
      children: [
        Center(
          child: Text(
            "activity name",
            style: TextStyle(
                color: AppColors.blacktext,
                fontWeight: FontWeight.w500,
                fontSize: screenWidth(20)),
          ),
        ),
        screenHeight(30).ph,
        TextForm(hinttext: ' Activity name', texteditingcontroller: controller),
        screenHeight(40).ph,
        TextForm(
          hinttext: ' Details',
          texteditingcontroller: controller,
          hieght: screenHeight(5),
          maxLine: 6,
        ),
        Row(
          children: [
            CustomText(
              text: "repeat",
              colortext: AppColors.blacktext,
              weigthtext: FontWeight.w400,
            ),
            TextForm(
              hinttext: "",
              texteditingcontroller: repeatController,
            ),
            CustomText(
              text: "per",
              colortext: AppColors.blacktext,
              weigthtext: FontWeight.w400,
            ),
          ],
        )
      ],
    ));
  }
}
