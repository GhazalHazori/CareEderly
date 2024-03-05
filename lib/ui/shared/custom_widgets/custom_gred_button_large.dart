import 'package:flutter/material.dart';

class CustomGred extends StatefulWidget {
  const CustomGred({
    super.key,
    required this.text,
    required this.color,
    this.onTap,
  });
  final String text;
  final Color color;
  final Function? onTap;
  // final Color colorshadow;
  @override
  State<CustomGred> createState() => _CustomGredState();
}

class _CustomGredState extends State<CustomGred> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      child: Container(
        width: 251,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1.00, -0.09),
            end: Alignment(1, 0.09),
            colors: [
              widget.color,
              widget.color,
              widget.color,
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shadows: [
          //   BoxShadow(
          //     color: widget.colorshadow,
          //     blurRadius: 4,
          //     offset: Offset(0, 4),
          //     spreadRadius: 0,
          //   )
          // ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF091D36),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
