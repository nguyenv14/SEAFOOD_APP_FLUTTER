import 'package:flutter/material.dart';
import 'package:seafoods/widgets/color_constants.dart';

class ItemButtonWidget extends StatelessWidget {
  const ItemButtonWidget({Key? key, required this.data, this.onTap, this.color})
      : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          gradient: Gradients.defaultGradientBackground,
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: color == null
              ? TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)
              : TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColor,
                ),
        ),
      ),
    );
  }
}
