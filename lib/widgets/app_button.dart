import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color? colorBtn;
  final Color? colorText;

  const AppButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.colorBtn,
      this.colorText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 100, top: 15, bottom: 15, left: 20),
        decoration: BoxDecoration(
            color: colorBtn ?? AppColor.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(1, 2), blurRadius: 2)
            ]),
        child: Text(
          label,
          style: AppText.text
              .copyWith(color: colorText ?? Colors.white, fontSize: 16),
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}

class AppButtonIconWidget extends StatefulWidget {
  const AppButtonIconWidget(
      {super.key,
      required this.label,
      required this.onTap,
      this.colorBtn,
      this.colorText,
      required this.iconData,
      required this.colorIcon});
  final String label;
  final Function() onTap;
  final Color? colorBtn;
  final Color? colorText;
  final IconData iconData;
  final Color colorIcon;

  @override
  State<AppButtonIconWidget> createState() => _AppButtonIconWidgetState();
}

class _AppButtonIconWidgetState extends State<AppButtonIconWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(right: 100, top: 15, bottom: 15, left: 20),
        decoration: BoxDecoration(
            color: widget.colorBtn ?? AppColor.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54, offset: Offset(1, 2), blurRadius: 2)
            ]),
        child: Row(
          children: [
            Icon(
              widget.iconData,
              color: widget.colorIcon,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.label,
              style: AppText.text.copyWith(
                  color: widget.colorText ?? Colors.white, fontSize: 16),
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
}
