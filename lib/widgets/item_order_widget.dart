import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/model/order.dart';
import 'package:seafoods/model/order_detail.dart';
import 'package:seafoods/widgets/app_column.dart';
import 'package:seafoods/widgets/app_row.dart';
import 'package:seafoods/widgets/dash_line.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemOrderWidget extends StatefulWidget {
  const ItemOrderWidget({super.key, required this.order, this.onTap});
  final Order order;
  final Function()? onTap;
  @override
  State<ItemOrderWidget> createState() => _ItemOrderWidgetState();
}

class _ItemOrderWidgetState extends State<ItemOrderWidget> {
  PageController _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(1, 2), blurRadius: 2)
          ]),
      // alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Order code: ${widget.order.orderCode}",
              style: AppText.textBold
                  .copyWith(color: AppColor.textColor, fontSize: 15),
            )),
        DashLineWidget(),
        Container(
            height: 120,
            child: PageView.builder(
              itemCount: widget.order.orderDetails!.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return buildItemProduct(widget.order.orderDetails![index]);
              },
            )),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.order.orderDetails!.length,
          effect: ExpandingDotsEffect(
              dotWidth: 8, dotHeight: 8, activeDotColor: AppColor.mainColor),
        ),
        DashLineWidget(),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment",
                style: AppText.textBold,
              ),
              Row(
                children: [
                  Text(
                    Dimesions.formatNumber(Caculate(
                            widget.order.totalPrice!,
                            widget.order.productFee!,
                            widget.order.productPriceCoupon!)) +
                        "đ",
                    style: AppText.textBold,
                  ),
                  if (widget.order.productPriceCoupon! < 100 &&
                      widget.order.productPriceCoupon! > 0)
                    Text(
                      "(Giảm ${widget.order.productPriceCoupon!}%)",
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  if (widget.order.productPriceCoupon! > 100)
                    Text(
                      "(Giảm ${Dimesions.formatNumber(widget.order.productPriceCoupon!.toDouble())} đ)",
                      style: TextStyle(color: Colors.redAccent),
                    )
                ],
              )
            ],
          ),
        ),
        widget.order.orderStatus == -1 || widget.order.orderStatus == 3
            ? Container(
                child: Center(
                  child: Text("Đơn hàng đã bị hủy",
                      style: TextStyle(color: AppColor.iconColor2)),
                ),
              )
            : widget.order.orderStatus == 4
                ? Container(
                    child: Center(
                    child: Text(
                      "Đơn hàng đã giao và đánh giá thành công",
                      style: TextStyle(color: AppColor.mainColor),
                    ),
                  ))
                : GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      alignment: Alignment.center,
                      child: widget.order.orderStatus == 0
                          ? Text(
                              "Cancel order",
                              style: AppText.textBold
                                  .copyWith(color: Colors.white),
                            )
                          : widget.order.orderStatus == 1
                              ? Text(
                                  "Đã nhận được hàng",
                                  style: AppText.textBold
                                      .copyWith(color: Colors.white),
                                )
                              : widget.order.orderStatus == 2
                                  ? Text("Đánh giá",
                                      style: AppText.textBold
                                          .copyWith(color: Colors.white))
                                  : Text(""),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: widget.order.orderStatus == 0
                              ? AppColor.textColor
                              : AppColor.iconColor2),
                    ),
                  ),
      ]),
    );
  }

  Widget buildItemProduct(OrderDetail orderDetail) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(orderDetail.productImage))),
        ),
        SizedBox(
          width: 10,
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 200,
            child: Text(
              orderDetail.productName,
              style: AppText.textBold
                  .copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
            ),
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
                    orderDetail.productSalesQuantity.toString(),
                    style: AppText.text
                        .copyWith(color: AppColor.mainColor, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Dimesions.formatNumber(
                            orderDetail.productPrice.toDouble()) +
                        "đ",
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
        ])
      ]),
    );
  }

  double Caculate(int total_price, int product_fee, int coupon) {
    double price = 0;
    if (coupon < 100) {
      price = total_price + product_fee - (total_price * coupon) / 100;
    } else {
      price = (total_price + product_fee - coupon).toDouble();
    }
    return price;
  }
}
