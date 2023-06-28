import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/widgets/app_icon.dart';
import 'package:seafoods/widgets/expandable_text_widget.dart';

class RecommendFoodDetail extends StatefulWidget {
  const RecommendFoodDetail({super.key});

  @override
  State<RecommendFoodDetail> createState() => _RecommendFoodDetailState();
}

class _RecommendFoodDetailState extends State<RecommendFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 64,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconData: Icons.close),
                AppIcon(iconData: Icons.shopping_cart_outlined),
              ],
            ),
            backgroundColor: AppColor.mainColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: Text(
                  "Chinese Side",
                  style: AppText.textBold,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: ImageHelper.loadFromAsset("assets/images/food1.jpg",
                    width: double.maxFinite, fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ExpandableTextWidget(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppIcon(
              iconData: Icons.remove,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
            ),
            Text(
              "\$12.88" + " X " + "0",
              style: AppText.textBold,
            ),
            AppIcon(
              iconData: Icons.add,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 100,
          padding: EdgeInsets.only(top: 30, bottom: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20 * 2),
                  topRight: Radius.circular(20 * 2)),
              color: Colors.black12.withOpacity(0.09)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Icon(
                Icons.favorite,
                color: AppColor.mainColor,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              alignment: Alignment.center,
              child: Text(
                "\$10 | Add to cart",
                style: AppText.textBold.copyWith(color: Colors.white),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.mainColor),
            ),
          ]),
        ),
      ]),
    );
  }
}
