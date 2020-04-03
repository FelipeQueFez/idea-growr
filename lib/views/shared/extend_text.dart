import 'package:flutter/material.dart';

class ExtendsText extends Text {
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  ExtendsText(String data, {this.color, this.fontSize = 20, this.fontWeight = FontWeight.normal}) : super(data);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        data,
        style: TextStyle(
          letterSpacing: 0.72,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
