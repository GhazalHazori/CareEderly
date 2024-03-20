import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import 'package:get/get.dart';
import 'dart:ui';

class CustomPlusButton extends StatefulWidget {
  const CustomPlusButton({
    super.key,
    this.widget,
    this.text,
  });

  final Widget? widget;
  final String? text;

  @override
  State<CustomPlusButton> createState() => _CustomPlusButtonState();
}

class _CustomPlusButtonState extends State<CustomPlusButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Get.defaultDialog(
        //     title: "add an activity",
        //     content: Column(
        //       children: [Text("nnnnnn"), Text("kkkkk")],
        //     ));
        // if (widget.onPressed != null) onPressed() {}
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth(55),
                  ),
                  backgroundColor: AppColors.whitecolor,
                  title: Center(child: Text("${widget.text!}")),
                  content: widget.widget),
            );
          },
        );
      },
      child: Text(
        "+",
        style: TextStyle(
            color: AppColors.blacktext,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth(12)),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.maingreen.withOpacity(0.5),
          fixedSize: Size(
            screenWidth(25),
            screenHeight(13),
          ),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
