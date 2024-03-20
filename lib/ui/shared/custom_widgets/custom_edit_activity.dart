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

class CustomEditActivity extends StatefulWidget {
  const CustomEditActivity({super.key, this.update, this.delet});

  final Function? update;
  final Function? delet;
  @override
  State<CustomEditActivity> createState() => _CustomEditActivityState();
}

class _CustomEditActivityState extends State<CustomEditActivity> {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  RxString dropdownValue = ''.obs;
  RxList<String> dropList = ['Daily', 'weekly', 'permonth'].obs;
  RxBool enable = false.obs;
  late DateTime selectedDate;

  ActivityViewController controller = Get.put(ActivityViewController());
  @override
  void initState() {
    super.initState();
    controller.editselectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.editselectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != controller.editselectedDate) {
      setState(() {
        controller.editselectedDate = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: screenWidth(1),
          height: screenHeight(1.8),
          child: Column(
            children: [
              screenHeight(90).ph,
              TextForm(
                hinttext: ' activity name',
                texteditingcontroller: controller.nameEditmedicin,
              ),
              screenHeight(200).ph,
              TextForm(
                hinttext: ' Details',
                texteditingcontroller: controller.detailsEditmedicin,
                maxLine: 5,
              ),
              screenHeight(90).ph,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CustomText(
              //       text: "repeat",
              //       weigthtext: FontWeight.w400,
              //     ),
              //     TextForm(
              //       hinttext: "",
              //       texteditingcontroller: repeatController,
              //       widthContainer: screenWidth(10),
              //       heightContainer: screenHeight(30),
              //     ),
              //     CustomText(
              //       text: "per",
              //       weigthtext: FontWeight.w400,
              //       fonttext: screenWidth(25),
              //     ),
              //     Container(
              //       width: screenWidth(2.5),
              //       height: screenHeight(25),
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //             color: AppColors.blacktext,
              //           ),
              //           borderRadius: BorderRadius.circular(5)),
              //       child: DropdownButton<String>(
              //         underline: Container(),
              //         icon: Icon(Icons.keyboard_arrow_down),
              //         hint: Text(
              //           dropdownValue.value != ''
              //               ? "${dropdownValue.value}"
              //               : "chose a erpeat",
              //           style: TextStyle(
              //               fontWeight: FontWeight.w400,
              //               color: AppColors.blacktext),
              //         ),
              //         items: dropList.map((String value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(
              //               value,
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w400,
              //                   color: AppColors.blacktext),
              //             ),
              //           );
              //         }).toList(),
              //         onChanged: (newValue) {
              //           setState(() {
              //             dropdownValue.value = newValue!;
              //           });
              //         },
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  CustomText(
                    text: "End date",
                  ),
                  screenWidth(50).pw,
                  Container(
                    width: screenWidth(2.5),
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
                              .format(controller.editselectedDate)
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
                      widget.update!();
                    },
                    text: 'update',
                    colorSelect: true,
                  ),
                  InkWell(
                    onTap: () {
                      widget.delet!();
                    },
                    child: Icon(Icons.delete_rounded,
                        size: screenWidth(10), color: AppColors.blacktext),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
