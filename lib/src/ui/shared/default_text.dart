import 'package:entangled/src/constants.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
    this.title, {
    super.key,
    this.fontSize = 20,
    this.color = AppColors.kSecondaryColor,
    this.bold = false,
  });
  final String title;
  final double fontSize;
  final Color color;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
