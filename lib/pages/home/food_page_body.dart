import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/model/product.dart';
import 'package:seafoods/model/slider.dart';
import 'package:seafoods/pages/food/popular_food_detail.dart';
import 'package:seafoods/pages/home/home_page_presenter.dart';
import 'package:seafoods/pages/home/home_page_view_contact.dart';
import 'package:seafoods/widgets/icon_and_text_widget.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody>
    implements HomePageViewContact {
  HomePagePresenter? homePagePresenter;

  List<Product> productList = [];
  bool isLoadingRecommend = false;

  List<SliderModel> sliderList = [];

  List<Product> productPopularList = [];
  bool isLoadingPopular = false;

  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double height = Dimesions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    homePagePresenter = HomePagePresenter(this);
    homePagePresenter!.loadProductPopular();
    homePagePresenter!.loadSliderList();
    homePagePresenter!.loadProductRecommend();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        print("current value is: " + _currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 140,
            margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  autoPlayCurve: Curves.easeIn),
              items: sliderList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: NetworkImage(item.sliderImage),
                            fit: BoxFit.cover,
                          ),
                        ));
                  },
                );
              }).toList(),
            )),
        Container(
          child: isLoadingRecommend
              ? Container(
                  child: Column(children: [
                    Container(
                      height: Dimesions.pageView,
                      child: PageView.builder(
                          controller: pageController,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            return _buildPageItem(index, productList[index]);
                          }),
                    ),
                    new DotsIndicator(
                      dotsCount: productList.length ?? 0,
                      position: _currentPageValue.round(),
                      decorator: DotsDecorator(
                        activeColor: AppColor.mainColor,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ]),
                )
              : Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(
                    color: AppColor.mainColor,
                  ),
                ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              Text(
                "Popular",
                style: AppText.textBold.copyWith(fontSize: 25),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "-",
                  style: AppText.textBold
                      .copyWith(color: Colors.black12, fontSize: 25),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Food pairing",
                style: AppText.text.copyWith(color: Colors.black12),
              ),
            ],
          ),
        ),
        isLoadingPopular
            ? Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: productPopularList.length,
                      itemBuilder: (context, index) {
                        return ItemProductPopular(productPopularList[index]);
                      }),
                ),
              )
            : Container(
                padding: EdgeInsets.all(30),
                child: CircularProgressIndicator(
                  // backgroundColor: AppColor.mainColor,
                  color: AppColor.mainColor,
                ),
              ),
      ],
    );
  }

  Widget ItemProductPopular(Product product) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white38,
                boxShadow: [
                  // BoxShadow(
                  // color: Colors.black38,
                  // offset: Offset(1, 1),
                  // blurRadius: 2)
                ],
                image: DecorationImage(
                    image: NetworkImage(
                      product.productImage!,
                    ),
                    fit: BoxFit.cover)),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PopularFoodDetail(
                              product: product,
                            )));
              },
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName!,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.textBold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.categoryName!,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppText.text.copyWith(color: Colors.black26),
                            ),
                            Text(
                              Dimesions.formatNumber(product.productPrice!) +
                                  "đ",
                              style: AppText.text
                                  .copyWith(color: Colors.redAccent),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconAndTextWidget(
                                icon: Icons.circle_sharp,
                                text: "Normal",
                                iconColor: AppColor.iconColor1),
                            IconAndTextWidget(
                                icon: Icons.location_on,
                                text: "1.7km",
                                iconColor: AppColor.mainColor),
                            IconAndTextWidget(
                                icon: Icons.access_time_rounded,
                                text: "32 min",
                                iconColor: AppColor.iconColor2),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPageItem(int index, Product product) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix4,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PopularFoodDetail(
                        product: product,
                      )));
        },
        child: Stack(children: [
          Container(
            height: Dimesions.pageViewContainer,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.productImage!),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimesions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 25, right: 25, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 2)
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              product.productName!,
                              style: AppText.textBold.copyWith(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            Dimesions.formatNumber(product.productPrice!) + "đ",
                            style: AppText.text.copyWith(
                                color: Colors.redAccent, fontSize: 15),
                          )
                        ],
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
                                color: AppColor.mainColor,
                                size: 15,
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4.5",
                            style: AppText.text
                                .copyWith(color: AppColor.textColor),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            product.commentList!.length.toString(),
                            style: AppText.text
                                .copyWith(color: AppColor.textColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "comments",
                            style: AppText.text
                                .copyWith(color: AppColor.textColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconAndTextWidget(
                              icon: Icons.remove_red_eye,
                              text: product.productViewer.toString(),
                              iconColor: AppColor.iconColor1),
                          IconAndTextWidget(
                              icon: Icons.category,
                              text: product.categoryName!,
                              iconColor: AppColor.mainColor),
                          IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "32 min",
                              iconColor: AppColor.iconColor2),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void loadProductRecommendSuccess(List<Product> list) {
    setState(() {
      productList = list;
      isLoadingRecommend = true;
    });
  }

  @override
  void loadProductRecommentError() {
    setState(() {
      isLoadingRecommend = false;
    });
  }

  @override
  void loadProductPopularError() {
    setState(() {
      isLoadingPopular = false;
    });
  }

  @override
  void loadProductPopularSuccess(List<Product> list) {
    setState(() {
      productPopularList = list;
      isLoadingPopular = true;
    });
  }

  @override
  void loadSliderListSuccess(List<SliderModel> list) {
    setState(() {
      sliderList = list;
    });
  }
}
