import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_templete/core/enums/file_type_enum.dart';
import 'package:flutter_templete/core/utils/general_utils.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_container_profile.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:flutter_templete/ui/views/main_view/profile_view/profile_view_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    ProfileViewController controller = Get.put(ProfileViewController());
    return SafeArea(
        child: Obx(
      () => ListView(children: [
        Stack(
          // alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.maingreen,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              width: screenWidth(1),
              height: screenHeight(6),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(12)),
              child: Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    InkWell(
                      onTap: controller.selectedFile == null ||
                              controller.selectedFile!.path.isEmpty
                          ? () {
                              controller.setShowOPtion(true);
                            }
                          : null,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.hintFielColor,
                        child: controller.selectedFile == null
                            ? Icon(
                                Icons.person,
                                size: screenWidth(6),
                                color: AppColors.blacktext,
                              )
                            : controller.selectedFile!.path.isNotEmpty &&
                                    controller.selectedFile!.type ==
                                        FileTypeEnum.FILE
                                ? Icon(
                                    Icons.file_copy,
                                    color: AppColors.blacktext,
                                  )
                                : controller.selectedFile!.path.isNotEmpty
                                    ? ClipOval(
                                        child: Image.file(
                                          File(controller.selectedFile!.path),
                                          fit: BoxFit.cover,
                                          width: 150,
                                          height: 150,
                                        ),
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: AppColors.blacktext,
                                      ),
                      ),
                    ),
                    Visibility(
                        visible: controller.selectedFile != null &&
                            controller.selectedFile!.path.isNotEmpty,
                        child: InkWell(
                          onTap: () {
                            controller.setShowOPtion(true);
                          },
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.hintFielColor,
                            child: Icon(
                              Icons.edit,
                              color: AppColors.blacktext,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: controller.showOptions.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonNew(
                text: 'Camera',
                textcolor: AppColors.blacktext,
                backgroundcolor: AppColors.maingreen,
                textsize: screenWidth(25),
                onpressed: () {
                  controller
                      .pickFile(FileTypeEnum.CAMERA)
                      .then((value) => controller.selectedFile = value);
                },
              ),
              CustomButtonNew(
                textcolor: AppColors.blacktext,
                backgroundcolor: AppColors.maingreen,
                textsize: screenWidth(25),
                text: 'Gallery',
                onpressed: () {
                  controller
                      .pickFile(FileTypeEnum.GALLERY)
                      .then((value) => controller.selectedFile = value);
                },
              ),
              CustomButtonNew(
                backgroundcolor: AppColors.maingreen,
                textcolor: AppColors.blacktext,
                textsize: screenWidth(25),
                text: 'File',
                onpressed: () {
                  controller
                      .pickFile(FileTypeEnum.FILE)
                      .then((value) => controller.selectedFile = value);
                },
              ),
            ],
          ),
        ),
        Row(
          children: [
            screenWidth(20).pw,
            Container(
              width: screenWidth(300),
              height: screenHeight(15),
              decoration: BoxDecoration(color: AppColors.blacktext),
            ),
            screenWidth(25).pw,
            CustomText(
              text: "Personal info",
              weigthtext: FontWeight.w500,
              fonttext: screenWidth(20),
            )
          ],
        ),
        screenHeight(50).ph,
        CustomContainerProfile(
          icon: Icons.person_outlined,
          text:
              "${storage.GetUser().firstname!} ${storage.GetUser().lastname!}",
        ),
        screenHeight(50).ph,
        CustomContainerProfile(
          icon: Icons.email,
          text: "${storage.GetUser().email!}",
        ),
        screenHeight(50).ph,
        CustomContainerProfile(
          icon: Icons.lock,
          text: "*************",
        ),
        screenHeight(50).ph,
        CustomContainerProfile(
          icon: Icons.phone_outlined,
          text: "${storage.GetUser().phnumber!}",
        ),
        screenHeight(20).ph,
        Row(
          children: [
            screenWidth(12).pw,
            Container(
              width: screenWidth(10),
              height: screenHeight(20),
              child: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  'assets/images/ic_log_out.svg',
                ),
              ),
              decoration: BoxDecoration(
                  color: AppColors.iconColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5)),
            ),
            screenWidth(40).pw,
            CustomText(text: "log out")
          ],
        )
      ]),
    ));
  }
}

class FileModel {
  FileTypeEnum type;
  String path;

  FileModel(this.path, this.type);
}
