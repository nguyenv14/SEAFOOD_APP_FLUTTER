import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/widgets/icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  const AppColumn(
      {super.key, required this.product_name, required this.countComment});

  final String product_name;
  final int countComment;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        product_name,
        style: AppText.textBold.copyWith(fontSize: 20),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Wrap(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color: AppColor.iconColor1,
                size: 15,
              );
            }),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "4.5",
            style: AppText.text.copyWith(color: AppColor.textColor),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            countComment.toString(),
            style: AppText.text.copyWith(color: AppColor.textColor),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "comments",
            style: AppText.text.copyWith(color: AppColor.textColor),
          ),
        ],
      ),
    ]);
  }
}
