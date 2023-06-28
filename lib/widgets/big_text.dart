import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    this.color,
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });

  final Color? color;
  final String text;

  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w400),
    );
  }
}
