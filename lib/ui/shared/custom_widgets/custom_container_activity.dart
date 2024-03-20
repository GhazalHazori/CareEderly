import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class CustomContainerActivity extends StatefulWidget {
  const CustomContainerActivity({super.key, this.activityName});
  final String? activityName;

  @override
  State<CustomContainerActivity> createState() =>
      _CustomContainerActivityState();
}

class _CustomContainerActivityState extends State<CustomContainerActivity> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Option 1'; // Default selected value
    List<String> dropdownOptions = [
      'Option 1',
      'Option 2',
      'Option 3',
      'Option 4'
    ];
    TextEditingController controller = TextEditingController();

    return Container(
      width: screenWidth(1.1),
      height: screenHeight(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.blacktext)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.activityName}",
              style: TextStyle(
                  color: AppColors.blacktext, fontSize: screenWidth(25)),
            ),
            // IconButton(
            //     onPressed: () {
            //       Get.defaultDialog(
            //           title: "activity name",
            //           content: Column(
            //             children: [
            //               Center(
            //                 child: Text(
            //                   "activity name",
            //                   style: TextStyle(
            //                       color: AppColors.blacktext,
            //                       fontSize: screenWidth(20),
            //                       fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //               screenWidth(30).ph,
            //               TextForm(
            //                   hinttext: "activity name",
            //                   textfieldhintcolor: AppColors.hintFielColor,
            //                   texteditingcontroller: controller)
            //             ],
            //           ));
            //     },
            //     icon: Icon(
            //       Icons.keyboard_arrow_down,
            //       color: AppColors.blacktext,
            //     ))
          ],
        ),
      ),
    );
  }
}
