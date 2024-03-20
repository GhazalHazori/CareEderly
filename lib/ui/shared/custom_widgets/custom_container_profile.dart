import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomContainerProfile extends StatefulWidget {
  const CustomContainerProfile({super.key, this.icon, this.text});
  final IconData? icon;
  final String? text;

  @override
  State<CustomContainerProfile> createState() => _CustomContainerProfileState();
}

class _CustomContainerProfileState extends State<CustomContainerProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenHeight(40)),
      child: Container(
        width: screenWidth(1.1),
        height: screenHeight(15),
        decoration: BoxDecoration(
            color: AppColors.whitecolor,
            border: Border.all(color: AppColors.hintFielColor),
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            children: [
              screenWidth(50).pw,
              Container(
                width: screenWidth(10),
                height: screenHeight(20),
                child: Icon(
                  widget.icon!,
                  color: AppColors.iconColor,
                ),
                decoration: BoxDecoration(
                    color: AppColors.iconColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
              ),
              screenWidth(40).pw,
              CustomText(
                text: '${widget.text}',
              )
            ],
          ),
        ),
      ),
    );
  }
}
