import 'package:flutter/material.dart';
import 'package:flutter_templete/main.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class CustomMedicine extends StatefulWidget {
  const CustomMedicine({super.key, this.medicineName, this.medicinedetails});
  final String? medicineName;
  final String? medicinedetails;

  @override
  State<CustomMedicine> createState() => _CustomMedicineState();
}

class _CustomMedicineState extends State<CustomMedicine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(2.5),
      height: screenHeight(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.blacktext)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Text(
                " Name:",
                style: TextStyle(
                    color: AppColors.blacktext, fontSize: screenWidth(25)),
              ),
              screenWidth(25).pw,
              Text(
                "${widget.medicineName!}",
                style: TextStyle(color: AppColors.maingreen),
              ),
            ],
          ),
          screenHeight(50).ph,
          Row(
            children: [
              Text(
                " details:",
                style: TextStyle(
                    color: AppColors.blacktext, fontSize: screenWidth(25)),
              ),
              screenWidth(50).pw,
              Text(
                "${widget.medicinedetails!}",
                style: TextStyle(color: AppColors.maingreen),
              )
            ],
          )
        ]),
      ),
    );
  }
}
