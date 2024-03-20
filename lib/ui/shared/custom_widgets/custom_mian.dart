import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_data_piker.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomMain extends StatefulWidget {
  const CustomMain({super.key, this.text});
  final String? text;

  @override
  State<CustomMain> createState() => _CustomMainState();
}

class _CustomMainState extends State<CustomMain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: screenWidth(1),
          height: screenHeight(6),
          decoration: BoxDecoration(
              color: AppColors.maingreen.withOpacity(0.9),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20), vertical: screenHeight(9)),
          child: Container(
            width: screenWidth(1),
            height: screenHeight(13),
            decoration: BoxDecoration(
              color: AppColors.maingreen,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: widget.text!,
                  fonttext: screenWidth(25),
                  weigthtext: FontWeight.w600,
                  colortext: AppColors.blacktext,
                ),
                screenWidth(4).pw,
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/ic_date.svg",
                      width: screenWidth(12),
                    ),
                    CustomDatePicker()
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
