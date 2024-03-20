import 'package:flutter/material.dart';
import 'package:flutter_templete/core/enums/bottom_navigation_enum.dart';
import 'package:flutter_templete/ui/views/main_view/activity_view/activity_view.dart';
import 'package:flutter_templete/ui/views/main_view/bloc_view/bloc_view.dart';
import 'package:flutter_templete/ui/views/main_view/main_view_widget/bottom_navigation_widget.dart';
import 'package:flutter_templete/ui/views/main_view/medicine_view/medicine_view.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view.dart';

import 'package:get/get.dart';

import '../../shared/custom_widgets/custom_mian.dart';
import 'home_view/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  //maincontroller controller = Get.put(maincontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      key: key,
      // appBar: PreferredSize(
      //     child: CustomMain(), preferredSize: Size.fromHeight(screenWidth(1))),
      // drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationWidget(
        navitm: selected,
        ontap: (select, pagenumber) {
          controller.jumpToPage(pagenumber);

          setState(() {
            selected = select;
          });
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomeView(),
          ActiviteView(),
          MedicineView(),
          BlocView(),
          ProfileView(),
        ],
      ),
    ));
  }
}
