import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seafoods/Constant/colors.dart';
import 'package:seafoods/Constant/dismesions.dart';
import 'package:seafoods/Constant/style_text.dart';
import 'package:seafoods/helpers/image_helper.dart';
import 'package:seafoods/model/category.dart';
import 'package:seafoods/pages/container/appbar_presenter.dart';
import 'package:seafoods/pages/container/appbar_viewcontact.dart';
import 'package:seafoods/widgets/app_button.dart';

class AppBarContainerWidget extends StatefulWidget {
  const AppBarContainerWidget(
      {super.key,
      required this.child,
      this.title,
      this.implementBack = false,
      this.implementCart = false,
      this.titleString,
      this.tabBar = null,
      this.bottomNavigation = null,
      this.implementOrder = false,
      this.scaffoldKey,
      this.isBackgroundTransperent = false});

  final bool implementBack;
  final bool implementCart;
  final Widget? child;
  final String? titleString;
  final Widget? title;
  final TabBar? tabBar;
  final Widget? bottomNavigation;
  final bool implementOrder;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool? isBackgroundTransperent;
  @override
  State<AppBarContainerWidget> createState() => _AppBarContainerWidgetState();
}

class _AppBarContainerWidgetState extends State<AppBarContainerWidget>
    implements AppbarViewContact {
  late ExpandedTileController _controller;
  late AppbarPresenter appbarPresenter;

  List<CategoryModel> categoryList = [];
  bool isCategoryList = false;

  void initState() {
    super.initState();
    appbarPresenter = new AppbarPresenter(this);
    appbarPresenter!.getCategoryList();
    _controller = ExpandedTileController(isExpanded: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      backgroundColor: widget.isBackgroundTransperent!
          ? Colors.transparent
          : Colors.black12.withOpacity(0.03),
      body: Stack(children: [
        SizedBox(
          height: widget.implementOrder
              ? 150
              : widget.isBackgroundTransperent!
                  ? 100
                  : 100,
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            bottom: widget.tabBar,
            automaticallyImplyLeading: false,
            elevation: 0,
            shadowColor: Colors.white,
            scrolledUnderElevation: 0,
            title: Container(
              padding: const EdgeInsets.all(8.0),
              child: widget.title ??
                  Row(
                    children: [
                      if (widget.implementBack)
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColor.mainColor,
                          ),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      if (!widget.implementBack)
                        GestureDetector(
                          onTap: () {
                            print("haha1");
                            widget.scaffoldKey!.currentState?.openDrawer();
                          },
                          child: Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: AppColor.mainColor,
                            ),
                            child: Icon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Column(children: [
                            Text(
                              widget.titleString ?? "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: AppColor.mainColor),
                              textAlign: TextAlign.center,
                            )
                          ]),
                        ),
                      ),
                      if (widget.implementCart)
                        Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: AppColor.mainColor,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                    ],
                  ),
            ),
          ),
        ),
        Container(margin: EdgeInsets.only(top: 120), child: widget.child)
      ]),
      bottomNavigationBar: widget.bottomNavigation,
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 0,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 70, left: 0),
                  child: Center(
                    child: ImageHelper.loadFromAsset("assets/images/logo.jpg",
                        width: 100, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 28.0, left: 10, right: 10, bottom: 10),
                  child: AppButtonIconWidget(
                    label: "Searchs",
                    onTap: () {},
                    iconData: Icons.search,
                    colorIcon: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: ExpandedTile(
                      theme: const ExpandedTileThemeData(
                          headerColor: const Color(0xFF89dad0),
                          headerRadius: 30.0,
                          headerSplashColor: const Color(0xFF89dad0),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          contentRadius: 12.0,
                          contentBackgroundColor: Colors.white),
                      expansionAnimationCurve: Curves.easeIn,
                      controller: _controller,
                      title: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Category",
                            style: AppText.text
                                .copyWith(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                      content: isCategoryList
                          ? Container(
                              child: ListView.builder(
                                  itemCount: categoryList.length,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  // scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return ItemCategoryWidget(
                                        categoryList[index]);
                                  }),
                            )
                          : Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                  color: AppColor.mainColor),
                            ),
                      onTap: () {
                        debugPrint("tapped!!");
                      },
                      onLongTap: () {
                        debugPrint("long tapped!!");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ItemCategoryWidget(CategoryModel categoryModel) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.mainColor, width: 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(2, 2), blurRadius: 5)
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.set_meal_rounded,
              color: AppColor.mainColor,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              categoryModel.categoryName,
              style: AppText.textBold.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.mainColor),
            )
          ],
        ),
      ),
    );
  }

  @override
  void getCategoryListError(Object? e) {
    print("category: " + e.toString());
    Dimesions.flutterToast(e.toString(), Colors.redAccent);
    setState(() {
      isCategoryList = false;
    });
  }

  @override
  void getCategoryListSuccess(List<CategoryModel> list) {
    setState(() {
      isCategoryList = true;
      categoryList = list;
    });
    // print("2");
    // print(categoryList.toString());
  }
}
