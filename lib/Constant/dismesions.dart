import 'package:flutter/material.dart';
import 'package:flutter_screenfit/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Dimesions {
  static double screenHeight =
      WidgetsBinding.instance.window.physicalSize.height;
  static double screenWidth = WidgetsBinding.instance.window.physicalSize.width;
  static double pageView = screenHeight / 7;
  static double pageViewContainer = screenHeight / 10;
  static double pageViewTextContainer = screenHeight / 17;

  static String formatNumber(double number) {
    final formatter = NumberFormat("#,###", "en_US");
    String formatnumber = formatter.format(number);
    String formattedNumber = formatnumber.toString().replaceAll(',', '.');
    return formattedNumber;
  }

  static String removeHtmlTags(String htmlText) {
    String plainText = htmlText.replaceAll(RegExp('<.*?>'), '');
    return plainText;
  }

  static String CUSTOMER = "customer";

  static String CART = "cart";

  // static void flutterToast(String title, Color color,
  //     {ToastGravity toastGravity = ToastGravity.BOTTOM}) {
  //   Fluttertoast.showToast(
  //       msg: title,
  //       backgroundColor: color,
  //       gravity: toastGravity,
  //       toastLength: Toast.LENGTH_SHORT);
  // }
}
