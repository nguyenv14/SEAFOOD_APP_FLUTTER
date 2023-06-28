import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  const ExpandableTextWidget({super.key, required this.text});
  final String text;
  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 150;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: AppText.text.copyWith(color: Colors.black45),
            )
          : Column(
              children: [
                Text(
                    hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf),
                    style: AppText.text
                        .copyWith(fontSize: 16, color: Colors.black45)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text(hiddenText ? "Show more" : "Hide text",
                          style:
                              AppText.text.copyWith(color: AppColor.mainColor)),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColor.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
