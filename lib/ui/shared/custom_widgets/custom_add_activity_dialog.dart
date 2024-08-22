import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_dialog.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/textform.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/activity_view/activity_view_controller.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomAddActivityDialog extends StatefulWidget {
  const CustomAddActivityDialog({super.key});

  @override
  State<CustomAddActivityDialog> createState() =>
      _CustomAddActivityDialogState();
}

class _CustomAddActivityDialogState extends State<CustomAddActivityDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  RxString dropdownValue = ''.obs;
  RxList<String> dropList = ['Daily', 'weekly', 'permonth'].obs;
  RxBool enable = false.obs;
  // late DateTime selectedDate;
  @override
  @override
  void initState() {
    super.initState();
    controller.selectedDate = DateTime.now();
  }

  ActivityViewController controller = Get.put(ActivityViewController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.selectedDate) {
      setState(() {
        controller.selectedDate = picked;
      });
    }
  }

  void updatePage() {
    // controller.medicineList.clear();
    // controller.getAllMedicine(); // Reload the medicine list
  }

  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: screenWidth(1),
          height: screenHeight(1.8),
          child: Column(
            children: [
              screenHeight(90).ph,
              TextForm(
                hinttext: ' Activity name',
                texteditingcontroller: controller.nameController,
              ),
              screenHeight(150).ph,
              TextForm(
                hinttext: ' repate',
                texteditingcontroller: controller.repateController,
              ),
              screenHeight(150).ph,
              TextForm(
                hinttext: ' Details',
                texteditingcontroller: controller.detailsController,
                maxLine: 2,
              ),
              screenHeight(90).ph,
              Row(
                children: [
                  CustomText(
                    text: "End date",
                  ),
                  screenWidth(50).pw,
                  Container(
                    width: screenWidth(2.6),
                    height: screenHeight(25),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blacktext),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Text(
                          DateFormat('dd_MM_yyyy')
                              .format(controller.selectedDate)
                              .toString(),
                          style: TextStyle(
                            color: AppColors.blacktext,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              screenHeight(90).ph,
              Row(
                children: [
                  CupertinoSwitch(
                    activeColor: AppColors.maingreen,
                    trackColor: AppColors.hintFielColor,

                    value: enable.value, // Set the initial value of the switch
                    onChanged: (value) {
                      // Handle switch state changes
                      // 'value' parameter contains the new state of the switch
                      enable.value = value;
                    },
                  ),
                  CustomText(
                    text: "Enable notification",
                  )
                ],
              ),
              screenHeight(60).ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonDialog(
                    onPressed: () {
                      controller.add();
                      Get.back();
                      // updatePage();
                    },
                    text: 'save',
                    colorSelect: true,
                  ),
                  CustomButtonDialog(
                    text: 'Cancle',
                    onPressed: () {
                      Get.back();
                    },
                    colorSelect: false,
                    backgroundColor: AppColors.whitecolor,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
