import 'package:flutter/material.dart';

import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomActivity extends StatefulWidget {
  const CustomActivity({super.key, this.activitName, this.activitydetails});
  final String? activitName;
  final String? activitydetails;

  @override
  State<CustomActivity> createState() => _CustomActivityState();
}

class _CustomActivityState extends State<CustomActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(2.5),
      height: screenHeight(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.blacktext)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Text(
                " Name:",
                style: TextStyle(
                    color: AppColors.blacktext, fontSize: screenWidth(25)),
              ),
              screenWidth(25).pw,
              Text(
                "${widget.activitName!}",
                style: TextStyle(color: AppColors.maingreen),
              ),
            ],
          ),
          screenHeight(50).ph,
          Row(
            children: [
              Text(
                " details:",
                style: TextStyle(
                    color: AppColors.blacktext, fontSize: screenWidth(25)),
              ),
              screenWidth(25).pw,
              Text(
                "${widget.activitydetails!}",
                style: TextStyle(color: AppColors.maingreen),
              )
            ],
          )
        ]),
      ),
    );
  }
}
