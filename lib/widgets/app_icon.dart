import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {super.key,
      required this.iconData,
      this.backgroundColor = const Color(0xfffcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40});

  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Center(
        child: Icon(
          iconData,
          color: iconColor,
          size: 18,
        ),
      ),
    );
  }
}
