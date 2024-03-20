import 'package:flutter/material.dart';
import 'package:flutter_templete/core/data/reposotories/home_repository.dart';
import 'package:flutter_templete/core/enums/operation_type.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_activity.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_medicins.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

import 'package:flutter_templete/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      updatePage();
    });
    super.initState();
  }

  HomeViewController controller = Get.put(HomeViewController());
  void updatePage() {
    controller.medicineListHome.clear();
    controller.getAllMedicineForHome();
    controller.activityListHome.clear();
    controller.getAllActivityForHome();
    // Reload the medicine list
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomMain(
              text: "Home Page",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth(300),
                        height: screenHeight(15),
                        decoration: BoxDecoration(color: AppColors.blacktext),
                      ),
                      screenWidth(25).pw,
                      CustomText(
                        text: "Medicines",
                        weigthtext: FontWeight.w500,
                        fonttext: screenWidth(20),
                      )
                    ],
                  ),
                  screenHeight(30).ph,
                  Obx(() {
                    return controller.medicineListHome.isEmpty
                        ? Text("no medicine")
                        : SizedBox(
                            height: screenHeight(10),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.medicineListHome.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                                onTap: () {},
                                                child: CustomMedicine(
                                                  medicineName: controller
                                                      .medicineListHome[index]
                                                      .medicinName!,
                                                  medicinedetails: controller
                                                      .medicineListHome[index]
                                                      .description!,
                                                ))
                                          ]));
                                }),
                          );
                  }),
                  screenHeight(30).ph,
                  Row(
                    children: [
                      Container(
                        width: screenWidth(300),
                        height: screenHeight(15),
                        decoration: BoxDecoration(color: AppColors.blacktext),
                      ),
                      screenWidth(25).pw,
                      CustomText(
                        text: "Activities",
                        weigthtext: FontWeight.w500,
                        fonttext: screenWidth(20),
                      )
                    ],
                  ),
                  screenHeight(30).ph,
                  Obx(() {
                    return SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.activityListHome.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                          onTap: () {},
                                          child: CustomActivity(
                                            activitName: controller
                                                .activityListHome[index]
                                                .activityName!,
                                            activitydetails: controller
                                                .activityListHome[index]
                                                .description!,
                                          ))
                                    ]));
                          }),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
