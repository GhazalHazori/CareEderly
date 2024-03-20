import 'package:flutter/material.dart';

import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/medicine_view/medicine_view_controller.dart';
import 'package:get/get.dart';

class CustomButtonDialog extends StatefulWidget {
  const CustomButtonDialog(
      {super.key,
      this.backgroundColor,
      this.colorSelect,
      required this.text,
      required this.onPressed});
  final String text;
  final Function onPressed;
  final Color? backgroundColor;
  final bool? colorSelect;

  @override
  State<CustomButtonDialog> createState() => _CustomButtonDialogState();
}

class _CustomButtonDialogState extends State<CustomButtonDialog> {
  MedicinViewController controller = Get.put(MedicinViewController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(4),
      height: screenHeight(20),
      decoration: widget.colorSelect!
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(colors: [
                AppColors.greenButton1.withOpacity(0.2),
                AppColors.greenButton2.withOpacity(0.5),
              ], begin: Alignment.bottomLeft, end: Alignment.bottomRight))
          : null,
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Text(
          '${widget.text}',
          style:
              TextStyle(color: AppColors.blacktext, fontSize: screenWidth(30)),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
              screenWidth(30),
              screenHeight(40),
            ),
            backgroundColor: widget.colorSelect!
                ? Colors.transparent
                : widget.backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color: widget.colorSelect!
                        ? AppColors.maingreen
                        : AppColors.blacktext))),
      ),
    );
  }
}
