import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/model/order.dart';
import 'package:seafoods/model/order_detail.dart';
import 'package:seafoods/pages/container/app_bar_widget.dart';
import 'package:seafoods/pages/evaluate/evaluate_controller.dart';
import 'package:seafoods/widgets/dash_line.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class EvaluatePage extends StatefulWidget {
  const EvaluatePage({super.key, required this.order});
  final Order order;
  @override
  State<EvaluatePage> createState() => _EvaluatePageState();
}

class _EvaluatePageState extends State<EvaluatePage> {
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _contentEditingController = TextEditingController();

  PageController _pageController = new PageController();
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
        implementBack: true,
        isBackgroundTransperent: false,
        implementOrder: false,
        implementCart: false,
        titleString: "Đánh giá sản phẩm",
        child: Container(
          width: double.maxFinite,
          // margin: EdgeInsets.only(top: 10),
          height: double.maxFinite,
          color: Colors.white,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Order code: ${widget.order.orderCode}",
                    style: AppText.textBold
                        .copyWith(color: AppColor.textColor, fontSize: 15),
                  )),
              DashLineWidget(),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 120,
                  child: PageView.builder(
                    itemCount: widget.order.orderDetails!.length,
                    controller: _pageController,
                    itemBuilder: (context, index) {
                      return buildItemProduct(
                          widget.order.orderDetails![index]);
                    },
                  )),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.order.orderDetails!.length,
                  effect: ExpandingDotsEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      activeDotColor: AppColor.mainColor),
                ),
              ),
              DashLineWidget(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  "Chất lượng sản phẩm ",
                  style: AppText.textBold,
                ),
              ),
              Container(
                // height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: AppColor.mainColor, width: 0.9)),
                child: TextField(
                  maxLines: null,
                  controller: _titleEditingController,
                  autofocus: false,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(vertical: 100),sấdsadadsd
                      hintText: "Enter the title",
                      focusColor: null,
                      border: InputBorder.none,
                      // icon: Icon(Icons.remove_red_eye_outlined),
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.3)),
                      fillColor: null,
                      helperMaxLines: null),
                  cursorColor: AppColor.mainColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 20),
                child: Text(
                  "Bình luận",
                  style: AppText.textBold,
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.mainColor, width: 0.9)),
                child: TextField(
                  maxLines: null,
                  controller: _contentEditingController,
                  autofocus: false,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  decoration: InputDecoration(
                      // contentPadding: EdgeInsets.symmetric(vertical: 100),sấdsadadsd
                      hintText: "Enter the comment...",
                      focusColor: null,
                      border: InputBorder.none,
                      // icon: Icon(Icons.remove_red_eye_outlined),
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.3)),
                      fillColor: null,
                      helperMaxLines: null),
                  cursorColor: AppColor.mainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RatingStars(
                    value: value,
                    starCount: 5,
                    starSpacing: 20,
                    onValueChanged: (v) {
                      setState(() {
                        value = v;
                      });
                    },
                    starColor: AppColor.mainColor,
                    starSize: 30,
                    valueLabelPadding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    valueLabelMargin: const EdgeInsets.only(right: 8),
                    maxValueVisibility: true,
                    valueLabelVisibility: true,
                    animationDuration: Duration(milliseconds: 1000)),
              ),
              Container(
                margin: EdgeInsets.all(30),
                child: GestureDetector(
                  onTap: () {
                    EvaluateController.insertEvaluate(
                        widget.order.orderCode!,
                        _titleEditingController.text,
                        _contentEditingController.text,
                        value.toInt());
                    Navigator.of(context).pop();
                    CherryToast.success(
                      title: Text("Đánh giá thành công"),
                    ).show(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    alignment: Alignment.center,
                    child: Text("Đánh giá",
                        style: AppText.textBold.copyWith(color: Colors.white)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColor.mainColor),
                  ),
                ),
              ),
            ]),
          ),
        ));
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
}
