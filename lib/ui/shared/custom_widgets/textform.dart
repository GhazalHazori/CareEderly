import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_templete/ui/shared/colors.dart';
import 'package:flutter_templete/ui/shared/utils.dart';

class TextForm extends StatefulWidget {
  const TextForm({
    super.key,
    required this.hinttext,
    this.hintfontsize,
    required this.texteditingcontroller,
    this.validator,
    this.maxLine,
    this.hieght,
    this.widthContainer,
    this.heightContainer,
  });
  final String hinttext;
  final TextEditingController texteditingcontroller;
  final double? hintfontsize;

  final String? Function(String?)? validator;
  final int? maxLine;
  final double? hieght;
  final double? widthContainer;
  final double? heightContainer;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthContainer,
      height: widget.heightContainer,
      child: TextFormField(
        showCursor: false,
        maxLines: widget.maxLine ?? 1,
        validator: widget.validator,
        controller: widget.texteditingcontroller,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.bluecolor),
          fillColor: AppColors.hintFielColor.withOpacity(0.3),
          filled: true,
          hintText: widget.hinttext,
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.hieght ?? 10.0,
          ),
          hintStyle: TextStyle(
              color: AppColors.hintFielColor.withOpacity(0.8),
              fontSize: widget.hintfontsize ?? screenWidth(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.hintFielColor),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.hintFielColor)),
        ),
      ),
    );
  }
}
