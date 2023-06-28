import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/widgets/app_column.dart';
import 'package:seafoods/widgets/app_row.dart';
import 'package:seafoods/widgets/dash_line.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemOrderWidget extends StatefulWidget {
  const ItemOrderWidget({super.key});

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
              "Order code: 21IT431",
              style: AppText.textBold
                  .copyWith(color: AppColor.textColor, fontSize: 15),
            )),
        DashLineWidget(),
        Container(
            height: 120,
            child: PageView.builder(
              itemCount: 3,
              controller: _pageController,
              itemBuilder: (context, index) {
                return buildItemProduct();
              },
            )),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
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
              Text(
                "\$12332",
                style: AppText.textBold,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          alignment: Alignment.center,
          child: Text(
            "Cancel order",
            style: AppText.textBold.copyWith(color: Colors.white),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.textColor),
        ),
      ]),
    );
  }

  Widget buildItemProduct() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ImageHelper.loadFromAsset("assets/images/food1.jpg",
            radius: BorderRadius.circular(10)),
        SizedBox(
          width: 10,
        ),
        AppRow(),
      ]),
    );
  }
}
