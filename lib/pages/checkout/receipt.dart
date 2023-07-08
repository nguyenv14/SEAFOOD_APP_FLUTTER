import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/model/order.dart';
import 'package:seafoods/pages/home/home_page.dart';
import 'package:seafoods/pages/home/main_page.dart';
import 'package:seafoods/widgets/dash_line.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key, required this.order});
  final Order order;
  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
            (route) => false);
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(40)),
                child: ImageHelper.loadFromAsset("assets/images/checked.png",
                    width: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Payment Success",
              style: AppText.textBold.copyWith(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: DashLineWidget(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order_code",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.order.orderCode!,
                        style: AppText.textBold
                            .copyWith(fontSize: 15, color: Colors.black45),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Receiver",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.order.shipping!.shippingName,
                        style: AppText.textBold.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phone receiver",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        "0" + widget.order.shipping!.shippingPhone.toString(),
                        style: AppText.textBold.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date Time",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.order.createdAt!,
                        style: AppText.textBold.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (widget.order.productPriceCoupon != 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon",
                          style: AppText.textBold.copyWith(fontSize: 17),
                        ),
                        Text(
                          widget.order.productCoupon!,
                          style: AppText.textBold
                              .copyWith(fontSize: 15, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total quantity",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        widget.order.totalQuantity.toString(),
                        style: AppText.textBold.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DashLineWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment",
                        style: AppText.textBold.copyWith(fontSize: 17),
                      ),
                      Text(
                        Dimesions.formatNumber(
                                widget.order.totalPrice!.toDouble()) +
                            "đ",
                        style: AppText.textBold.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppColor.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Finished",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
