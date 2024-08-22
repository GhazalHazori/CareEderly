import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/models/diseases_model.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_gr.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_form.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/dis_details/dis_details_view_controller.dart';
import 'package:get/get.dart';

class DisDetailsView extends StatefulWidget {
  final DiseasesModel model;
  const DisDetailsView({super.key, required this.model});

  @override
  State<DisDetailsView> createState() => _DisDetailsViewState();
}

class _DisDetailsViewState extends State<DisDetailsView> {
  late DisDetailsViewController controller;
  bool vis = false;
  @override
  void initState() {
    controller = Get.put(DisDetailsViewController(widget.model));
    widget.model.sId != "66bf37e35989965475265bd3" ? vis = true : vis = false;
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: screenWidth(1),
              height: screenHeight(10),
              decoration: BoxDecoration(
                  color: AppColors.maingreen.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
              child: Column(
                children: [
                  screenHeight(20).ph,
                  CachedNetworkImage(
                    imageUrl: "${widget.model.image}",
                    width: screenWidth(1.5),
                    height: screenHeight(4),
                  ),
                  screenHeight(25).ph,
                  Center(
                    child: CustomText(
                      text: "${widget.model.diseaseName}",
                      weigthtext: FontWeight.bold,
                      colortext: AppColors.blacktext,
                    ),
                  ),
                  screenHeight(30).ph,
                  CustomText(
                    text: "${widget.model.description}",
                    colortext: AppColors.blacktext,
                    fonttext: screenWidth(25),
                  ),
                  screenHeight(15).ph,
                  Visibility(
                    visible: vis,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: AppColors.blacktext),
                              width: screenWidth(200),
                              height: screenHeight(10),
                            ),
                            screenWidth(35).pw,
                            CustomText(text: "tools could help"),
                          ],
                        ),
                        CachedNetworkImage(
                          imageUrl: "${widget.model.toolImage}",
                          width: screenWidth(1.5),
                          height: screenHeight(4),
                        ),
                        screenWidth(50).ph,
                        Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: AppColors.blacktext),
                              width: screenWidth(200),
                              height: screenHeight(10),
                            ),
                            screenWidth(35).pw,
                            CustomText(text: "How To Use"),
                          ],
                        ),
                        SizedBox(
                            height: screenHeight(4),
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: widget.model.steps!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomText(
                                      text: widget.model.steps![index]);
                                })),
                        screenWidth(20).ph,
                        Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: AppColors.blacktext),
                              width: screenWidth(200),
                              height: screenHeight(10),
                            ),
                            screenWidth(35).pw,
                            CustomText(text: "Advice"),
                          ],
                        ),
                        screenWidth(20).ph,
                        SizedBox(
                            height: screenHeight(4),
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: widget.model.advice!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CustomText(
                                      text: widget.model.advice![index]);
                                })),
                        screenWidth(50).ph,
                        CustomTextFormField(
                            hintText: "Enter value",
                            controller: controller.controllerValue,
                            fillColor: Color.fromRGBO(247, 253, 254, 1),
                            hintTextColor: AppColors.greyDotsIndicator),
                        screenWidth(50).ph,
                        CustomButtonGer(
                          onTap: () {
                            widget.model.sId == "66bf1956b606042cdaa6862d"
                                ? controller.checkdia(
                                    value: controller.controllerValue.text,
                                    disId: widget.model.sId.toString(),
                                    tokenn: storage.GetUser().sId.toString())
                                : controller.checkBre(
                                    tokenn: storage.GetUser().sId.toString(),
                                    disId: widget.model.sId.toString(),
                                    value: controller.controllerValue.text);
                          },
                          text: 'Check',
                          wight: screenWidth(2),
                          hight: screenHeight(18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            // InkWell(onTap: () {}, child: CachedNetworkImage(imageUrl: ""))
          ],
        ),
      ),
    );
  }
}
