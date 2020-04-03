import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  CustomText(this.data,
      {this.color, this.fontSize = 20, this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        letterSpacing: 0.72,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
