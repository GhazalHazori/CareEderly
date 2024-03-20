import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_templete/core/enums/bottom_navigation_enum.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // SvgPicture.asset(
        //   'assets/imagesbg_bottom_navigation.svg',
        //   fit: BoxFit.fitWidth,
        // ),

        Container(
          decoration: BoxDecoration(
              color: AppColors.whitecolor,
              border: Border(
                  top: BorderSide(color: AppColors.blacktext, width: 1),
                  bottom: BorderSide(color: AppColors.maingreen, width: 1.5))),
          width: screenWidth(1),
          height: screenHeight(10),
        ),
        Positioned(
          // bottom: screenWidth(20),
          left: screenWidth(20),
          right: screenWidth(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.HOME, 0);
                      },
                      size: size,
                      imagename: 'ic_home',
                      isslected: widget.navitm == BottomNavigationEnum.HOME),
                  SizedBox(
                    width: screenWidth(15),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.ACTIVITY, 1);
                      },
                      size: size,
                      imagename: 'ic_activity',
                      isslected:
                          widget.navitm == BottomNavigationEnum.ACTIVITY),
                  SizedBox(
                    width: screenWidth(15),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.MEDICINE, 2);
                      },
                      size: size,
                      imagename: 'ic_medicine',
                      isslected:
                          widget.navitm == BottomNavigationEnum.MEDICINE),
                  SizedBox(
                    width: screenWidth(15),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.BLOC, 3);
                      },
                      size: size,
                      imagename: 'ic_blog',
                      isslected: widget.navitm == BottomNavigationEnum.BLOC),
                  SizedBox(
                    width: screenWidth(15),
                  ),
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.PRIFILE, 4);
                      },
                      size: size,
                      imagename: 'ic_profile',
                      isslected: widget.navitm == BottomNavigationEnum.PRIFILE)
                ]),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imagename,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imagename.svg',
            color: isslected ? AppColors.mainorange : AppColors.greycolor,
            width: screenWidth(17),
          ),
          screenHeight(30).ph,
          Container(
            decoration: BoxDecoration(
                color: isslected ? AppColors.mainorange : Colors.transparent),
            width: screenWidth(9),
            height: screenHeight(500),
          )
        ],
      ),
    );
  }
}
