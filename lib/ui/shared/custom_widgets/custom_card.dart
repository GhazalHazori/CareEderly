import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/textform.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    this.name,
    this.details,
    this.repeat,
    this.onTap,
    this.widget,
    this.text,
  });
  final String? name;
  final String? details;
  final String? repeat;
  final Function? onTap;
  final Widget? widget;
  final String? text;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  TextEditingController controller = TextEditingController();
  TextEditingController repeatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whitecolor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: AppColors.blacktext)),
      child: ExpansionTile(
        title: Text('${widget.name}'),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "details:",
                      colortext: AppColors.maingreen,
                    ),
                    screenWidth(40).pw,
                    Text(
                      "${widget.details}",
                      style: TextStyle(color: AppColors.blacktext),
                    )
                  ],
                ),
                screenWidth(40).ph,
                Row(
                  children: [
                    CustomText(
                      text: "repeat:",
                      colortext: AppColors.maingreen,
                    ),
                    screenWidth(40).pw,
                    Text(
                      "${widget.repeat}",
                      style: TextStyle(color: AppColors.blacktext),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
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
                      child: Icon(
                        Icons.edit,
                        color: AppColors.maingreen,
                        size: screenWidth(10),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showDefaultDialog() {
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
