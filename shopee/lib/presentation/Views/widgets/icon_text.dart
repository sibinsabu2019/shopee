import 'package:flutter/material.dart';

class IconTextColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? iconSize;
  final Color? iconColor;
  final double? textSize;
  final TextStyle? textStyle;

  const IconTextColumn({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 50,
    this.iconColor,
    this.textSize = 11,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        Text(
          text,
          style: textStyle ?? TextStyle(fontSize: textSize),
        ),
      ],
    );
  }
}