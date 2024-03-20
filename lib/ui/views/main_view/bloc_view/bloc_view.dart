import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_container_bloc.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_mian.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/bloc_view/bloc_view_controller.dart';

import 'package:get/get.dart';

class BlocView extends StatefulWidget {
  const BlocView({super.key});

  @override
  State<BlocView> createState() => _BlocViewState();
}

class _BlocViewState extends State<BlocView> {
  BlocViewController controller = Get.put(BlocViewController());
  //   late  BlocViewController controller;
  // @override
  // void initState() {
  //   controller = Get.put(BlocViewController(widget.model));
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomMain(
            text: "Plog page",
          ),
          SizedBox(
            height: screenHeight(2),
            child: GridView.builder(
                itemCount: controller.imageList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(30),
                        vertical: screenHeight(200)),
                    child: CustomContainerBloc(
                      imagename: controller.imageList[index],
                      name: controller.nameList[index],
                    ),
                  );
                }),
          ),
          // CustomContainerBloc(
          //   imagename: 'heart',
          //   name: "Heart disease",
          // )
        ],
      ),
    );
  }
}
