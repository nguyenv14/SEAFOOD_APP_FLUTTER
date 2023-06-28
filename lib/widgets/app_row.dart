import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';

class AppRow extends StatefulWidget {
  const AppRow({super.key});

  @override
  State<AppRow> createState() => _AppRowState();
}

class _AppRowState extends State<AppRow> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Chinese Side",
        style: AppText.textBold.copyWith(fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Column(
            children: [
              Icon(
                Icons.delivery_dining,
                color: AppColor.mainColor,
              ),
              Icon(
                Icons.payments,
                color: AppColor.iconColor2,
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                "2",
                style: AppText.text
                    .copyWith(color: AppColor.mainColor, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "1287",
                style: AppText.text
                    .copyWith(color: AppColor.iconColor2, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
