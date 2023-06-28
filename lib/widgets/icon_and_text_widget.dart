import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget(
      {super.key,
      required this.icon,
      required this.text,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: AppText.text.copyWith(color: AppColor.mainColor),
        )
      ],
    );
  }
}
